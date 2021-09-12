#!/bin/bash

COMMAND=$1

case $COMMAND in
    compile)
        wat2wasm math.wat -v
        ;;
    run)
        node index.js
        ;;
    *)
        echo "Usage: $0 compile | run"
        ;;
esac
