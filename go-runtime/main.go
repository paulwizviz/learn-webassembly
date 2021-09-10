package main

import (
	"embed"
	"fmt"

	wasmer "github.com/wasmerio/wasmer-go/wasmer"
)

//go:embed math.wasm
var f embed.FS

func main() {
	wasmBytes, _ := f.ReadFile("math.wasm")

	engine := wasmer.NewEngine()
	store := wasmer.NewStore(engine)

	// Compiles the module
	module, _ := wasmer.NewModule(store, wasmBytes)

	// Instantiates the module
	importObject := wasmer.NewImportObject()
	instance, _ := wasmer.NewInstance(module, importObject)

	// Gets the `add` exported function from the WebAssembly instance.
	add, _ := instance.Exports.GetFunction("add")

	// Calls that exported function with Go standard values. The WebAssembly
	// types are inferred and values are casted automatically.
	result, _ := add(1, 1)

	fmt.Println(result) // 42!
}
