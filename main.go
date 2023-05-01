package main

import (
	"fmt"
	"justbegin/app/database"
	"justbegin/app/routes"
	"net/http"

	"github.com/go-chi/chi/v5"
)

type Notification struct {
	Message string
}

func main() {
		err := database.OpenDatabase()
	if err != nil {
		fmt.Printf("error connecting to postgresql db: %v", err)
	}

	r := chi.NewRouter()

	r.Get("/", routes.HealthCheck)

	http.ListenAndServe("localhost:5000", r)
}
