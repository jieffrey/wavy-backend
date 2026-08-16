# Panduan Testing API — Wavy Backend

Dokumen ini untuk testing manual seluruh endpoint. Base URL: `http://localhost:1420/api/v1`.

## Setup

```bash
bun install
# isi .env (PORT, DATABASE_URL, JWT_SECRET, SMTP_*, ADMIN_EMAIL, ADMIN_PASSWORD)
bun scripts/seed-admin.ts   # buat admin pertama (sekali saja)
bun run dev                 # atau: bun src/index.ts
bun run typecheck           # cek tipe
```

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
| 2.2 | GET | `/concerts` | — | List konser published; filter `?category=` & `?q=` |
| 2.3 | GET | `/concerts/:id` | — | Detail konser + kategori + rating/review + countdown |

**2.1** → `200` `{ featured_events[], popular_artists[], organizers[] }`
- `featured_events`: konser `published` dengan `date >= now()`, urut tanggal, max 6, tiap item ada `remaining_ticket`.
- `popular_artists`: urut `follower_count` DESC.
- `organizers`: urut `follower_count` DESC.

**2.2** — `GET /concerts?category=Rock&q=Dewa` → `200` array.
- Filter `category` cocok dgn kolom `events.category`.
- `q` mencocokkan `title` atau nama artist (case-insensitive).

**2.3** → `200` `{ ...event, ticket_categories[], reviews[], avg_rating, review_count, countdown_seconds }`
- `countdown_seconds` = detik tersisa ke tanggal konser (0 jika sudah lewat).
- `avg_rating`/`review_count` dari tabel `reviews`.
- `404` jika konser tidak ada / belum `published`.

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
| 3.10 | PUT | `/ticket-categories/:id` | ✓ | Update kategori (quota ≥ sold) |
| 3.11 | DELETE | `/ticket-categories/:id` | ✓ | Hapus kategori |
| 3.12 | GET | `/artists` | ✓ | List artist |
| 3.13 | POST | `/artists` | ✓ | Buat artist |
| 3.14 | PUT | `/artists/:id` | ✓ | Update artist |
| 3.15 | DELETE | `/artists/:id` | ✓ | Hapus artist |
| 3.16 | GET | `/dashboard` | ✓ | Statistik revenue, tiket, kategori populer, jam puncak |
| 3.17 | GET | `/orders` | ✓ | List order; filter `?status=pending_payment/paid/rejected/refunded` |
| 3.18 | POST | `/orders/:id/verify` | ✓ | Approve/reject pembayaran manual |
| 3.19 | POST | `/orders/:id/refund` | ✓ | Refund order paid (sebelum event lewat) |
| 3.20 | POST | `/scan/validate` | ✓ | Scan & validasi QR tiket |

**3.2** Body: `{ "title","artist_id","category","venue","date","poster_url","description" }` — `date` string (ISO).
→ `201` event. Status default `draft`.

**3.6** Publish → `200` event `status: "published"`.
Saat publish, follower organizer/artist + subscriber notify-me dapat notifikasi (cek tabel `notifications`).

**3.9** Body: `{ "name", "price", "quota" }` → `201`.
**3.10** `{ "name", "price", "quota" }` → `400` jika `quota < sold`.

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
→ `400` QR invalid/expired/event ended/`ticket already scanned`
→ `403` `ticket does not belong to your event`
→ `404` `ticket not found`

---

## 4. Customer (Auth: `customer_id`)

| # | Method | Path | Auth | Deskripsi |
|---|--------|------|------|-----------|
| 4.1 | POST | `/orders` | ✓ | Buat order (qty 1–4) |
| 4.2 | GET | `/orders/history` | ✓ | Riwayat order |
| 4.3 | GET | `/orders/:id` | ✓ | Detail order |
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
| 7.2 | GET | `/admin/stats` | ✓ | Ringkasan jumlah organizer/customer/event/order/revenue/tiket |
| 7.3 | GET | `/admin/organizers` | ✓ | List organizer + event_count + revenue |
| 7.4 | PATCH | `/admin/organizers/:id` | ✓ | Set status `active`/`suspended` |
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