// Data demo FIKTIF untuk latihan demo / dev lokal: artis, konser, kategori tiket, dan beberapa order rekaan.
// Semua nama, venue, dan email karangan (domain example.com). Bukan data scrape.
// Menulis ke database di DATABASE_URL (.env = Neon). TIDAK pernah dijalankan otomatis (bukan bagian migrate/test).
//
//   bun scripts/seed-demo-v2.ts                      -> dry-run: tampilkan target & isi yang akan dibuat
//   bun scripts/seed-demo-v2.ts --confirm=<nama-db>  -> tulis (nama harus sama dengan database di DATABASE_URL)
//
// Syarat: skema v2 sudah ada (scripts/migrate.ts atau db-reset.ts) dan belum ada data demo sebelumnya.
// Semua ditulis dalam satu transaksi.
import { sql } from "../src/db/client";
import { signTicket } from "../src/modules/ticket/ticket.service";

const DAY = 86_400_000;
const at = (days: number, hour = 19) => {
  const d = new Date(Date.now() + days * DAY);
  d.setUTCHours(hour - 7, 0, 0, 0); // jam WIB
  return d;
};

const ARTISTS = [
  { key: "nada", name: "Nada Senja", genre: "Pop", bio: "Duo pop akustik rekaan dari Bandung." },
  { key: "garuda", name: "Garuda Listrik", genre: "Rock", bio: "Band rock fiktif dengan empat personel." },
  { key: "kopi", name: "Kopi Pagi Collective", genre: "Jazz", bio: "Kolektif jazz rekaan untuk data demo." },
  { key: "ritme", name: "Ritme Kota", genre: "Electronic", bio: "Proyek musik elektronik fiktif." },
  { key: "tawa", name: "Tawa Tengah Malam", genre: "Komedi", bio: "Grup stand-up comedy rekaan." },
] as const;

type ArtistKey = (typeof ARTISTS)[number]["key"];
type DemoEvent = {
  key: string;
  title: string;
  artist: ArtistKey;
  category: string;
  venue: string;
  date: Date;
  salesStart: Date | null;
  salesEnd: Date | null;
  status: "draft" | "published" | "closed";
  note: string;
  categories: { name: string; price: number; quota: number; benefits: string }[];
  paidOrders?: { category: string; quantity: number }[];
};

const EVENTS: DemoEvent[] = [
  {
    key: "open",
    title: "Nada Senja: Pulang ke Kota",
    artist: "nada",
    category: "Musik",
    venue: "Gedung Serbaguna Mawar, Bandung",
    date: at(30),
    salesStart: at(-3, 10),
    salesEnd: at(28, 23),
    status: "published",
    note: "penjualan terbuka",
    categories: [
      { name: "VIP", price: 750_000, quota: 40, benefits: "Area depan, merchandise, sesi foto" },
      { name: "Reguler", price: 250_000, quota: 200, benefits: "Area berdiri" },
    ],
    paidOrders: [{ category: "VIP", quantity: 2 }],
  },
  {
    key: "upcoming",
    title: "Garuda Listrik Live 2027",
    artist: "garuda",
    category: "Musik",
    venue: "Lapangan Merdeka Fiktif, Jakarta",
    date: at(60),
    salesStart: at(7, 10),
    salesEnd: at(58, 23),
    status: "published",
    note: "penjualan belum dibuka (upcoming)",
    categories: [
      { name: "Festival", price: 350_000, quota: 500, benefits: "Area festival" },
      { name: "Tribun", price: 200_000, quota: 800, benefits: "Kursi tribun" },
    ],
  },
  {
    key: "soldout",
    title: "Kopi Pagi Jazz Night",
    artist: "kopi",
    category: "Musik",
    venue: "Aula Teratai, Yogyakarta",
    date: at(21),
    salesStart: at(-10, 10),
    salesEnd: at(20, 23),
    status: "published",
    note: "tiket habis (sold out)",
    categories: [{ name: "Reguler", price: 300_000, quota: 8, benefits: "Kursi bernomor" }],
    paidOrders: [
      { category: "Reguler", quantity: 4 },
      { category: "Reguler", quantity: 4 },
    ],
  },
  {
    key: "closed",
    title: "Ritme Kota: Malam Elektronik",
    artist: "ritme",
    category: "Musik",
    venue: "Hall Cempaka, Surabaya",
    date: at(14),
    salesStart: at(-20, 10),
    salesEnd: at(13, 23),
    status: "closed",
    note: "penjualan ditutup admin (bisa \"Buka lagi\")",
    categories: [{ name: "Reguler", price: 180_000, quota: 300, benefits: "Area berdiri" }],
  },
  {
    key: "draft",
    title: "Tawa Tengah Malam Tour",
    artist: "tawa",
    category: "Komedi",
    venue: "Teater Anggrek, Semarang",
    date: at(45),
    salesStart: null,
    salesEnd: null,
    status: "draft",
    note: "draft, belum punya kategori tiket (tidak tampil publik)",
    categories: [],
  },
];

const CUSTOMERS = [
  { email: "demo.pembeli1@example.com", name: "Pembeli Demo Satu" },
  { email: "demo.pembeli2@example.com", name: "Pembeli Demo Dua" },
];

const url = new URL(process.env.DATABASE_URL!);
const dbName = decodeURIComponent(url.pathname.replace(/^\//, ""));
const confirmArg = process.argv.find((a) => a.startsWith("--confirm="))?.slice("--confirm=".length);

async function main() {
  console.log(`Target : ${url.hostname} / database "${dbName}"`);
  console.log(`Isi    : ${ARTISTS.length} artis, ${EVENTS.length} event, ${CUSTOMERS.length} customer demo`);
  for (const e of EVENTS) console.log(`  - ${e.title} — ${e.note}`);

  const [schema] = await sql<{ ok: boolean }[]>`SELECT to_regclass('public.schema_migrations') IS NOT NULL AS ok`;
  if (!schema.ok) throw new Error("skema v2 belum ada; jalankan scripts/db-reset.ts atau scripts/migrate.ts dulu");
  const existing = await sql<{ name: string }[]>`SELECT name FROM artists WHERE name IN ${sql(ARTISTS.map((a) => a.name))}`;
  if (existing.length) throw new Error(`data demo sudah ada (artis: ${existing.map((r) => r.name).join(", ")}); tidak ditulis ulang`);

  if (confirmArg === undefined) {
    console.log(`\nDry-run, tidak ada yang ditulis. Jalankan ulang dengan --confirm=${dbName}.`);
    return;
  }
  if (confirmArg !== dbName) {
    console.error(`\n--confirm="${confirmArg}" tidak sama dengan nama database "${dbName}". Dibatalkan.`);
    process.exitCode = 2;
    return;
  }

  await sql.begin(async (tx) => {
    const [admin] = await tx<{ id: number }[]>`SELECT id FROM admins ORDER BY id LIMIT 1`;
    const artistId = new Map<ArtistKey, number>();
    for (const a of ARTISTS) {
      const [row] = await tx<{ id: number }[]>`
        INSERT INTO artists (name, genre, photo_url, bio) VALUES (${a.name}, ${a.genre}, '', ${a.bio}) RETURNING id
      `;
      artistId.set(a.key, row.id);
    }
    const customerIds: number[] = [];
    for (const c of CUSTOMERS) {
      const [row] = await tx<{ id: number }[]>`
        INSERT INTO customers (email, name) VALUES (${c.email}, ${c.name})
        ON CONFLICT (email) DO UPDATE SET name = EXCLUDED.name
        RETURNING id
      `;
      customerIds.push(row.id);
    }

    for (const e of EVENTS) {
      const [ev] = await tx<{ id: number }[]>`
        INSERT INTO events (artist_id, created_by, title, category, venue, date, description, terms_conditions,
                            status, sales_start_at, sales_end_at)
        VALUES (${artistId.get(e.artist)!}, ${admin?.id ?? null}, ${e.title}, ${e.category}, ${e.venue}, ${e.date},
                ${`Konser rekaan untuk demo Wavy: ${e.note}.`},
                ${"Tiket tidak dapat dikembalikan kecuali acara dibatalkan.\nSatu QR berlaku untuk satu orang."},
                ${e.status}, ${e.salesStart}, ${e.salesEnd})
        RETURNING id
      `;
      const catId = new Map<string, number>();
      for (const c of e.categories) {
        const [cat] = await tx<{ id: number }[]>`
          INSERT INTO ticket_categories (event_id, name, price, quota, benefits)
          VALUES (${ev.id}, ${c.name}, ${c.price}, ${c.quota}, ${c.benefits})
          RETURNING id
        `;
        catId.set(c.name, cat.id);
      }
      // order paid rekaan (maks 4 tiket per order), tiket + QR terbit seperti markOrderPaid
      for (const [i, o] of (e.paidOrders ?? []).entries()) {
        const categoryId = catId.get(o.category)!;
        const price = e.categories.find((c) => c.name === o.category)!.price;
        const customerId = customerIds[i % customerIds.length];
        const buyer = CUSTOMERS[i % CUSTOMERS.length];
        const [order] = await tx<{ id: number }[]>`
          INSERT INTO orders (customer_id, event_id, ticket_category_id, quantity, total_price, status,
                              expires_at, created_at, paid_at, verified_by, full_name, email, wa_consent)
          VALUES (${customerId}, ${ev.id}, ${categoryId}, ${o.quantity}, ${price * o.quantity}, 'paid',
                  now() - interval '1 day' + interval '15 minutes', now() - interval '1 day', now() - interval '1 day',
                  ${admin?.id ?? null}, ${buyer.name}, ${buyer.email}, 'Tidak')
          RETURNING id
        `;
        await tx`UPDATE ticket_categories SET sold = sold + ${o.quantity} WHERE id = ${categoryId}`;
        const exp = Math.floor(e.date.getTime() / 1000);
        for (let t = 0; t < o.quantity; t++) {
          await tx`
            INSERT INTO tickets (order_id, owner_id, qr_code)
            VALUES (${order.id}, ${customerId}, ${signTicket({ uid: crypto.randomUUID(), event_id: ev.id, exp })})
          `;
        }
      }
    }
  });
  console.log("\nSelesai: data demo fiktif ditulis.");
}

try {
  await main();
} catch (err) {
  console.error("seed-demo-v2 gagal (tidak ada yang ditulis):", err instanceof Error ? err.message : err);
  process.exitCode = 1;
} finally {
  await sql.end();
}
