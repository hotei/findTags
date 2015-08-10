# Makefile for findTags program

# you can do it with a simple "go build" but
# my typical development cycle looks like this:

# TOP:
# for {
#   inspect the bug/feature list
#	jedit something
#	"make"
#	if no bugs { break }
# }
# "make install"
# if bugs found loop back to TOP
# "go test"
# "make cover"
# "make docs"
# "make clean"
# "make index"
# if needed "make bugs"
# "make tar"

PROG = findTags
VERSION = 0.1.0
TARDIR = 	$(HOME)/Desktop/TarPit/
DATE = 	`date "+%Y-%m-%d.%H_%M_%S"`
DOCOUT = README-$(PROG)-godoc.md

all:
	go build -v

install:
	go build -v
	go tool vet .
	go tool vet -shadow .
	gofmt -w *.go
#	go install
	cp $(PROG) $(HOME)/bin
	
docs:
	godoc2md . > $(DOCOUT)
	godepgraph -md -p . >> $(DOCOUT)
	deadcode -md >> $(DOCOUT)
	echo "\`\`\`" >> $(DOCOUT)
	echo built with go version = $(GOVERSION) >> $(DOCOUT)
	echo "\`\`\`" >> $(DOCOUT)
	cp README-$(PROG).md README.md
	cat $(DOCOUT) >> README.md
	cp README.md README2.md

neat:
	go fmt ./...

# NoteBene: bugs will fail [err=1] if the search string isn't found
# bugs format is suitable for catting to the end of a .md file

bugs:
	echo "Bugs and stuff" > bugs.txt
	echo "\`\`\`" > bugs.lst
	cat *.go | findTags >> bugs.txt
	sort < bugs.txt | uniq >> bugs.lst
	echo "\`\`\`" >> bugs.lst
	
dead:
	deadcode > problems.dead

# PS: I use github.com/junkblocker/codesearch here
index:
	cindex .

clean:
	go clean ./...
	rm -f *~ problems.dead count.out bugs.txt bugs.lst

#cover:
#	go test -covermode=count -coverprofile=count.out
#	go tool cover -html=count.out

tar:
	echo $(TARDIR)$(PROG)_$(VERSION)_$(DATE).tar
	tar -ncvf $(TARDIR)$(PROG)_$(VERSION)_$(DATE).tar .

