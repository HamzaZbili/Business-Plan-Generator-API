package routes

import (
	"encoding/json"
	"fmt"
	"net/http"
)

type Notification struct {
	Message string
}

func HealthCheck(w http.ResponseWriter, r *http.Request) {
	var rootMessage Notification
	rootMessage.Message = "all good here!"
	response, err := json.Marshal(rootMessage.Message)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		fmt.Printf("error marshalling welcome message into json %v", err)
		return
	}
	w.WriteHeader(http.StatusAccepted)
	w.Write(response)
}