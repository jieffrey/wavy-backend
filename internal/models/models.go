package models

import "time"

type Organizer struct {
	ID        uint      `gorm:"primaryKey" json:"id"`
	Name      string    `json:"name"`
	Email     string    `gorm:"unique" json:"email"`
	Password  string    `json:"-"` // hashed, jangan pernah di-return di JSON
	CreatedAt time.Time `json:"created_at"`
}

type Customer struct {
	ID        uint      `gorm:"primaryKey" json:"id"`
	Name      string    `json:"name"`
	Email     string    `gorm:"unique" json:"email"`
	CreatedAt time.Time `json:"created_at"`
}

type OTPCode struct {
	ID        uint      `gorm:"primaryKey" json:"id"`
	Email     string    `json:"email"`
	Code      string    `json:"-"`
	ExpiresAt time.Time `json:"-"`
	Used      bool      `gorm:"default:false" json:"-"`
	CreatedAt time.Time `json:"created_at"`
}

type Artist struct {
	ID          uint   `gorm:"primaryKey" json:"id"`
	OrganizerID uint   `json:"organizer_id"`
	Name        string `json:"name"`
	Genre       string `json:"genre"`
	PhotoURL    string `json:"photo_url"`
	Bio         string `json:"bio"`
}

type Event struct {
	ID          uint      `gorm:"primaryKey" json:"id"`
	OrganizerID uint      `json:"organizer_id"`
	ArtistID    uint      `json:"artist_id"`
	Title       string    `json:"title"`
	Category    string    `json:"category"`
	Venue       string    `json:"venue"`
	Date        time.Time `json:"date"`
	PosterURL   string    `json:"poster_url"`
	Description string    `json:"description"`
	Status      string    `gorm:"default:draft" json:"status"` // draft | published | closed

	TicketCategories []TicketCategory `json:"ticket_categories,omitempty"`
}

type TicketCategory struct {
	ID      uint    `gorm:"primaryKey" json:"id"`
	EventID uint    `json:"event_id"`
	Name    string  `json:"name"`
	Price   float64 `json:"price"`
	Quota   int     `json:"quota"`
	Sold    int     `gorm:"default:0" json:"sold"`
}

type Order struct {
	ID               uint      `gorm:"primaryKey" json:"id"`
	CustomerID       uint      `json:"customer_id"`
	EventID          uint      `json:"event_id"`
	TicketCategoryID uint      `json:"ticket_category_id"`
	Quantity         int       `json:"quantity"`
	TotalPrice       float64   `json:"total_price"`
	Status           string    `gorm:"default:pending_payment" json:"status"` // pending_payment | paid | expired | rejected
	ExpiresAt        time.Time `json:"expires_at"`
	CreatedAt        time.Time `json:"created_at"`
}

type Ticket struct {
	ID        uint   `gorm:"primaryKey" json:"id"`
	OrderID   uint   `json:"order_id"`
	QRCode    string `gorm:"unique" json:"qr_code"`
	IsScanned bool   `gorm:"default:false" json:"is_scanned"`
}
