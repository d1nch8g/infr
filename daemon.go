package main

import (
	"bytes"
	"fmt"
	"os"
	"os/exec"
	"strings"
	"time"

	"github.com/otiai10/copy"
)

const backupTime = 60 * 60 * 24

func main() {
	copyTo := os.Getenv(`COPY_TO`)
	fmt.Println(`will be copying to: `, copyTo)

	i := 0
	for {
		if i%backupTime == 0 {
			err := copy.Copy(`.`, copyTo)
			if err != nil {
				fmt.Println(err)
				continue
			}
		}

		var buf bytes.Buffer
		cmd := exec.Command(`git`, `clone`)
		cmd.Stdout = &buf

		err := cmd.Run()
		if err != nil {
			fmt.Println(err)
			continue
		}

		if strings.Contains()
		time.Sleep(time.Second)
	}
}
