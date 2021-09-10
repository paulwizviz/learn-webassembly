#!/bin/bash

COMMAND=$1

message="Usage: $0 build | clean | compile | run"

case $COMMAND in
    "build")
        go build -o go-wasm main.go
        ;;
    "clean")
        rm -f ./go-wasm
        rm -f ./math.wasm
        ;;
    "compile")
        wat2wasm math.wat -v
        ;;
    "run")
        go run main.go
        ;;
    *)
        echo $message
        ;;
esac