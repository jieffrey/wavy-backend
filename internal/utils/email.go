package utils

import (
	"fmt"
	"net/smtp"

	"wavy-backend/internal/config"
)

func SendOTPEmail(cfg *config.Config, to string, code string) error {
	subject := "Kode OTP Wavy Anda"
	body := fmt.Sprintf("Kode OTP Anda: %s\n\nBerlaku selama 5 menit. Jangan bagikan kode ini ke siapapun.", code)

	msg := []byte("To: " + to + "\r\n" +
		"Subject: " + subject + "\r\n" +
		"\r\n" + body + "\r\n")

	auth := smtp.PlainAuth("", cfg.SMTPUser, cfg.SMTPPass, cfg.SMTPHost)
	addr := cfg.SMTPHost + ":" + cfg.SMTPPort

	return smtp.SendMail(addr, auth, cfg.SMTPFrom, []string{to}, msg)
}
