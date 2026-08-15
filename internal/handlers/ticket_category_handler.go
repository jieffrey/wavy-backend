package handlers

import (
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"

	"wavy-backend/internal/models"
)

type TicketCategoryHandler struct {
	DB *gorm.DB
}

type ticketCategoryRequest struct {
	Name  string  `json:"name" binding:"required"`
	Price float64 `json:"price" binding:"required,min=0"`
	Quota int     `json:"quota" binding:"required,min=1"`
}

// GET /api/v1/organizer/events/:event_id/ticket-categories
func (h *TicketCategoryHandler) List(c *gin.Context) {
	eventID, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "invalid event id"})
		return
	}

	var categories []models.TicketCategory
	if err := h.DB.Where("event_id = ?", eventID).Find(&categories).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "failed to fetch ticket categories"})
		return
	}

	c.JSON(http.StatusOK, categories)
}

// POST /api/v1/organizer/events/:event_id/ticket-categories
func (h *TicketCategoryHandler) Create(c *gin.Context) {
	eventID, err := strconv.Atoi(c.Param("event_id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "invalid event id"})
		return
	}

	// Pastikan event-nya beneran ada sebelum bikin ticket category di dalamnya
	var event models.Event
	if err := h.DB.First(&event, eventID).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "event not found"})
		return
	}

	var req ticketCategoryRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	category := models.TicketCategory{
		EventID: uint(eventID),
		Name:    req.Name,
		Price:   req.Price,
		Quota:   req.Quota,
	}

	if err := h.DB.Create(&category).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "failed to create ticket category"})
		return
	}

	c.JSON(http.StatusCreated, category)
}

// PUT /api/v1/organizer/ticket-categories/:id
func (h *TicketCategoryHandler) Update(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "invalid ticket category id"})
		return
	}

	var category models.TicketCategory
	if err := h.DB.First(&category, id).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "ticket category not found"})
		return
	}

	var req ticketCategoryRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// Cegah quota diturunkan di bawah jumlah tiket yang udah kejual
	if req.Quota < category.Sold {
		c.JSON(http.StatusBadRequest, gin.H{"error": "quota cannot be less than tickets already sold"})
		return
	}

	category.Name = req.Name
	category.Price = req.Price
	category.Quota = req.Quota

	if err := h.DB.Save(&category).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "failed to update ticket category"})
		return
	}

	c.JSON(http.StatusOK, category)
}

// DELETE /api/v1/organizer/ticket-categories/:id
func (h *TicketCategoryHandler) Delete(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "invalid ticket category id"})
		return
	}

	if err := h.DB.Delete(&models.TicketCategory{}, id).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "failed to delete ticket category"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "ticket category deleted"})
}
