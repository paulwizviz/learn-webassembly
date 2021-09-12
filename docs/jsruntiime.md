# Using NodeJS runtime to execute Wasm binary

This project demonstrate the use of NodeJS to execute a Wasm binary file.

## Prerequisite

* Knowledge of Javascript/NodeJS.

* This project was created and verified using `node` v10.16.3 and `npm` v7.23.0.

## Project content

Please refer to this folder [./js-runtime](../js-runtime) for content.

The items of interest to you are:

* [./js-runtime/math.wat](../js-runtime/math.wat) contains Wasm text representing a simple math operation to add two numbers and exporting the operation as a function call `add`.

* [./js-runtime/index.js](../js-runtime/index.js) implements a logic to load `math.wasm`, generated from `math.wat`, and the call the Wasm exported funcion named `add`.

* [./js-runtime/op.sh] a bash script to help you work with this project.

## How to use this project

STEP 1 - Navigate to the foler [./js-runtime](../js-runtime).

STEP 2 - Run the command `op.sh compile` to generate `math.wasm` from `math.wat`.

STEP 3 - Run the command `op.sh run` to execute `index.js`

## Note

* The runtime in this project is NodeJS based, from the one found in Browsers.

* Official support for Wasm is available for Node v8 onwards.
