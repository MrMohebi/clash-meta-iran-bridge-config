package main

import (
	"github.com/muonsoft/validation/validate"
	"os"
)

func main() {

	argsLen := len(os.Args) < 2
	if argsLen {
		os.Exit(1)
		return
	}

	arg := os.Args[1]

	err := validate.IP(arg)
	if err != nil {
		os.Exit(1)
	} else {
		os.Exit(0)
	}
}
