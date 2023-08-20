package main

import (
	"database/sql"
	"fmt"
	"net/http"
  "encoding/json"


	"github.com/go-chi/chi"
	"github.com/google/uuid"
	_ "github.com/mattn/go-sqlite3"
)

type Metric struct {
   	ID             uuid.UUID `json:"id"`
  	UserID         string    `json:"user_id"`
		Date           string    `json:"date"`
		ExercisesDone  bool      `json:"exercises_done"`
		Balance        float64   `json:"balance"`
}

func CreateMetricHandler(db *sql.DB) http.HandlerFunc {
  return func(w http.ResponseWriter, r *http.Request) {
		var reqData Metric 
    err := json.NewDecoder(r.Body).Decode(&reqData)
		if err != nil {
			http.Error(w, "Invalid request data", http.StatusBadRequest)
			return
		}

		id := uuid.New()

		insertDataSQL := `
		INSERT INTO metrics (id, user_id, date, exercises_done, balance)
		VALUES (?, ?, ?, ?, ?)`

		_, err = db.Exec(insertDataSQL, id, reqData.UserID, reqData.Date, reqData.ExercisesDone, reqData.Balance)
		if err != nil {
			http.Error(w, "Error inserting metric data", http.StatusInternalServerError)
			return
		}

		w.WriteHeader(http.StatusCreated)
		fmt.Fprintf(w, "Metric data created successfully")
	}
}

func UpdateMetricBalanceHandler(db *sql.DB) http.HandlerFunc {
	type UpdateMetricBalanceRequest struct {
		Date    string  `json:"date"`
		Balance float64 `json:"balance"`
	}

	return func(w http.ResponseWriter, r *http.Request) {
		var reqData UpdateMetricBalanceRequest
		err := json.NewDecoder(r.Body).Decode(&reqData)
		if err != nil {
			http.Error(w, "Invalid request data", http.StatusBadRequest)
			return
		}

		updateDataSQL := `
		UPDATE metrics
		SET balance = ?
		WHERE date = ?`

		_, err = db.Exec(updateDataSQL, reqData.Balance, reqData.Date)
		if err != nil {
			http.Error(w, "Error updating metric balance", http.StatusInternalServerError)
			return
		}

		w.WriteHeader(http.StatusOK)
		fmt.Fprintf(w, "Metric balance updated successfully")
	}
}

func GetMetricsByUserIDHandler(db *sql.DB) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		userID := chi.URLParam(r, "user_id")

		metrics, err := GetMetricsByUserIDFromDatabase(db, userID)
		if err != nil {
			http.Error(w, "Error retrieving metrics", http.StatusInternalServerError)
			return
		}

		jsonData, err := json.Marshal(metrics)
		if err != nil {
			http.Error(w, "Error encoding JSON", http.StatusInternalServerError)
			return
		}

		w.Header().Set("Content-Type", "application/json")
		w.WriteHeader(http.StatusOK)
		w.Write(jsonData)
	}
}

func GetMetricsByUserIDFromDatabase(db *sql.DB, userID string) ([]Metric, error) {
	query := "SELECT id, user_id, date, exercises_done, balance FROM metrics WHERE user_id = ?"
	rows, err := db.Query(query, userID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var metrics []Metric
	for rows.Next() {
		var metric Metric
		err := rows.Scan(&metric.ID, &metric.UserID, &metric.Date, &metric.ExercisesDone, &metric.Balance)
		if err != nil {
			return nil, err
		}
		metrics = append(metrics, metric)
	}

	if err := rows.Err(); err != nil {
		return nil, err
	}

	return metrics, nil
}
