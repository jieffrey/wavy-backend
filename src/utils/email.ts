import nodemailer from "nodemailer";

const transport = nodemailer.createTransport({
  host: process.env.SMTP_HOST,
  port: Number(process.env.SMTP_PORT),
  secure: false,
  auth: {
    user: process.env.SMTP_USER,
    pass: process.env.SMTP_PASS,
  },
});

export async function sendOtpEmail(to: string, code: string) {
  await transport.sendMail({
    from: process.env.SMTP_FROM,
    to,
    subject: "Kode OTP Wavy Anda",
    text: `Kode OTP Anda: ${code}\nKode berlaku selama 5 menit. Jangan bagikan kode ini kepada siapa pun.`,
  });
}

export async function sendOrganizerVerificationEmail(to: string, code: string, organizerName: string) {
  await transport.sendMail({
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