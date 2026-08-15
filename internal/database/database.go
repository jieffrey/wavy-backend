package database

import (
	"gorm.io/driver/postgres"
	"gorm.io/gorm"

	"wavy-backend/internal/config"
	"wavy-backend/internal/models"
)

func Connect(cfg *config.Config) (*gorm.DB, error) {
	db, err := gorm.Open(postgres.Open(cfg.DatabaseURL), &gorm.Config{})
	if err != nil {
		return nil, err
	}
	return db, nil
}

// AutoMigrate bikin/update tabel otomatis dari struct model.
// Enak buat development, tapi kalau udah production sebaiknya pindah ke migration file manual.
func AutoMigrate(db *gorm.DB) error {
	return db.AutoMigrate(
		&models.Organizer{},
		&models.Customer{},
		&models.Artist{},
		&models.Event{},
		&models.TicketCategory{},
		&models.Order{},
		&models.Ticket{},
		&models.OTPCode{},
	)
}
