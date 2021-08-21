#!/bin/bash

COMMAND=$1

message="Usage: $0 compile | run"

case $COMMAND in
    "compile")
        wat2wasm multi.wat -v
        ;;
    "run")
        go run main.go
        ;;
    *)
        echo $message
        ;;
esac