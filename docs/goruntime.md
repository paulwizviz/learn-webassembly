# Using Go runtime to execute WASM binary

In this project, you see an example using Go runtime to execute a WASM binary.

NOTE:

> You would typically use high level language such as Go to create WASM binary. In this case we are **not** using Go to generate WASM binary. We are using Go WASM runtime module to execute a WASM binary file.

## Prerequisite

Please install Go1.16 or later (see [official documentation](https://golang.org/doc/install) for instruction).

## Project description

This project assumes that you have basic knowledge of Go coding.

In this project, we created our WASM binary from WASM text. Our WASM text [./go-runtime/math.wat](../go-runtime/math.wat) contains a logic to add two numbers and the result is exported as a function call `add` to be consumed by our Go application `main.go`.

For this project, we are using Go file embedding feature as per Go1.16 that will embed `math.wasm` in the Go app. The app also use Go module `github.com/wasmerio/wasmer-go` to execute `math.wasm` and call its exported function name `add`.

## How to use this project

STEP 1 - Naviagete to the folder [./go-runtime](../go-runtime).

STEP 2 - Compile `math.wat` to generate `math.wasm` using the script [./go-runtime/op.sh](../go-runtime/op.sh) with this command `./op.sh compile`.

STEP 3 - Ensure you already have `math.wasm` and then use the script [./go-runtime/op.sh](../go-runtime/op.sh) to:

a) build a native Go app name `go-wasm` with this command `./op.sh build`,

b) debug `math.wasm` by running the command `op.sh run`.

NOTE: If you build `go-wasm` app, you will find `math.wasm` embedded in the app. This means you can take `go-wasm` run it without having `math.wasm` along side it.
