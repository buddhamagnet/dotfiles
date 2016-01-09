package main

import (
	"fmt"
	"os"
	"os/user"
)

var (
	gitFiles   []string
	rcFiles    []string
	replaceAll bool
)

func init() {
	gitFiles = []string{"gitk", "gitignore", "gitconfig"}
	rcFiles = []string{"ackrc", "zshrc"}
}

// cycle through files and check whether identical if so ignore
// if does not exist OK
// if different prompt for overwrite "overwrite ~/.#{file.sub('.erb', '')}? [ynaq] "
// remove
// link "$PWD/#{file}" "$HOME/.#{file}"
func main() {
	fmt.Println("starting install")
	fmt.Println("processing git files")
	for _, file := range gitFiles {
		if fileExists(homeFile(file)) {
			fmt.Printf("file .%s exists in home directory\n", file)
			if filesIdentical(homeFile(file), file) {
				fmt.Println("files are identical")
			}
		}
	}
}

func homeFile(name string) string {
	usr, _ := user.Current()
	return fmt.Sprintf("%s/.%s", usr.HomeDir, name)
}

func removeFile() {}

func linkFile() {}

func fileExists(name string) bool {
	_, err := os.Stat(name)
	return !os.IsNotExist(err)
}

func filesIdentical(file1, file2 string) bool {
	f1, _ := os.Stat(file1)
	f2, _ := os.Stat(file2)
	return os.SameFile(f1, f2)
}
