package main 

import (
    "fmt"
	"flag"
	"strconv"
	"os"
	"encoding/hex"
)

var decValue = flag.String("dec","","decimal value to convert into hexadecimal")
var hexaValue = flag.String("hex","","hexadecimal value to convert into decimal")

func main() {
	flag.Parse()

	if *decValue != "" {
		v,err  := strconv.Atoi(*decValue)
		if err != nil {
			fmt.Fprintf(os.Stderr,"cannot not parse value %v with error %v",*decValue,err)
			return
		}
		fmt.Printf("%x",v)
	} else {
		if *hexaValue != "" {
			b,err := hex.DecodeString(*hexaValue)
			if err != nil {
				fmt.Fprintf(os.Stderr,"cannot not parse value %v with error %v",*hexaValue,err)
				return
			}
			fmt.Printf("%d",b[0])
		} else {
			flag.PrintDefaults()
		}
	}
	fmt.Printf("\n")
}