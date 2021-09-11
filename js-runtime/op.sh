#!/bin/bash

wat2wasm math.wat -v
if [ ! -f math.wasm ]; then
    echo "WASM binary not found"
    exit 0
fi

if [ -f ./pub/math.wasm ]; then
    rm -f ./pub/math.wasm
fi

mv math.wasm ./pub/math.wasm