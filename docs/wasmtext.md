# Using WebAssembly text format

This project use text format, in the form of [S-expression](https://developer.mozilla.org/en-US/docs/WebAssembly/Understanding_the_text_format#s-expressions), as a representation of the Wasm binary format. 

## Prerequisite

* Knowledge of Wasm text.

* Install [WABT: The WebAssembly Binary Toolkit](https://github.com/WebAssembly/wabt).

## Project content

Please refer to this folder [./wasm-text](../wasm-text) for content.

The items of interest to you are:

* [./wasm-text/simple.wat](../wasm-text/simple.wat). This is the simplest and smallest Wasm text file with only a module declared. For detail explanation of the working of the text please refer to the [official documentation](https://developer.mozilla.org/en-US/docs/WebAssembly/Understanding_the_text_format#the_simplest_module).

* [./wasm-text/math.wat](../wasm-text/math.wat). This Wasm text file representing a mathematical operation to add two numbers. The operation named `add` is exported to be consumed by other components such as, Javascript. Please refer to the [official documentation](https://developer.mozilla.org/en-US/docs/WebAssembly/Understanding_the_text_format#our_first_function_body) for detail explanation of the working of the code.

* [./wam-text/addmultiply.wat](../wasm-text/addmultiply.wat). This is an extension of [./wasm-text/math.wat](../wasm-text/math.wat) demonstrating multiple Wasm functions call each other. This Wasm text performs a two step operation: 1) it adds to numbers, 2) multiply the result of the addition by a factor of 10.

## How to use this project

1) Compile Wasm text to binary

2) Inspecting Wasm binary file *.wasm

<u>1. Compile Wasm text to binary</u>

Assuming you have already installed WABT, please follow these steps to compile the example Wasm text file:

STEP 1: Open a bash shell.

STEP 2: Naviage (`cd`) to the folder [./wasm-text/](../wasm-text/).

STEP 3: Run the command `wat2wasm` as per these format:

```
usage: wat2wasm [options] filename

  read a file in the wasm text format, check it for errors, and
  convert it to the wasm binary format.

examples:
  # parse and typecheck test.wat
  $ wat2wasm test.wat

  # parse test.wat and write to binary file test.wasm
  $ wat2wasm test.wat -o test.wasm

  # parse spec-test.wast, and write verbose output to stdout (including
  # the meaning of every byte)
  $ wat2wasm spec-test.wast -v

options:
      --help                                   Print this help message
      --version                                Print version information
  -v, --verbose                                Use multiple times for more info
      --debug-parser                           Turn on debugging the parser of wat files
  -d, --dump-module                            Print a hexdump of the module to stdout
      --enable-exceptions                      Enable Experimental exception handling
      --disable-mutable-globals                Disable Import/export mutable globals
      --disable-saturating-float-to-int        Disable Saturating float-to-int operators
      --disable-sign-extension                 Disable Sign-extension operators
      --enable-simd                            Enable SIMD support
      --enable-threads                         Enable Threading support
      --disable-multi-value                    Disable Multi-value
      --enable-tail-call                       Enable Tail-call support
      --enable-bulk-memory                     Enable Bulk-memory operations
      --enable-reference-types                 Enable Reference types (externref)
      --enable-annotations                     Enable Custom annotation syntax
      --enable-gc                              Enable Garbage collection
      --enable-memory64                        Enable 64-bit memory
      --enable-all                             Enable all features
  -o, --output=FILE                            output wasm binary file
  -r, --relocatable                            Create a relocatable wasm binary (suitable for linking with e.g. lld)
      --no-canonicalize-leb128s                Write all LEB128 sizes as 5-bytes instead of their minimal size
      --debug-names                            Write debug names to the generated binary file
      --no-check                               Don't check for invalid modules
```

Note:

If you wish to see Wasm in assembly representation, run the command `wat2wasm` with the `-v` option set. For example, when you run the command `wat2wasm simple.wat -v`, you will see an output like this:
```
0000000: 0061 736d                                 ; WASM_BINARY_MAGIC
0000004: 0100 0000                                 ; WASM_BINARY_VERSION
```

<u>2. Inspecting Wasm binary file *.wasm</u>

You can use Linux tools such as `od` (octal dump) or `xxd` (to get a hexdump) of Wasm binary.

Alternatively, use WABT cli tool `wasm-objdump` as per this format:

```
usage: wasm-objdump [options] filename+

  Print information about the contents of wasm binaries.

examples:
  $ wasm-objdump test.wasm

options:
      --help                   Print this help message
      --version                Print version information
  -h, --headers                Print headers
  -j, --section=SECTION        Select just one section
  -s, --full-contents          Print raw section contents
  -d, --disassemble            Disassemble function bodies
      --debug                  Print extra debug information
  -x, --details                Show section details
  -r, --reloc                  Show relocations inline with disassembly
```

Note:

To disassembly Wasm binary, use this command `wasm-objdump -d math.wasm`. You will see this output:

```
math.wasm:      file format wasm 0x1

Code Disassembly:

 000022 func[0] <add>:
 000023: 20 00                      | local.get 0
 000025: 20 01                      | local.get 1
 000027: 6a                         | i32.add
 000028: 0b                         | end
 ```

