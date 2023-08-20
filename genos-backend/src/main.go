package main

import (
	"fmt"
	"net/http"

	"github.com/go-chi/chi"
)

func main() {
  fmt.Println("Starting API server...")

	db, err := ConnectToDatabase()

	defer db.Close()

  CreateTables(db)

  if err != nil {
		fmt.Println("Error connecting to the database:", err)
		return
	}

  router := chi.NewRouter()
  router.Post("/user/{username}", CreateUserHandler(db))
  router.Get("/user/{userId}", GetUserHandler(db))

  router.Post("/metrics", CreateMetricHandler(db)) 
  router.Put("/metrics", UpdateMetricBalanceHandler(db)) 
  router.Get("/metrics/user/{user_id}", GetMetricsByUserIDHandler(db))

  err = http.ListenAndServe(":8080", router)

  if err != nil {
    fmt.Println(err)
  }
}
