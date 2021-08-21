#!/bin/bash

COMMAND=$1

message="Usage: $0 compile | nexdump | objdump | version"

case $COMMAND in
    "compile")
        wat2wasm empty.wat -o empty.wasm
        ;;
    "hexdump")
        xxd basic.wasm
        ;;
    "objdump")
        wasm-objdump -s basic.wasm
        ;;
    "version")
        wat2wasm empty.wat -v
        ;;
    *)
        ;;
esac