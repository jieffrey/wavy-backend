const LOCAL_HOSTS = new Set(["localhost", "127.0.0.1", "::1", "[::1]"]);

// Default SSL wajib (NeonDB). DATABASE_SSL=disable hanya diterima untuk host lokal,
// supaya salah konfigurasi tidak pernah membuat koneksi ke NeonDB tanpa SSL.
// (sslmode di query string DATABASE_URL dibuang di client.ts, jadi tidak bisa jadi jalan pintas.)
export function resolveSsl(hostname: string, databaseSsl: string | undefined): "require" | false {
  if (databaseSsl !== "disable") return "require";
  if (!LOCAL_HOSTS.has(hostname)) {
    throw new Error(`DATABASE_SSL=disable hanya boleh untuk database lokal (host: "${hostname}")`);
  }
  return false;
}
