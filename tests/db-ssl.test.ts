import { describe, expect, test } from "bun:test";
import { resolveSsl } from "../src/db/ssl";

describe("resolveSsl", () => {
  test("default (tidak di-set) = require", () => {
    expect(resolveSsl("ep-example-123.ap-southeast-1.aws.neon.tech", undefined)).toBe("require");
  });

  test("nilai selain 'disable' tetap require", () => {
    expect(resolveSsl("ep-example-123.aws.neon.tech", "false")).toBe("require");
    expect(resolveSsl("localhost", "")).toBe("require");
  });

  test("disable diterima untuk host lokal", () => {
    for (const host of ["localhost", "127.0.0.1", "::1", "[::1]"]) {
      expect(resolveSsl(host, "disable")).toBe(false);
    }
  });

  test("disable ke host remote ditolak", () => {
    expect(() => resolveSsl("ep-example-123.aws.neon.tech", "disable")).toThrow(/hanya boleh untuk database lokal/);
  });
});
