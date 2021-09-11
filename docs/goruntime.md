# Using Go runtime to execute Wasm binary

This simple project demonstrates the use of Go runtime module to execute a Wasm binary. This is **not** a project demonstrating the use of Go to generate Wasm binary.

## Prerequisite

* Knowledge of Go coding.

* Install Go1.16 or later (see [official documentation](https://golang.org/doc/install) for instruction).

## Project content

Please refer to this folder [./go-runtime](../go-runtime) for content.

The items of interest to you are:

* [./go-runtime/math.wat](../go-runtime/math.wat) contains Wasm text representing a simple math operation to add two numbers and exporting the operation as a function call `add`.

* [./go-runtime/main.go](../go-runtime/main.go) a Go code containing logic to execute `math.wasm` which is generated from `math.wat`.

* [./go-runtime/op.sh](../go-runtime/op.sh) a script to help you work with the project.


## How to use this project

STEP 1 - Naviagete to the folder [./go-runtime](../go-runtime).

STEP 2 - Compile `math.wat` to generate `math.wasm` using the script [./go-runtime/op.sh](../go-runtime/op.sh) with this command `./op.sh compile`.

STEP 3 - Ensure you already have `math.wasm` and then use the script [./go-runtime/op.sh](../go-runtime/op.sh) to:

a) build a native Go app named `go-wasm` with this command `./op.sh build`,

b) debug `math.wasm` by running the command `op.sh run`.

## Note 

* This project use Go module `github.com/wasmerio/wasmer-go` to execute `math.wasm` and call its exported function name `add`.

* This project uses a Go file embeeding feature as per Go1.16. When you create a native app named `go-wasm`, it embeds `math.wasm` in the Go app. This means you can take `go-wasm` run it without having `math.wasm` along side it.
