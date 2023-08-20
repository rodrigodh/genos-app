package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	"github.com/go-chi/chi"
	"github.com/google/uuid"
	_ "github.com/mattn/go-sqlite3"
)

type User struct {
	ID      uuid.UUID `json:"id"`
  Name    string    `json:"name"`
}

func CreateUserHandler(db *sql.DB) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		id := uuid.New()
		username := chi.URLParam(r, "username")
		
		insertDataSQL := "INSERT INTO users (id, name) VALUES (?, ?)"
		_, err := db.Exec(insertDataSQL, id, username)
		
		if err != nil {
			log.Print(err)
		}
		
		w.WriteHeader(http.StatusOK)
		fmt.Fprintf(w, `{
			"id": "%s",
			"username": "%s"
		}`, id, username)
	}
}

func GetUserHandler(db *sql.DB) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		userID, err := uuid.Parse(chi.URLParam(r, "userId"))
		if err != nil {
			http.Error(w, "Invalid user ID", http.StatusBadRequest)
			return
		}

		fmt.Printf("user: %v\n", userID)

		// Fetch user from the database by ID.
		user, err := GetUserFromDatabase(db, userID)
		if err != nil {
			http.Error(w, "User not found", http.StatusNotFound)
			return
		}

		// Respond with the user data in JSON format.
		jsonData, err := json.Marshal(user)
		if err != nil {
			http.Error(w, "Error encoding JSON", http.StatusInternalServerError)
			return
		}

		w.Header().Set("Content-Type", "application/json")
		w.WriteHeader(http.StatusOK)
		w.Write(jsonData)
	}
}

// Database queries

func GetUserFromDatabase(db *sql.DB, userID uuid.UUID) (*User, error) {
	query := "SELECT id, name FROM users WHERE id = ?"
	row := db.QueryRow(query, userID)

	var user User
	err := row.Scan(&user.ID, &user.Name)
	if err != nil {
		return nil, err
	}

	return &user, nil
}
