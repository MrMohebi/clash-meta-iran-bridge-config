package main

import (
	"errors"
	"gopkg.in/yaml.v2"
	"log"
	"os"
)

func main() {

	argsLen := len(os.Args) < 2
	if argsLen {
		os.Exit(1)
		return
	}
	arg := os.Args[1]

	if _, err := os.Stat(arg); errors.Is(err, os.ErrNotExist) {
		log.Fatal(arg + " does not exist")
	}

	file, err := os.ReadFile(arg)
	if err != nil {
		log.Fatal(err)
	}

	m := make(map[interface{}]interface{})

	err = yaml.Unmarshal(file, &m)
	if err != nil {
		log.Fatal(err)
	}

	file = []byte(os.ExpandEnv(string(file)))

	err = os.WriteFile(arg, file, 0644)
	if err != nil {
		log.Fatal(err)
	}

}
