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