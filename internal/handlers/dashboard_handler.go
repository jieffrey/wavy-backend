package handlers

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type DashboardHandler struct {
	DB *gorm.DB
}

type dashboardResponse struct {
	Revenue          float64 `json:"revenue"`
	TicketSold       int     `json:"ticket_sold"`
	RemainingTicket  int     `json:"remaining_ticket"`
	PopularCategory  string  `json:"popular_category"`
	PeakPurchaseHour int     `json:"peak_purchase_hour"` // 0-23
}

// GET /api/v1/organizer/dashboard
func (h *DashboardHandler) Get(c *gin.Context) {
	organizerID := c.GetUint("organizer_id")

	var revenue float64
	h.DB.Raw(`
		SELECT COALESCE(SUM(o.total_price), 0)
		FROM orders o
		JOIN events e ON o.event_id = e.id
		WHERE e.organizer_id = ? AND o.status = 'paid'
	`, organizerID).Scan(&revenue)

	var ticketSold int
	h.DB.Raw(`
		SELECT COALESCE(SUM(tc.sold), 0)
		FROM ticket_categories tc
		JOIN events e ON tc.event_id = e.id
		WHERE e.organizer_id = ?
	`, organizerID).Scan(&ticketSold)

	var remainingTicket int
	h.DB.Raw(`
		SELECT COALESCE(SUM(tc.quota - tc.sold), 0)
		FROM ticket_categories tc
		JOIN events e ON tc.event_id = e.id
		WHERE e.organizer_id = ?
	`, organizerID).Scan(&remainingTicket)

	var popularCategory string
	h.DB.Raw(`
		SELECT e.category
		FROM orders o
		JOIN events e ON o.event_id = e.id
		WHERE e.organizer_id = ? AND o.status = 'paid'
		GROUP BY e.category
		ORDER BY SUM(o.quantity) DESC
		LIMIT 1
	`, organizerID).Scan(&popularCategory)

	var peakHour int
	h.DB.Raw(`
		SELECT EXTRACT(HOUR FROM o.created_at)::int AS hour
		FROM orders o
		JOIN events e ON o.event_id = e.id
		WHERE e.organizer_id = ?
		GROUP BY hour
		ORDER BY COUNT(*) DESC
		LIMIT 1
	`, organizerID).Scan(&peakHour)

	c.JSON(http.StatusOK, dashboardResponse{
		Revenue:          revenue,
		TicketSold:       ticketSold,
		RemainingTicket:  remainingTicket,
		PopularCategory:  popularCategory,
		PeakPurchaseHour: peakHour,
	})
}
