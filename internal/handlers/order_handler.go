package handlers

import (
	"net/http"
	"strconv"
	"time"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"

	"wavy-backend/internal/models"
)

type OrderHandler struct {
	DB *gorm.DB
}

const orderHoldMinutes = 15

type createOrderRequest struct {
	EventID          uint `json:"event_id" binding:"required"`
	TicketCategoryID uint `json:"ticket_category_id" binding:"required"`
	Quantity         int  `json:"quantity" binding:"required,min=1,max=4"` // anti-scalper: max 4 tiket per order
}

// POST /api/v1/orders
func (h *OrderHandler) Create(c *gin.Context) {
	customerID := c.GetUint("customer_id")

	var req createOrderRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	var category models.TicketCategory
	if err := h.DB.First(&category, req.TicketCategoryID).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "ticket category not found"})
		return
	}

	if category.EventID != req.EventID {
		c.JSON(http.StatusBadRequest, gin.H{"error": "ticket category does not belong to this event"})
		return
	}

	available := category.Quota - category.Sold
	if req.Quantity > available {
		c.JSON(http.StatusBadRequest, gin.H{"error": "not enough tickets available"})
		return
	}

	order := models.Order{
		CustomerID:       customerID,
		EventID:          req.EventID,
		TicketCategoryID: req.TicketCategoryID,
		Quantity:         req.Quantity,
		TotalPrice:       category.Price * float64(req.Quantity),
		Status:           "pending_payment",
		ExpiresAt:        time.Now().Add(orderHoldMinutes * time.Minute),
	}

	if err := h.DB.Create(&order).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "failed to create order"})
		return
	}

	c.JSON(http.StatusCreated, order)
}

// GET /api/v1/orders/:id
func (h *OrderHandler) Get(c *gin.Context) {
	customerID := c.GetUint("customer_id")

	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "invalid order id"})
		return
	}

	var order models.Order
	if err := h.DB.Where("id = ? AND customer_id = ?", id, customerID).First(&order).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "order not found"})
		return
	}

	c.JSON(http.StatusOK, order)
}

// GET /api/v1/orders/history
func (h *OrderHandler) History(c *gin.Context) {
	customerID := c.GetUint("customer_id")

	var orders []models.Order
	if err := h.DB.Where("customer_id = ?", customerID).Order("created_at desc").Find(&orders).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "failed to fetch order history"})
		return
	}

	c.JSON(http.StatusOK, orders)
}
