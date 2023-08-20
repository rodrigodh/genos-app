package main

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/mattn/go-sqlite3"
)

func ConnectToDatabase() (*sql.DB, error) {
	db, err := sql.Open("sqlite3", "data.db")

	if err != nil {
		return nil, err
	}

	return db, nil
}

func CreateTables(db *sql.DB) {
	// Create user table.
	createTableSQL := `
	CREATE TABLE IF NOT EXISTS users (
		id TEXT PRIMARY KEY,
		name TEXT NOT NULL
	);

	CREATE TABLE IF NOT EXISTS metrics (
		id TEXT PRIMARY KEY,
		user_id TEXT NOT NULL,
		date DATE NOT NULL,
		exercises_done BOOLEAN,
		balance FLOAT,
		FOREIGN KEY (user_id) REFERENCES users (id)
	);`

	_, err := db.Exec(createTableSQL)

	if err != nil {
		log.Fatal(err)
	}

	fmt.Println("Tables inserted successfully.")
}
