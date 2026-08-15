package handlers

import (
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"

	"wavy-backend/internal/models"
)

type OrganizerOrderHandler struct {
	DB *gorm.DB
}

// GET /api/v1/organizer/orders?status=pending_payment
func (h *OrganizerOrderHandler) List(c *gin.Context) {
	organizerID := c.GetUint("organizer_id")
	status := c.Query("status")

	query := h.DB.
		Table("orders").
		Joins("JOIN events ON events.id = orders.event_id").
		Where("events.organizer_id = ?", organizerID)

	if status != "" {
		query = query.Where("orders.status = ?", status)
	}

	var orders []models.Order
	if err := query.Select("orders.*").Order("orders.created_at desc").Find(&orders).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "failed to fetch orders"})
		return
	}

	c.JSON(http.StatusOK, orders)
}

// POST /api/v1/organizer/orders/:id/verify  body: { "approve": true/false }
func (h *OrganizerOrderHandler) Verify(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "invalid order id"})
		return
	}

	var body struct {
		Approve bool `json:"approve"`
	}
	if err := c.ShouldBindJSON(&body); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	var order models.Order
	if err := h.DB.First(&order, id).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "order not found"})
		return
	}

	if order.Status != "pending_payment" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "order is not pending payment"})
		return
	}

	if body.Approve {
		// Pakai transaction: update status order + tambahin sold di ticket category harus barengan,
		// biar gak ada kondisi setengah-jalan kalau salah satu gagal.
		err = h.DB.Transaction(func(tx *gorm.DB) error {
			if err := tx.Model(&order).Update("status", "paid").Error; err != nil {
				return err
			}
			return tx.Model(&models.TicketCategory{}).
				Where("id = ?", order.TicketCategoryID).
				UpdateColumn("sold", gorm.Expr("sold + ?", order.Quantity)).Error
		})
	} else {
		err = h.DB.Model(&order).Update("status", "rejected").Error
	}

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "failed to update order"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "order status updated"})
}
