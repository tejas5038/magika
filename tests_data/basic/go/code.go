package main

import (
	"fmt"
	"time"
)

type Job struct {
	ID      int
	Payload string
}

func worker(jobs <-chan Job, done chan<- int) {
	for job := range jobs {
		fmt.Printf("processing job %d: %s\n", job.ID, job.Payload)
		time.Sleep(5 * time.Millisecond)
		done <- job.ID
	}
}

func main() {
	jobs := make(chan Job, 2)
	done := make(chan int, 2)
	go worker(jobs, done)

	jobs <- Job{ID: 1, Payload: "alpha"}
	jobs <- Job{ID: 2, Payload: "beta"}
	close(jobs)

	fmt.Println("completed", <-done, <-done)
}
