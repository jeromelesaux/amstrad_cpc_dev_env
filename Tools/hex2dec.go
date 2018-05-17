package main

import (
	"flag"
	"fmt"
	"os"
	"strconv"
	"math/big"
)

var decValue = flag.String("dec", "", "decimal value to convert into hexadecimal")
var hexaValue = flag.String("hex", "", "hexadecimal value to convert into decimal")

func main() {
	flag.Parse()
	var value string
	if *decValue != "" {

		if (*decValue)[0] == '-' {
			value = (*decValue)[1:]
		} else {
			value = (*decValue)[0:]
		}
		v, err := strconv.Atoi(value)
		if err != nil {
			fmt.Fprintf(os.Stderr, "cannot not parse value %v with error %v", value, err)
			return
		}
		fmt.Printf("%x", v)
	} else {

		if *hexaValue != "" {
			v := new(big.Int)
			fmt.Sscanf(*hexaValue,"%x",v)
			fmt.Printf("%d",v)
		} else {
			flag.PrintDefaults()
		}
	}
	fmt.Printf("\n")
}
