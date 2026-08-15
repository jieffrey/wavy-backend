package handlers

import (
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"

	"wavy-backend/internal/models"
)

type EventHandler struct {
	DB *gorm.DB
}

type createEventRequest struct {
	Title       string `json:"title" binding:"required"`
	ArtistID    uint   `json:"artist_id" binding:"required"`
	Category    string `json:"category" binding:"required"`
	Venue       string `json:"venue" binding:"required"`
	Date        string `json:"date" binding:"required"` // format ISO8601, di-parse manual di bawah
	PosterURL   string `json:"poster_url"`
	Description string `json:"description"`
}

// GET /api/v1/organizer/events
func (h *EventHandler) List(c *gin.Context) {
	organizerID := c.GetUint("organizer_id") // di-set sama middleware AuthRequired

	var events []models.Event
	if err := h.DB.Where("organizer_id = ?", organizerID).Find(&events).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "failed to fetch events"})
		return
	}

	c.JSON(http.StatusOK, events)
}

// POST /api/v1/organizer/events
func (h *EventHandler) Create(c *gin.Context) {
	organizerID := c.GetUint("organizer_id")

	var req createEventRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	event := models.Event{
		OrganizerID: organizerID,
		ArtistID:    req.ArtistID,
		Title:       req.Title,
		Category:    req.Category,
		Venue:       req.Venue,
		PosterURL:   req.PosterURL,
		Description: req.Description,
		Status:      "draft",
	}

	if err := h.DB.Create(&event).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "failed to create event"})
		return
	}

	c.JSON(http.StatusCreated, event)
}

// GET /api/v1/organizer/events/:id
func (h *EventHandler) Get(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "invalid event id"})
		return
	}

	var event models.Event
	if err := h.DB.Preload("TicketCategories").First(&event, id).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "event not found"})
		return
	}

	c.JSON(http.StatusOK, event)
}

// PUT /api/v1/organizer/events/:id
func (h *EventHandler) Update(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "invalid event id"})
		return
	}

	var event models.Event
	if err := h.DB.First(&event, id).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "event not found"})
		return
	}

	var req createEventRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	event.Title = req.Title
	event.ArtistID = req.ArtistID
	event.Category = req.Category
	event.Venue = req.Venue
	event.PosterURL = req.PosterURL
	event.Description = req.Description

	if err := h.DB.Save(&event).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "failed to update event"})
		return
	}

	c.JSON(http.StatusOK, event)
}

// DELETE /api/v1/organizer/events/:id
func (h *EventHandler) Delete(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "invalid event id"})
		return
	}

	if err := h.DB.Delete(&models.Event{}, id).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "failed to delete event"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "event deleted"})
}

// POST /api/v1/organizer/events/:id/close-sales
func (h *EventHandler) CloseSales(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "invalid event id"})
		return
	}

	if err := h.DB.Model(&models.Event{}).Where("id = ?", id).Update("status", "closed").Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "failed to close sales"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "event sales closed"})
}
