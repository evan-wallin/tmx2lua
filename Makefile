.PHONY = clean fmt tar upload

all: fmt osx/tmx2lua.osx.zip 
GOPATH=$(HOME)/gopath
export GOPATH

install:
	go get github.com/kyleconroy/go-tmx/tmx

osx/tmx2lua.osx.zip: tmx2lua.go
	mkdir -p osx
	GOOS=darwin GOARCH=amd64 go build -o osx/tmx2lua
	cd osx && zip tmx2lua.osx.zip tmx2lua
	
fmt: 
	go fmt tmx2lua.go

clean: 
	go clean
	rm -rf windows32
	rm -rf windows64
	rm -rf osx
	rm -rf linux
	rm -rf linux64
