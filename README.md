# Overview

A collection of projects to demonstrate the inner workings of WebAssembly (Wasm)

## Prerequisite

To work with these projects, please install [WABT: The WebAssembly Binary Toolkit](https://github.com/WebAssembly/wabt).

On macOS, you can use Homebrew. Run this command `brew install wabt`.

## Projects

* [Using WebAssembly text format](./docs/wasmtext.md). A collection of Wasm texts.
* [A basic Go runtime example](./docs/goruntime.md). A simple project demonstrating the use Go Wasm runtime engine.
* [A basic Javascript/Node example](./docs/jsruntime.md). A simple project demonstrating the use of NodeJS Wasm runtime engine. 

## Disclaimer

These projects are intended for experimentation and to demonstrate concepts only.

## References

* [Wasm explorer](https://mbebenita.github.io/WasmExplorer/) - A browser base C++ to Wasm generator
* [An introduction to WebAssembly](https://www.youtube.com/watch?v=3sU557ZKjUs) - A detail explanation of the inner workings of Wasm.
* [Understanding WebAssembly text format](https://developer.mozilla.org/en-US/docs/WebAssembly/Understanding_the_text_format) - Official documentation on Wasm text