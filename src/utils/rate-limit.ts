const buckets = new Map<string, { count: number; resetAt: number }>();

// sliding-window per-proses: kembalikan false saat melewati `max` dalam `windowMs`.
// ponytail: in-memory, reset saat restart; ganti store eksternal kalau multi-instance.
export const rateLimit = (key: string, max: number, windowMs: number): boolean => {
  const now = Date.now();
  const b = buckets.get(key);
  if (!b || b.resetAt <= now) {
    buckets.set(key, { count: 1, resetAt: now + windowMs });
    return true;
  }
  if (b.count >= max) return false;
  b.count++;
  return true;
};