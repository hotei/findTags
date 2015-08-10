// findTags.go (c) 2015 David Rook
//
// usage: findTags *.go > bugs.txt
//
package main

import (
	"bufio"
	"flag"
	"fmt"
	"io"
	"log"
	"os"
	"strings"
)

var OKTag = "OKKO"

var tags []string = []string{
	"if false",
	"if true",
	"8888",
	"MagicNumber",
	"BUG(",
	"TODO(",
}

// hasTag is true if line is tagged as a bug or "8888 => needs attention" OKKO
// lines marked with OKTag have been dealt with (or ignored)
func hasTag(s string) bool {
	if strings.Contains(s, OKTag) {
		return false
	}
	for i := 0; i < len(tags); i++ {
		if strings.Contains(s, tags[i]) {
			return true
		}
	}
	return false
}

func doFile(fname string) {
	f, err := os.Open(fname)
	if err != nil {
		log.Panicf("Cant open %s, error:%v\n", fname, err)
	}
	defer f.Close()
	rdr := bufio.NewReader(f)
	alldone := false
	n := 1
	for {
		line, err := rdr.ReadString('\n')
		if err != nil {
			if err == io.EOF {
				alldone = true
			} else {
				log.Panicf("mdr: GetAllArgs read error")
			}
		}
		line = strings.TrimSpace(line)
		if alldone {
			break
		}
		// fmt.Printf("line:%q\n", line)
		if hasTag(line) {
			fmt.Printf("%s %5d: %s\n", fname, n, line)
		}
		n++
	}
}

func main() {
	flag.Parse()
	args := flag.Args()
	for _, arg := range args {
		fmt.Printf("%s\n", arg)
		doFile(arg)
	}
}
