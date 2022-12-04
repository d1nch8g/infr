package main

import (
	"bytes"
	"fmt"
	"io/fs"
	"os/exec"
	"strings"
	"time"

	"github.com/otiai10/copy"
)

const (
	backupTime = 60 * 60 * 24
	copyto     = `/run/media/dancheg97/DATA/backup/`
)

func main() {
	i := 0
	for {
		i += 1
		if i%backupTime == 1 {
			err := copy.Copy(`.`, copyto, copy.Options{
				OnDirExists: func(src string, dest string) copy.DirExistsAction {
					return copy.Replace
				},
				Skip: func(srcinfo fs.FileInfo, src string, dest string) (bool, error) {
					if strings.Contains(src, `ssh`) {
						return true, nil
					}
					return false, nil
				},
			})
			if err != nil {
				fmt.Println(`unable to copy `, err)
				time.Sleep(time.Second * 5)
				continue
			}
			fmt.Println(`backup created`)
		}

		var buf bytes.Buffer
		cmd := exec.Command(`git`, `pull`)
		cmd.Stdout = &buf

		err := cmd.Run()
		if err != nil {
			fmt.Println(`unable to git pull`, err)
			time.Sleep(time.Second * 5)
			continue
		}

		if strings.Contains(buf.String(), `up to date`) {
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
