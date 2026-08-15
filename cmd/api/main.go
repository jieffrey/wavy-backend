package main

import (
	"log"

	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"

	"wavy-backend/internal/config"
	"wavy-backend/internal/database"
	"wavy-backend/internal/routes"
)

func main() {
	// Load .env file (ignore error kalau gak ada, misal di production pakai env asli)
	if err := godotenv.Load(); err != nil {
		log.Println("No .env file found, using system environment variables")
	}

	cfg := config.Load()

	db, err := database.Connect(cfg)
	if err != nil {
		log.Fatalf("failed to connect to database: %v", err)
	}

	if err := database.AutoMigrate(db); err != nil {
		log.Fatalf("failed to run migrations: %v", err)
	}

	router := gin.Default()
	routes.RegisterRoutes(router, db, cfg)

	log.Printf("Wavy API running on port %s", cfg.Port)
	if err := router.Run(":" + cfg.Port); err != nil {
		log.Fatalf("failed to start server: %v", err)
	}
}
