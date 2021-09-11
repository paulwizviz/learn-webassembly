# Using NodeJS runtime to execute Wasm binary

This project demonstrate the use of NodeJS to execute a Wasm binary file.

## Prerequisite

* Knowledge of Javascript/NodeJS.

* This project was created and verified using `node` v10.16.3 and `npm` v7.23.0.

## Project content

Please refer to this folder [./js-runtime](../js-runtime) for content.

The items of interest to you are:

* [./js-runtime/math.wat](../js-runtime/math.wat) contains Wasm text representing a simple math operation to add two numbers and exporting the operation as a function call `add`.

* [./js-runtime/pub/index.js](../js-runtime/pub/index.js) implements a logic to load `math.wasm`, generated from `math.wat`, and the call the Wasm exported funcion named `add`.

* [./js-runtime/package.json] an `npm` configuration script.

## How to use this project

STEP 1 - Navigate to the foler [./js-runtime](../js-runtime).

STEP 2 - Run the command `npm run wasm` and this will generate `math.wasm` in [./js-runtime/pub/math.wasm](../js-runtime/pub/math.wasm).

STEP 3 - Run the command `npm start` and, this will execute [./js-runtime/pub/index.js](../js-runtime/pub/index.js) and [./js-runtime/pub/math.wasm](../js-runtime/pub/math.wasm).


## Note

* The runtime in this context is NodeJS based, which is not the same as the one found in Browsers.

* A number of sources suggest official support for Wasm is available for Node v8 onwards.
