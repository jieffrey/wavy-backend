# Wavy Backend (Go + Gin)

## Struktur folder

```
wavy-backend/
├── cmd/api/main.go           # entry point
├── internal/
│   ├── config/                # load .env
│   ├── database/               # koneksi DB + auto-migration
│   ├── models/                 # struct = tabel database
│   ├── handlers/                # logic tiap endpoint
│   ├── middleware/              # auth JWT
│   └── routes/                  # daftar semua route
├── go.mod
└── .env.example
```

## Cara jalanin (di komputer lu, bukan di sini)

1. Pastikan Go 1.22+ udah terinstall: `go version`
2. Pastikan PostgreSQL jalan, bikin database `wavy`
3. Copy `.env.example` jadi `.env`, isi `DATABASE_URL` sesuai punya lu
4. Install dependencies:
   ```
   go mod tidy
   ```
5. Jalanin server:
   ```
   go run cmd/api/main.go
   ```
6. Server jalan di `http://localhost:8080`, coba hit `POST /api/v1/auth/organizer/login`

## Pola yang dipakai (buat nambah entity baru, misal Artist)

1. Struct-nya udah ada di `internal/models/models.go` (Artist)
2. Bikin `internal/handlers/artist_handler.go` — **contek langsung struktur dari `event_handler.go`**, tinggal ganti nama struct & field
3. Daftarin route-nya di `internal/routes/routes.go` di dalam grup `organizer`, sama kayak pola `events`

## Yang masih perlu ditambahin (ada tanda `// TODO` di routes.go)

- Register & login customer (mirip `OrganizerLogin`, tinggal ganti model ke `Customer`)
- CRUD Artist & Ticket Category (contek pola `EventHandler`)
- Endpoint dashboard (`GET /organizer/dashboard`) — query aggregate (SUM revenue, COUNT ticket sold, dst pakai GORM)
- Endpoint order & payment (customer side) + integrasi Midtrans QRIS
- Endpoint QR ticket

## Auth flow singkat

- `POST /api/v1/auth/organizer/login` → return JWT token
- Simpen token itu, kirim di header tiap request ke endpoint `/organizer/*`:
  ```
  Authorization: Bearer <token>
  ```
- Middleware `AuthRequired` otomatis nolak request kalau token gak ada/invalid, dan nyimpen `organizer_id` biar handler tau ini punya organizer siapa

## Catatan soal password

Belum ada handler buat register organizer (biar lu latihan bikin sendiri contek pola `OrganizerLogin`, tapi pakai `bcrypt.GenerateFromPassword` buat hash password sebelum simpen ke DB — JANGAN simpen password plain text).
