package handlers

import (
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt/v5"
	"golang.org/x/crypto/bcrypt"
	"gorm.io/gorm"

	"wavy-backend/internal/models"
)

type AuthHandler struct {
	DB        *gorm.DB
	JWTSecret string
}

type loginRequest struct {
	Email    string `json:"email" binding:"required,email"`
	Password string `json:"password" binding:"required,min=8"`
}

// POST /api/v1/auth/organizer/login
func (h *AuthHandler) OrganizerLogin(c *gin.Context) {
	var req loginRequest
	// binding:"required" otomatis nge-reject request kalau field kosong/format salah
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	var organizer models.Organizer
	if err := h.DB.Where("email = ?", req.Email).First(&organizer).Error; err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "invalid email or password"})
		return
	}

	if err := bcrypt.CompareHashAndPassword([]byte(organizer.Password), []byte(req.Password)); err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "invalid email or password"})
		return
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"organizer_id": organizer.ID,
		"exp":          time.Now().Add(24 * time.Hour).Unix(),
	})

	signed, err := token.SignedString([]byte(h.JWTSecret))
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "failed to generate token"})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"access_token": signed,
		"organizer": gin.H{
			"id":    organizer.ID,
			"name":  organizer.Name,
			"email": organizer.Email,
		},
	})
}
