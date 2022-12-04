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
		i += 1
		if i%backupTime == 0 {
			err := copy.Copy(`.`, copyTo)
			if err != nil {
				fmt.Println(`unable to copy `, err)
				time.Sleep(time.Second * 5)
				continue
			}
		}
		// /dev/sdb

		var buf bytes.Buffer
		cmd := exec.Command(`git`, `pull`)
		cmd.Stdout = &buf

		err := cmd.Run()
		if err != nil {
			fmt.Println(`unable to git pull`, err)
			time.Sleep(time.Second * 5)
			continue
		}

		if strings.Contains(string(buf.Bytes()), `up to date`) {
			time.Sleep(time.Second * 5)
			continue
		}

		cmdDocker := exec.Command(`docker`, `compose`, `restart`)
		err = cmdDocker.Run()
		if err != nil {
			fmt.Println(`unable to restart, `, err)
		}

		time.Sleep(time.Minute)
	}
}
