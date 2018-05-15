package main

import (
	"flag"
	"fmt"
	"io/ioutil"
	"os"
)

var removeAmsdosHeader = flag.Bool("containsheader", false, "the file contains amsdos header")
var inputFile = flag.String("inputfile", "", "Screen file to treat.")
var hexa = flag.Bool("hex",false,"Output values format in hexadecimal.")
var dec = flag.Bool("dec",false,"Output values format in decimal.")

func main() {
	flag.Parse()
	if *inputFile != "" {
		var i = 0
		content, err := ioutil.ReadFile(*inputFile)
		if err != nil {
			fmt.Fprintf(os.Stderr, "Error while reading file %s with error %v\n", *inputFile, err)
			return
		}
		if *removeAmsdosHeader {
			fmt.Fprintf(os.Stderr,"Removing Amsdos header.\n")
			i = 129
		}
		fmt.Printf("; original file %s\n", *inputFile)
		fmt.Fprintf(os.Stderr,"hexa:%v,dec:%v\n", *hexa ,*dec)
		if  *dec == true {
			*hexa = false
			fmt.Fprintf(os.Stderr,"Output format choosen : decimal.\n")			
		} else {
			*hexa = true
			fmt.Fprintf(os.Stderr,"Output format choosen : hexadecimal.\n")			
		}
		
		j := i 
		for  {
			if j < len(content) {
				fmt.Printf(" DB ")
			}
			for h := 0 ; h < 7 ; h++ {
				if j < len(content) {
					if *hexa {
						fmt.Printf("#%.2x, ",content[j])
					} else {
						if *dec {
							fmt.Printf("%d, ",content[j] )
						} else {
							fmt.Fprintf(os.Stderr,"No output format selected.\n")
							return
						}
					}
				} else {
					return
				}
				j++
			}
			if j < len(content) {
				if *hexa {
					fmt.Printf("#%.2x\n",content[j])
				} else {
					if *dec	 {
						fmt.Printf("%d\n",content[j] )
					} else {
						fmt.Fprintf(os.Stderr,"No output format selected.\n")
						return
					}
				}	
			}else {
				return
			}
			j++
		}
	} else {
		fmt.Fprint(os.Stderr,"nothing to do\n")
		flag.PrintDefaults()
		return
	}
}
