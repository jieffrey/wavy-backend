# Wavy Backend — AGENTS.md

> Panduan untuk AI coding agent saat bekerja di repo ini. Ditulis bilingual ID/EN.
> Guidance for AI coding agents working in this repo. Bilingual ID/EN.

## Ringkasan Proyek / Project Overview

Backend REST API untuk platform ticketing **Wavy**. 12 modul fitur (auth, concert, customer, ticket, review, favorite, notification, homepage, organizer, admin, waitingroom, waitinglist) di-mount di `/api/v1`. Frontend-nya repo terpisah `wavy-next`. Baca `PROJECT_OVERVIEW.md` & `PRD.md` di root `project-ukk/` (di luar repo ini) bila butuh konteks produk.

Backend REST API for the **Wavy** ticketing platform. 12 feature modules mounted under `/api/v1`. The frontend lives in a separate repo, `wavy-next`. For product context see `PROJECT_OVERVIEW.md` & `PRD.md` in the root `project-ukk/` directory (outside this repo).

## Runtime — PENTING / IMPORTANT

**Runtime adalah Bun, BUKAN Node.js.** Gunakan contoh sintaks Bun; jangan tambah dependency Node-only tanpa alasan. Dev server pakai `bun --watch`.

**The runtime is Bun, NOT Node.js.** Prefer Bun idioms; don't add Node-only deps without reason. Dev server uses `bun --watch`.

## Perintah / Commands

```bash
bun install          # install dependencies
bun run dev          # bun --watch src/index.ts (hot reload)
bun run start        # bun src/index.ts
bun run typecheck    # tsc --noEmit  (lihat catatan scripts/ di bawah)
```

Tidak ada test framework terpasang. Verifikasi manual lewat API (curl / browser / skrip Bun sekali jalan di `scripts/`). Pastikan server backend hidup (default port dari `.env`, kode default `1420`).

No test framework is installed. Verify manually via API calls (curl/browser/one-off Bun scripts in `scripts/`). Keep the server running (port from `.env`; code default `1420`).

## Konfigurasi / Config

Salin `.env.example` → `.env`:

```
PORT=1420             # kode default 1420; .env.example menulis 8080 — samakan dengan frontend
DATABASE_URL=postgresql://...        # Neon (cloud), ssl require
JWT_SECRET=change-me
SMTP_HOST=... SMTP_PORT=587 SMTP_USER=... SMTP_PASS=... SMTP_FROM=...
```

CORS hanya mengizinkan `http://localhost:3000` dan `http://localhost:3001` (lihat `src/index.ts`).

CORS only allows `http://localhost:3000` and `http://localhost:3001` (see `src/index.ts`).

## Struktur / Layout

```
src/
├── index.ts                 # app Hono, CORS, mount semua routes /api/v1*, export { port, fetch }
├── db/client.ts             # koneksi postgres.js (ssl require; bigint/numeric → Number)
├── middleware/auth.middleware.ts   # organizerAuth / customerAuth / adminAuth (JWT Bearer)
├── types/result.ts          # Result<T> {ok|fail}, respond(), validBody()
├── utils/email.ts, rate-limit.ts
└── modules/<module>/        # pola per modul / per-module pattern:
    ├── <module>.routes.ts       # Hono Router, zod-validator untuk body/query
    ├── <module>.controller.ts   # baca context, panggil service, kirim via respond()
    ├── <module>.service.ts      # logika + akses DB (sql query)
    └── <module>.schema.ts       # zod schemas
```

## Konvensi / Conventions

- **Validasi:** gunakan `@hono/zod-validator` di routes (`zValidator("json", schema)`). Body yang valid diambil di controller via `validBody<T>(c)` dari `types/result.ts`.
- **Pola return:** service mengembalikan `Result<T>` (`ok(data)` / `fail(status, error)`); controller melempar lewat `respond(c)(result, status?)` → `{ data }` saat sukses / `{ error }` saat gagal.
- **Auth:** tempel middleware (mis. `customerAuth`) di route berbasis peran. Klaim JWT: `organizer_id`, `customer_id`, `admin_id` (tersedia di `c.var.organizerId` dst).
- **DB:** pakai `sql` dari `db/client.ts` (query parameterized, aman). Tipe `bigint`/`numeric` otomatis jadi `number`. Skema DB: manajemen manual (migrasi via ALTER/perubahan langsung), belum ada migration runner.
- **Bahasa kode:** Indonesian untuk komentar/label; nama simbol & endpoint Bahasa Inggris.

- **Validation:** use `@hono/zod-validator` in routes (`zValidator("json", schema)`). Validated body is re-read in the controller via `validBody<T>(c)` from `types/result.ts`.
- **Return pattern:** services return `Result<T>` (`ok(data)` / `fail(status, error)`); controllers pass it through `respond(c)(result, status?)` → `{ data }` on success / `{ error }` on failure.
- **Auth:** attach per-role middleware (e.g. `customerAuth`) to routes. JWT claims: `organizer_id`, `customer_id`, `admin_id` (available as `c.var.organizerId` etc.).
- **DB:** use `sql` from `db/client.ts` (parameterized, safe). `bigint`/`numeric` are coerced to `number`. Schema is managed manually (ALTER/direct changes); no migration runner.
- **Language:** Indonesian for comments/labels; English for symbol names & endpoints.

## Catatan / Notes

- Scripts di `scripts/` bersifat one-off (seed/scrape/migrate) dan **beberapa memicu error typecheck** pre-existing (`_apply-tnc.ts`, `_scrape-tnc.ts`, `generate-enrich-sql.ts`). Jangan anggap sebagai regresi saat `typecheck` — cek cakupan perubahanmu. Modul `src/modules/*` harus selalu `tsc`-clean.
- Server default menekan port sesuai `.env` (`PORT=1420`). Bila butuh live-tes tanpa bentrok, jalankan dengan `PORT=<acak> bun src/index.ts`.
- Change history aktif berada di branch `feat/order-attendee-data` (PR #6). Jangan menimpa kerja PR yang belum merge.

- `scripts/` are one-off (seed/scrape/migrate) and **some trigger pre-existing typecheck errors**. Don't treat those as regressions — check your change's scope. `src/modules/*` must stay `tsc`-clean.
- The server serves on `.env` `PORT` (default `1420`). For isolated live tests, run with `PORT=<unused> bun src/index.ts`.
- Active work is on branch `feat/order-attendee-data` (PR #6). Don't clobber unmerged PR work.