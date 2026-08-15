package routes

import (
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"

	"wavy-backend/internal/config"
	"wavy-backend/internal/handlers"
	"wavy-backend/internal/middleware"
)

func RegisterRoutes(router *gin.Engine, db *gorm.DB, cfg *config.Config) {
	authHandler := &handlers.AuthHandler{DB: db, JWTSecret: cfg.JWTSecret}
	customerAuthHandler := &handlers.CustomerAuthHandler{DB: db, Config: cfg}
	eventHandler := &handlers.EventHandler{DB: db}
	artistHandler := &handlers.ArtistHandler{DB: db}
	ticketCategoryHandler := &handlers.TicketCategoryHandler{DB: db}
	dashboardHandler := &handlers.DashboardHandler{DB: db}
	orderHandler := &handlers.OrderHandler{DB: db}
	organizerOrderHandler := &handlers.OrganizerOrderHandler{DB: db}

	v1 := router.Group("/api/v1")
	{
		auth := v1.Group("/auth")
		{
			auth.POST("/organizer/login", authHandler.OrganizerLogin)
			auth.POST("/send-otp", customerAuthHandler.SendOTP)
			auth.POST("/verify-otp", customerAuthHandler.VerifyOTP)
		}

		// Semua route di bawah /organizer wajib login (pakai middleware AuthRequired)
		organizer := v1.Group("/organizer")
		organizer.Use(middleware.AuthRequired(cfg.JWTSecret))
		{
			events := organizer.Group("/events")
			{
				events.GET("", eventHandler.List)
				events.POST("", eventHandler.Create)
				events.GET("/:id", eventHandler.Get)
				events.PUT("/:id", eventHandler.Update)
				events.DELETE("/:id", eventHandler.Delete)
				events.POST("/:id/close-sales", eventHandler.CloseSales)

				events.GET("/:id/ticket-categories", ticketCategoryHandler.List)
				events.POST("/:id/ticket-categories", ticketCategoryHandler.Create)
			}

			artists := organizer.Group("/artists")
			{
				artists.GET("", artistHandler.List)
				artists.POST("", artistHandler.Create)
				artists.PUT("/:id", artistHandler.Update)
				artists.DELETE("/:id", artistHandler.Delete)
			}

			ticketCategories := organizer.Group("/ticket-categories")
			{
				ticketCategories.PUT("/:id", ticketCategoryHandler.Update)
				ticketCategories.DELETE("/:id", ticketCategoryHandler.Delete)
			}

			organizer.GET("/dashboard", dashboardHandler.Get)

			orders := organizer.Group("/orders")
			{
				orders.GET("", organizerOrderHandler.List)
				orders.POST("/:id/verify", organizerOrderHandler.Verify)
			}
		}

		customerOrders := v1.Group("/orders")
		customerOrders.Use(middleware.CustomerAuthRequired(cfg.JWTSecret))
		{
			customerOrders.POST("", orderHandler.Create)
			customerOrders.GET("/history", orderHandler.History)
			customerOrders.GET("/:id", orderHandler.Get)
		}
		// TODO: v1.Group("/concerts") — endpoint publik buat customer browse concert
		// TODO: v1.Group("/orders") — checkout, payment (customer side)
		// TODO: v1.Group("/tickets") — QR wallet
	}
}
