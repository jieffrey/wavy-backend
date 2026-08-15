package handlers

import (
	"fmt"
	"math/rand"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt/v5"
	"gorm.io/gorm"

	"wavy-backend/internal/config"
	"wavy-backend/internal/models"
	"wavy-backend/internal/utils"
)

type CustomerAuthHandler struct {
	DB     *gorm.DB
	Config *config.Config
}

type sendOtpRequest struct {
	Email string `json:"email" binding:"required,email"`
}

type verifyOtpRequest struct {
	Email string `json:"email" binding:"required,email"`
	Code  string `json:"code" binding:"required,len=6"`
}

func generateOTP() string {
	return fmt.Sprintf("%06d", rand.Intn(1000000))
}

// POST /api/v1/auth/send-otp
func (h *CustomerAuthHandler) SendOTP(c *gin.Context) {
	var req sendOtpRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// Auto-register: kalau email belum kedaftar, langsung bikinin akun (passwordless)
	var customer models.Customer
	if err := h.DB.Where("email = ?", req.Email).First(&customer).Error; err != nil {
		customer = models.Customer{Email: req.Email}
		if err := h.DB.Create(&customer).Error; err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "failed to create account"})
			return
		}
	}

	code := generateOTP()
	otp := models.OTPCode{
		Email:     req.Email,
		Code:      code,
		ExpiresAt: time.Now().Add(5 * time.Minute),
	}
	if err := h.DB.Create(&otp).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "failed to generate OTP"})
		return
	}

	if err := utils.SendOTPEmail(h.Config, req.Email, code); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "failed to send OTP email: " + err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "OTP sent to email"})
}

// POST /api/v1/auth/verify-otp
func (h *CustomerAuthHandler) VerifyOTP(c *gin.Context) {
	var req verifyOtpRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	var otp models.OTPCode
	err := h.DB.Where("email = ? AND code = ? AND used = false", req.Email, req.Code).
		Order("created_at desc").
		First(&otp).Error
	if err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "invalid OTP code"})
		return
	}

	if time.Now().After(otp.ExpiresAt) {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "OTP code expired"})
		return
	}

	h.DB.Model(&otp).Update("used", true)

	var customer models.Customer
	if err := h.DB.Where("email = ?", req.Email).First(&customer).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "customer not found"})
		return
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"customer_id": customer.ID,
		"exp":         time.Now().Add(24 * time.Hour).Unix(),
	})

	signed, err := token.SignedString([]byte(h.Config.JWTSecret))
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "failed to generate token"})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"access_token": signed,
		"customer": gin.H{
			"id":    customer.ID,
			"email": customer.Email,
			"name":  customer.Name,
		},
	})
}
