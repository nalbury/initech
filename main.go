package main

import (
	"net/http"
	"github.com/gorilla/handlers"
	"os"
)

func main() {
	path := os.Getenv("INITECH_PATH")
	fs := handlers.CombinedLoggingHandler(os.Stdout, http.FileServer(http.Dir(path)))
	http.ListenAndServe(":8080", fs)
}
