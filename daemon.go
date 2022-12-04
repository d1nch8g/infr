package main

import (
	"fmt"
	"os"
	"time"
)

func main() {
	copyTo := os.Getenv(`COPY_TO`)
	fmt.Println(`will be copying to: `, copyTo)
	for {
		time.Sleep(time.Second)
		
	}
}
