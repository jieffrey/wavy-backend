# Panduan Testing API — Wavy Backend

Dokumen ini untuk testing manual seluruh endpoint. Base URL: `http://localhost:1420/api/v1`.

## Setup

```bash
bun install
# isi .env (PORT, DATABASE_URL, JWT_SECRET, SMTP_*, ADMIN_EMAIL, ADMIN_PASSWORD)
bun scripts/seed-admin.ts   # buat admin pertama (sekali saja)
bun scripts/migrate-order-rules.ts   # migration aturan order (idempotent)
bun scripts/migrate-paid-at.ts       # kolom orders.paid_at + backfill (idempotent)
bun scripts/migrate-payment.ts       # kolom orders.payment_ref & payment_type (idempotent)
bun scripts/migrate-organizer-verification.ts  # kolom verifikasi organizer (idempotent)
bun run dev                 # atau: bun src/index.ts
bun run typecheck           # cek tipe
```

### Membuat / mengganti akun admin

Akun admin tidak bisa daftar sendiri. Buat lewat script (menulis ke database di `DATABASE_URL`, yaitu Neon kalau pakai `.env`):

```bash
bun scripts/create-admin.ts --email admin@contoh.id --name "Nama Admin" --password "password-minimal-8"
```

- Email belum ada → admin baru dibuat. Email sudah ada → nama & password diganti (tidak ada baris dobel).
- Password di-hash dengan bcryptjs cost 10, sama dengan yang dicek `POST /admin/login`.
- Password tidak pernah dicetak ke log. Karena dikirim lewat argumen, hapus dari riwayat shell setelahnya
  (mis. jalankan dengan spasi di depan perintah bila `HISTCONTROL=ignorespace`).
- Email disimpan apa adanya (hanya di-trim) dan login mencocokkan email persis, jadi pakai huruf yang sama saat login.
- Coba ke database lokal dulu: `DATABASE_URL=postgres://postgres:postgres@localhost:5432/wavy_test DATABASE_SSL=disable bun scripts/create-admin.ts ...`

## Test otomatis (`bun test`)

Test aturan order (`tests/order-rules.test.ts`) butuh **Postgres lokal** terpisah dan tidak pernah memakai `DATABASE_URL` dari `.env`.

```bash
createdb wavy_test   # sekali saja; nama wajib berakhiran _test
TEST_DATABASE_URL=postgres://postgres:<password>@localhost:5432/wavy_test bun test
```

- Setiap run, skema `public` di database test di-DROP lalu dibangun ulang dari `tests/fixtures/schema.sql` + migration.
- Preload menolak jalan kalau `TEST_DATABASE_URL` kosong, host-nya bukan lokal, atau nama database tidak berakhiran `_test`.
- SSL otomatis dimatikan untuk test (`DATABASE_SSL=disable`).

Kredensial default test yang dipakai di dokumen ini:

| Role | Email | Password |
|------|-------|----------|
| Admin | dari `.env` `ADMIN_EMAIL` | dari `.env` `ADMIN_PASSWORD` |
| Organizer | `organizer@test.com` | `password123` |
| Customer | `customer@test.com` (login via OTP) | — |

## Header Auth

Semua route yang butuh login memakai `Authorization: Bearer <token>`:

| Role | Claim di JWT | Header token dari |
|------|--------------|-------------------|
| Admin | `admin_id` | `POST /admin/login` |
| Organizer | `organizer_id` | `POST /auth/organizer/login` |
| Customer | `customer_id` | `POST /auth/verify-otp` |

Contoh: `curl -H "Authorization: Bearer eyJ..." ...`

---

## 1. Health & Auth

| # | Method | Path | Auth | Deskripsi |
|---|--------|------|------|-----------|
| 1.1 | GET | `/health` | — | Cek server hidup, respon `{ "status": "ok" }` |
| 1.2 | POST | `/auth/organizer/login` | — | Login organizer |
| 1.2a | POST | `/auth/register` | — | Daftar customer `{ name, email }` → simpan nama + kirim OTP (lanjut `/auth/verify-otp`). Email yang sudah punya nama → `409 EMAIL_REGISTERED` |
| 1.3 | POST | `/auth/send-otp` | — | Kirim OTP ke email customer |
| 1.4 | POST | `/auth/verify-otp` | — | Verifikasi OTP → token customer |

**1.2** Login organizer — `{ "email": "organizer@test.com", "password": "password123" }`
→ `200` `{ "access_token": "...", "organizer": { id, name, email } }`
→ `401` `{ "error": "invalid email or password" }` (salah email/password)
→ `429` `{ "error": "too many login attempts..." }` (setelah 5× gagal dalam 15 menit)

**1.3** Kirim OTP — `{ "email": "customer@test.com" }`
→ `200` `{ "message": "OTP sent to email" }`
→ `429` setelah 3× dalam 5 menit (cek DB `otp_codes`).

**1.4** Verifikasi OTP — `{ "email": "customer@test.com", "code": "123456" }`
→ `200` `{ "access_token": "...", "customer": { id, name, email } }`
→ `401` kode salah/kedaluwarsa; `429` setelah 5× percobaan gagal.

> Catatan: OTP dikirim lewat email sungguhan (SMTP Gmail). Ambil kode dari inbox test.

---

## 2. Publik: Homepage & Concert

| # | Method | Path | Auth | Deskripsi |
|---|--------|------|------|-----------|
| 2.1 | GET | `/homepage` | — | Homepage: featured events, popular artists, top organizers |
| 2.2 | GET | `/concerts` | — | List konser published + closed (draft tersembunyi); filter `?category=` & `?q=` |
| 2.3 | GET | `/concerts/:id` | — | Detail konser + kategori + rating/review + countdown |

**2.1** → `200` `{ featured_events[], popular_artists[], organizers[] }`
- `featured_events`: konser `published` dengan `date >= now()`, urut tanggal, max 6, tiap item ada `remaining_ticket` (rumus sama dengan `/concerts`: dikurangi order pending aktif) dan `sales_status`.
- `popular_artists`: urut `follower_count` DESC.
- `organizers`: urut `follower_count` DESC.

**2.2** — `GET /concerts?category=Rock&q=Dewa` → `200` array.
- Filter `category` cocok dgn kolom `events.category`.
- `q` mencocokkan `title` atau nama artist (case-insensitive).

**2.3** → `200` `{ ...event, ticket_categories[], reviews[], avg_rating, review_count, countdown_seconds }`
- `countdown_seconds` = detik tersisa ke tanggal konser (0 jika sudah lewat).
- `sales_status`: `upcoming` | `open` | `closed` | `sold_out` (sumber: `src/utils/sales-status.ts`), plus `sales_start_at` / `sales_end_at` (null = tanpa batas). Tiap `ticket_categories[]` punya `sales_status` sendiri: `sold_out` jika `remaining` 0, selain itu ikut event. Daftar `/concerts` juga mengirim `sales_status` + tenggat.
- `avg_rating`/`review_count` dari tabel `reviews`.
- `404` jika konser tidak ada atau masih `draft`. Event `closed` tetap `200` dengan `sales_status: "closed"`.

---

## 3. Organizer (Auth: `organizer_id`)

Base: `/api/v1/organizer`

| # | Method | Path | Auth | Deskripsi |
|---|--------|------|------|-----------|
| 3.1 | GET | `/events` | ✓ | List event milik organizer |
| 3.2 | POST | `/events` | ✓ | Buat event (draft) |
| 3.3 | GET | `/events/:id` | ✓ | Detail event + kategori |
| 3.4 | PUT | `/events/:id` | ✓ | Update event |
| 3.5 | DELETE | `/events/:id` | ✓ | Hapus event |
| 3.6 | POST | `/events/:id/publish` | ✓ | Publish → buka penjualan + notif follower |
| 3.7 | POST | `/events/:id/close-sales` | ✓ | Tutup penjualan (status `closed`) |
| 3.8 | GET | `/events/:id/ticket-categories` | ✓ | List kategori tiket |
| 3.9 | POST | `/events/:id/ticket-categories` | ✓ | Buat kategori tiket |
| 3.10 | PUT | `/ticket-categories/:id` | ✓ | Update kategori (quota ≥ sold + pending aktif) |
| 3.11 | DELETE | `/ticket-categories/:id` | ✓ | Hapus kategori |
| 3.12 | GET | `/artists` | ✓ | List artist |
| 3.13 | POST | `/artists` | ✓ | Buat artist |
| 3.14 | PUT | `/artists/:id` | ✓ | Update artist |
| 3.15 | DELETE | `/artists/:id` | ✓ | Hapus artist |
| 3.16 | GET | `/dashboard` | ✓ | Statistik revenue, tiket, kategori populer, jam puncak |
| 3.17 | GET | `/orders` | ✓ | List order; filter `?status=` & `?event_id=` |
| 3.21 | GET | `/me` | ✓ | Profil organizer login |
| 3.22 | GET | `/dashboard/sales` | ✓ | Penjualan harian (`?days=`) |
| 3.23 | GET | `/orders/:id` | ✓ | Detail order + tiket |
| 3.18 | POST | `/orders/:id/verify` | ✓ | Approve/reject pembayaran manual |
| 3.19 | POST | `/orders/:id/refund` | ✓ | Refund order paid (sebelum event lewat) |
| 3.20 | POST | `/scan/validate` | ✓ | Scan & validasi QR tiket |

**3.2** Body: `{ "title","artist_id","category","venue","date","poster_url","description" }` — `date` string (ISO).
→ `201` event. Status default `draft`.

**3.6** Publish → `200` event `status: "published"`.
`400` `{ error: { code: "NO_TICKET_CATEGORY" } }` jika event belum punya kategori tiket.
Saat publish, follower organizer/artist + subscriber notify-me dapat notifikasi (cek tabel `notifications`).

**3.9** Body: `{ "name", "price", "quota" }` → `201`.
**3.1 / 3.3** Tiap event punya `sales_status`, `artist_name`, `total_quota`, `total_sold`, `total_pending` (qty order pending belum expired), `total_remaining`. Detail: tiap `ticket_categories[]` + `pending`, `remaining`, `sales_status`.

**3.2 / 3.4** Validasi → `400` `VALIDATION_ERROR`: `title` kosong, `sales_end_at` > `date`, `sales_start_at` ≥ `date`, `sales_end_at` ≤ `sales_start_at`. PUT memeriksa ulang setelah digabung dengan nilai tersimpan.

**3.5 / 3.11** Event/kategori yang sudah punya order (status apa pun) → `409` `EVENT_HAS_ORDERS` / `CATEGORY_HAS_ORDERS`.

**3.9 / 3.10** `{ "name", "price", "quota" }` — `name` tidak kosong, `price` ≥ 0 (`400` `VALIDATION_ERROR`). PUT → `400` `QUOTA_BELOW_RESERVED` jika `quota < sold + pending aktif`.

**3.21** `GET /me` → `200` `{ id, name, email, status }`.

**3.16** `GET /dashboard` → field lama (`revenue`, `ticket_sold`, `remaining_ticket` = quota − sold − pending aktif, `popular_category`, `peak_purchase_hour`) + `kpi: { revenue, tickets_sold, pending_reserved, checked_in, revenue_7d, revenue_prev_7d, sold_7d, sold_prev_7d }` (7d = jendela bergulir 7×24 jam berdasarkan `paid_at`), `per_category[]: { event_id, event_title, category_id, name, quota, sold, pending, remaining, revenue }`, `recent_orders[]` (5 terbaru, bentuk sama dengan 3.17).

**3.22** `GET /dashboard/sales?days=30` (1–365, default 30; di luar itu `400` `VALIDATION_ERROR`) → `[{ date: "YYYY-MM-DD", tickets, revenue }]`, satu baris per hari (tanggal Asia/Jakarta, hari kosong = 0) dari order `paid` berdasarkan `paid_at`.

**3.17** `GET /orders?status=&event_id=` → kolom `orders` (termasuk `paid_at` + data pemesan) + `event_title`, `category_name`, `customer_name`, `customer_email`. Order pending lewat waktu ditandai `expired` (lazy).
**3.23** `GET /orders/:id` → baris yang sama + `tickets: [{ id, is_scanned }]`; `404` jika bukan order event milik organizer.

**3.18** Body: `{ "approve": true }`
- Approve → transaksi: order `paid`, `sold += quantity`, buat 1 tiket per quantity (QR JWT). → `200`.
- Reject → `200`, lalu top-N waiting list dapat notif "Slot tiket tersedia".
- `400` jika status bukan `pending_payment`.

**3.19** `POST /orders/:id/refund` (tanpa body)
- Syarat: status `paid`, tanggal konser belum lewat.
- Efek: order `refunded`, `sold -= quantity`, tiket dihapus (QR invalid), waiting list dapat notif.
- `400` jika bukan `paid` / event sudah lewat.

**3.20** Body: `{ "qr_code": "<token>" }`
→ `200` `{ message: "ticket valid", ticket: {...} }`
→ `200` `ticket` = `{ id, order_id, event_id, title, date, venue, category_name }`
→ `400` `INVALID_QR` / `QR_EXPIRED` / `EVENT_ENDED`
→ `409` `ALREADY_SCANNED` (atomik: scan bersamaan hanya satu yang lolos)
→ `403` `WRONG_ORGANIZER`
→ `404` `TICKET_NOT_FOUND`

---

## 4. Customer (Auth: `customer_id`)

| # | Method | Path | Auth | Deskripsi |
|---|--------|------|------|-----------|
| 4.1 | POST | `/orders` | ✓ | Buat order (qty 1–4) |
| 4.2 | GET | `/orders/history` | ✓ | Riwayat order (+ `event_title`, `category_name`, `poster_url`, `event_date`, `venue`) |
| 4.3 | GET | `/orders/:id` | ✓ | Detail order (kolom tambahan sama dengan 4.2) |
| 4.4 | GET | `/me/level` | ✓ | Level gamifikasi dari jumlah konser berbay |

**4.1** Body: `{ "event_id", "ticket_category_id", "quantity" }` → `201`
- `400` jika kategori bukan milik event / stok kurang.
- `quantity` min 1 max 4.

**4.4** → `200` `{ attended_concerts, level, level_label }`
Level: 1 Pengunjung (0), 2 Newbie (1–2), 3 Fan (3–4), 4 Super Fan (5–9), 5 Legend (≥10).

---

## 5. Tiket (Auth: `customer_id`)

| # | Method | Path | Auth | Deskripsi |
|---|--------|------|------|-----------|
| 5.1 | GET | `/tickets` | ✓ | Wallet "My Tickets" (by owner) |
| 5.2 | GET | `/tickets/:id` | ✓ | Detail tiket + QR token |
| 5.3 | POST | `/tickets/:id/transfer` | ✓ | Transfer kepemilikan ke email customer lain |

**5.1** → `200` array tiket milik owner (bukan pemilik order).
**5.3** Body: `{ "to_email": "budi@test.com" }`
- Syarat: target customer sudah terdaftar, bukan diri sendiri, tiket belum discan, event belum lewat.
- `404` jika tiket/target tidak ada; `400` transfer ke diri sendiri / sudah discan / event selesai.

---

## 6. Marketplace Sosial (Auth: `customer_id`)

| # | Method | Path | Auth | Deskripsi |
|---|--------|------|------|-----------|
| 6.1 | POST | `/events/:id/reviews` | ✓ | Kasih rating 1–5 + komentar |
| 6.2 | GET | `/events/:id/reviews` | — | List review |
| 6.3 | GET | `/favorites` | ✓ | List favorit |
| 6.4 | POST | `/favorites/organizers/:id` | ✓ | Follow organizer |
| 6.5 | DELETE | `/favorites/organizers/:id` | ✓ | Unfollow organizer |
| 6.6 | POST | `/favorites/artists/:id` | ✓ | Follow artist |
| 6.7 | DELETE | `/favorites/artists/:id` | ✓ | Unfollow artist |
| 6.8 | GET | `/notifications` | ✓ | List notifikasi |
| 6.9 | POST | `/notifications/:id/read` | ✓ | Tandai baca |
| 6.10 | POST | `/concerts/:id/notify-me` | ✓ | Subscribe notifikasi buka penjualan |
| 6.11 | DELETE | `/concerts/:id/notify-me` | ✓ | Batal subscribe |

**6.1** Body: `{ "rating": 5, "comment": "keren" }` → `201`
- `400` jika belum punya tiket `paid` di event itu, atau sudah pernah review.
- Rating wajib 1–5 integer; komentar opsional.

**6.8** → `200` array notifikasi (`read` boolean). **6.9** → `200` `{ message }`, `404` jika bukan milik customer.

---

## 7. Admin (Auth: `admin_id`)

Base: `/api/v1/admin`

| # | Method | Path | Auth | Deskripsi |
|---|--------|------|------|-----------|
| 7.1 | POST | `/admin/login` | — | Login admin |
| 7.1a | GET | `/admin/me` | ✓ | Profil admin dari token: `{ id, name, email }` |
| 7.2 | GET | `/admin/stats` | ✓ | KPI: organizer per status (`active_/pending_/suspended_/rejected_organizer_count`), `customer_count`, `event_count`, `published_event_count`, `order_count`, `paid_order_count`, `ticket_sold`, `revenue`, `orders_by_status{pending_payment,paid,expired,rejected,refunded}` (pending kedaluwarsa di-expire dulu) |
| 7.2a | GET | `/admin/stats/daily?days=30` | ✓ | Per hari WIB (1–365 hari): `[{ date, orders, tickets, revenue }]` dari order `paid` berdasarkan `paid_at`; hari kosong = 0 |
| 7.2b | GET | `/admin/stats/top-events?limit=5` | ✓ | Event terlaris (1–20): `[{ id, title, status, organizer_name, tickets_sold, revenue }]`, hanya order `paid` |
| 7.2c | GET | `/admin/orders/recent?limit=8` | ✓ | Order terbaru (1–50): `[{ id, status, quantity, total_price, created_at, paid_at, event_id, event_title, organizer_name, customer_name }]` |
| 7.3 | GET | `/admin/organizers?status=` | ✓ | List organizer + event_count + revenue + `email_verified_at`, `reviewed_at`, `rejection_reason`. `status` opsional (`pending_verification` = antrean verifikasi, urut terlama) |
| 7.3a | GET | `/admin/organizers/:id` | ✓ | `{ organizer, events[{…, quota, sold, revenue}], summary{event_count, published_count, paid_order_count, pending_order_count, ticket_sold, revenue} }`; `404` jika tidak ada |
| 7.4 | PATCH | `/admin/organizers/:id` | ✓ | Body `{ status, reason? }`. Transisi: `pending_verification`→`active` (setujui) / `rejected` (tolak, `reason` ≥ 10 karakter); `active`↔`suspended`. Lainnya `409 INVALID_STATUS_TRANSITION`. Setujui/tolak mengirim email ke EO (`email_sent`: true/false; null bila tidak ada email) |
| 7.5 | GET | `/admin/events` | ✓ | List semua event |
| 7.6 | GET | `/admin/customers` | ✓ | List customer + order_count + spend |

**7.1** Body: `{ "email": "ADMIN_EMAIL", "password": "ADMIN_PASSWORD" }` → `200` token.
**7.4** Body: `{ "status": "suspended" }` → `200`; organizer suspended **tidak bisa login** (cek #1.2).

---

## 8. Anti-Scalper & Inovasi (Auth: `customer_id`)

| # | Method | Path | Auth | Deskripsi |
|---|--------|------|------|-----------|
| 8.1 | POST | `/concerts/:id/waiting-room` | ✓ | Masuk waiting room |
| 8.2 | GET | `/concerts/:id/waiting-room` | ✓ | Posisi & total antrean |
| 8.3 | POST | `/concerts/:id/waiting-list` | ✓ | Masuk waiting list (auto-offer) |
| 8.4 | DELETE | `/concerts/:id/waiting-list` | ✓ | Keluar waiting list |

**8.1** → `200` `{ message, position, total }` — posisi acak-adil (permutasi `md5(customer_id)`), idempoten.
**8.2** → `200` `{ joined, position, total }` (`position: null` jika belum join).
**8.3** → `200` `{ message, position }` (urutan join, FIFO). Posisi 1 = dapat tawaran duluan saat reject/refund.

---

## 9. Skenario Alur Transaksi Lengkap (End-to-End)

```
1. POST /auth/organizer/login                → token organizer
2. POST /auth/send-otp {customer@test.com}   → OTP masuk email
3. POST /auth/verify-otp {code}              → token customer

4. POST /organizer/artists                   → artist_id
5. POST /organizer/events                    → event_id (draft)
6. POST /organizer/events/:id/ticket-categories → category_id
7. POST /organizer/events/:id/publish        → status published

8. GET  /homepage, /concerts, /concerts/:id  → konser tampil (publik)
9. POST /favorites/artists/:artist_id        → follow (2 customer berbeda)
10. POST /concerts/:id/notify-me             → subscribe (customer lain)

11. POST /orders {event_id, category_id, qty:2}  → order_id (pending_payment)
12. POST /organizer/orders/:id/verify {approve:true}
      → order paid, sold +2, 2 tiket dibuat (cek /tickets)
13. GET  /tickets                            → wallet berisi 2 tiket
14. POST /tickets/:id/transfer {to_email}    → kepemilikan pindah ke customer lain

15. POST /organizer/scan/validate {qr_code}  → "ticket valid"
16. POST /organizer/scan/validate {qr_code}  lagi → "ticket already scanned"

17. POST /events/:id/reviews {rating:5}      → review masuk (punya tiket paid)
18. GET  /concerts/:id                       → avg_rating, review_count terisi

19. POST /organizer/orders/:id/refund        → sold turun, tiket invalid,
                                               waiting list dapat notif
20. GET  /admin/login, /admin/stats          → super admin memantau
```

## Check-list Status

- [ ] Server start tanpa error, `/health` ok
- [ ] `bun run typecheck` bersih
- [ ] Semua endpoint publik bisa diakses tanpa token
- [ ] Endpoint ber-auth menolak tanpa `Authorization` → `401`
- [ ] Rate-limit: login/OTP → `429` setelah melewati batas
- [ ] Route yang harus diblokir: transfer ke diri sendiri, review ganda, scan ulang, refund bukan `paid`, admin PATCH status invalid → error sesuai

## Pembayaran Midtrans (Snap sandbox)

Env: `MIDTRANS_SERVER_KEY`, `MIDTRANS_CLIENT_KEY`, `MIDTRANS_IS_PRODUCTION=false`. Panduan lengkap: `wavy-next/docs/MIDTRANS.md`.

| Method | Path | Auth | Keterangan |
|--------|------|------|------------|
| POST | `/orders/:id/pay` | customer | Buat transaksi Snap → `{ token, redirect_url }`. 409 `ORDER_EXPIRED` / `ORDER_NOT_PENDING`, 503 `PAYMENT_NOT_CONFIGURED`, 502 `PAYMENT_GATEWAY_ERROR`. |
| GET | `/orders/:id/payment-status` | customer | Tanya status ke Midtrans lalu terapkan (untuk localhost tanpa webhook) → `{ status, outcome }`. |
| POST | `/payments/midtrans/notification` | — (signature) | Webhook Midtrans. 403 `INVALID_SIGNATURE` bila `signature_key` salah. Idempoten. |

- `order_id` Midtrans = `WAVY-<id order>-<acak>`, unik per percobaan; yang terakhir disimpan di `orders.payment_ref`.
- `settlement` / `capture` (fraud accept) → lunas lewat `markOrderPaid` (sama dengan approve EO).
- `expire` / `cancel` / `deny` dari percobaan terakhir → `expired`, kuota lepas.
- Test: `tests/payment.test.ts` (Midtrans di-mock).
