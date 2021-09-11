# Using NodeJS runtime to execute WASM binary

In this project, you will find an example using NodeJS to execute a WASM binary file.

## Prerequisite

This project was created and verified using:

* `node` v10.16.3 (A number of sources suggest official support is available for Node v8 onward).

* `npm` v7.23.0.

## Project description

In this project, we created or WASM binary from WASM text. Our WASM text [./js-runtime/math.wat](../js-runtime/math.wat) contains a logic to add two numbers and the result is exported as a function call `add` to be consumed by our Go application `main.go`.

For this project, we import `webassembly (v0.11.0)` module and implement it in [./js-runtime/pub/index.js](../js-runtime/pub/index.js). Our `index.js` loads `math.wasm` and it calls the WASM exported function `add`.

## How to use this project

STEP 1 - Navigate to the foler [./js-runtime](../js-runtime).

STEP 2 - Run the command `npm run wasm` and this will generate `math.wasm` in [./js-runtime/pub/math.wasm](../js-runtime/pub/math.wasm).

STEP 3 - Run the command `npm start` and, this will execute [./js-runtime/pub/index.js](../js-runtime/pub/index.js) and [./js-runtime/pub/math.wasm](../js-runtime/pub/math.wasm).



