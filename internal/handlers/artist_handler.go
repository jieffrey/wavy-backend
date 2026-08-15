package handlers

import (
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"

	"wavy-backend/internal/models"
)

type ArtistHandler struct {
	DB *gorm.DB
}

type artistRequest struct {
	Name     string `json:"name" binding:"required"`
	Genre    string `json:"genre" binding:"required"`
	PhotoURL string `json:"photo_url"`
	Bio      string `json:"bio"`
}

// GET /api/v1/organizer/artists
func (h *ArtistHandler) List(c *gin.Context) {
	organizerID := c.GetUint("organizer_id")

	var artists []models.Artist
	if err := h.DB.Where("organizer_id = ?", organizerID).Find(&artists).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "failed to fetch artists"})
		return
	}

	c.JSON(http.StatusOK, artists)
}

// POST /api/v1/organizer/artists
func (h *ArtistHandler) Create(c *gin.Context) {
	organizerID := c.GetUint("organizer_id")

	var req artistRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	artist := models.Artist{
		OrganizerID: organizerID,
		Name:        req.Name,
		Genre:       req.Genre,
		PhotoURL:    req.PhotoURL,
		Bio:         req.Bio,
	}

	if err := h.DB.Create(&artist).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "failed to create artist"})
		return
	}

	c.JSON(http.StatusCreated, artist)
}

// PUT /api/v1/organizer/artists/:id
func (h *ArtistHandler) Update(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "invalid artist id"})
		return
	}

	var artist models.Artist
	if err := h.DB.First(&artist, id).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "artist not found"})
		return
	}

	var req artistRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	artist.Name = req.Name
	artist.Genre = req.Genre
	artist.PhotoURL = req.PhotoURL
	artist.Bio = req.Bio

	if err := h.DB.Save(&artist).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "failed to update artist"})
		return
	}

	c.JSON(http.StatusOK, artist)
}

// DELETE /api/v1/organizer/artists/:id
func (h *ArtistHandler) Delete(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "invalid artist id"})
		return
	}

	if err := h.DB.Delete(&models.Artist{}, id).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "failed to delete artist"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "artist deleted"})
}