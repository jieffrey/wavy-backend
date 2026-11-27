import nodemailer from "nodemailer";
import type { SendMailOptions } from "nodemailer";

const transport = nodemailer.createTransport({
  host: process.env.SMTP_HOST,
  port: Number(process.env.SMTP_PORT),
  secure: false,
  auth: {
    user: process.env.SMTP_USER,
    pass: process.env.SMTP_PASS,
  },
});

// Satu pintu pengiriman email. Test mengganti mailer.send supaya tidak menyentuh SMTP.
export const mailer = {
  send: (options: SendMailOptions) => transport.sendMail(options),
};

const escapeHtml = (value: string) =>
  value.replace(/[&<>"']/g, (ch) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" })[ch]!);

const webUrl = () => (process.env.WEB_URL ?? "http://localhost:3000").replace(/\/$/, "");

export async function sendOtpEmail(to: string, code: string) {
  await mailer.send({
    from: process.env.SMTP_FROM,
    to,
    subject: "Kode OTP Wavy Anda",
    text: `Kode OTP Anda: ${code}\nKode berlaku selama 5 menit. Jangan bagikan kode ini kepada siapa pun.`,
  });
}

export async function sendOrganizerVerificationEmail(to: string, code: string, organizerName: string) {
  await mailer.send({
    from: process.env.SMTP_FROM,
    to,
    subject: "Verifikasi Akun Event Organizer - Wavy",
    html: `
      <div style="font-family: Arial, sans-serif; max-width: 480px; margin: 0 auto; padding: 24px;">
        <h2 style="color: #1B1A3A;">Verifikasi Akun EO Anda</h2>
        <p style="color: #6B7280; font-size: 14px;">Halo ${organizerName},</p>
        <p style="color: #6B7280; font-size: 14px;">Gunakan kode OTP berikut untuk memverifikasi akun Event Organizer Anda di Wavy:</p>
        <div style="background: #F3F4F6; border-radius: 12px; padding: 20px; text-align: center; margin: 20px 0;">
          <span style="font-size: 32px; font-weight: bold; letter-spacing: 8px; color: #1B1A3A;">${code}</span>
        </div>
        <p style="color: #9CA3AF; font-size: 12px;">Kode berlaku selama 5 menit. Jangan bagikan kode ini kepada siapa pun.</p>
        <hr style="border: none; border-top: 1px solid #E5E7EB; margin: 20px 0;" />
        <p style="color: #9CA3AF; font-size: 11px;">Email ini dikirim otomatis oleh Wavy. Jika Anda tidak merasa mendaftar, abaikan email ini.</p>
      </div>
    `,
    text: `Verifikasi Akun EO Anda\n\nHalo ${organizerName},\nKode OTP Anda: ${code}\nKode berlaku selama 5 menit.`,
  });
}

const shell = (body: string) => `
  <div style="font-family: Arial, sans-serif; max-width: 480px; margin: 0 auto; padding: 24px;">
    ${body}
    <hr style="border: none; border-top: 1px solid #E5E7EB; margin: 20px 0;" />
    <p style="color: #9CA3AF; font-size: 11px;">Email ini dikirim otomatis oleh Wavy.</p>
  </div>
`;

export async function sendOrganizerApprovedEmail(to: string, organizerName: string) {
  const loginUrl = `${webUrl()}/id/organizer/login`;
  const name = escapeHtml(organizerName);
  await mailer.send({
    from: process.env.SMTP_FROM,
    to,
    subject: "Akun Event Organizer Anda disetujui - Wavy",
    html: shell(`
      <h2 style="color: #1B1A3A;">Selamat, akun Anda aktif</h2>
      <p style="color: #6B7280; font-size: 14px;">Halo ${name},</p>
      <p style="color: #6B7280; font-size: 14px;">Pengajuan kerja sama Anda sudah disetujui admin Wavy. Anda sekarang bisa masuk ke Creator Studio untuk membuat event dan menjual tiket.</p>
      <p style="margin: 20px 0;"><a href="${loginUrl}" style="background: #1B1A3A; color: #FFFFFF; padding: 12px 20px; border-radius: 8px; text-decoration: none; font-size: 14px;">Masuk ke Creator Studio</a></p>
    `),
    text: `Halo ${organizerName},\n\nPengajuan kerja sama Anda sudah disetujui admin Wavy. Masuk ke Creator Studio: ${loginUrl}`,
  });
}

export async function sendOrganizerRejectedEmail(to: string, organizerName: string, reason: string) {
  const registerUrl = `${webUrl()}/id/organizer/register`;
  await mailer.send({
    from: process.env.SMTP_FROM,
    to,
    subject: "Pengajuan Event Organizer belum disetujui - Wavy",
    html: shell(`
      <h2 style="color: #1B1A3A;">Pengajuan belum disetujui</h2>
      <p style="color: #6B7280; font-size: 14px;">Halo ${escapeHtml(organizerName)},</p>
      <p style="color: #6B7280; font-size: 14px;">Terima kasih sudah mengajukan kerja sama. Untuk saat ini pengajuan Anda belum bisa kami setujui dengan alasan berikut:</p>
      <div style="background: #F3F4F6; border-radius: 12px; padding: 16px; margin: 16px 0; color: #1B1A3A; font-size: 14px; white-space: pre-line;">${escapeHtml(reason)}</div>
      <p style="color: #6B7280; font-size: 14px;">Anda bisa memperbaiki data lalu mengajukan ulang dengan email yang sama: <a href="${registerUrl}">${registerUrl}</a></p>
    `),
    text: `Halo ${organizerName},\n\nPengajuan kerja sama Anda belum disetujui.\nAlasan: ${reason}\n\nAjukan ulang: ${registerUrl}`,
  });
}
