# Using WebAssembly text format

This project use text format, in the form of [S-expression](https://developer.mozilla.org/en-US/docs/WebAssembly/Understanding_the_text_format#s-expressions), as a representation of the WASM binary format. 

## WASM Text files

You can find examples of WASM text files in the folder [./wasm-text](../wasm-text) and these are:

* [./wasm-text/simple.wat](../wasm-text/simple.wat). This is the simplest and smallest WASM text file with only a module declared. For detail explanation of the working of the text please refer to the [official documentation](https://developer.mozilla.org/en-US/docs/WebAssembly/Understanding_the_text_format#the_simplest_module).

* [./wasm-text/math.wat](../wasm-text/math.wat). This WASM text file representing a mathematical operation to add two numbers. The operation named `add` is exported to be consumed by other components such as, Javascript. Please refer to the [official documentation](https://developer.mozilla.org/en-US/docs/WebAssembly/Understanding_the_text_format#our_first_function_body) for detail explanation of the working of the code.

* [./wam-text/addmultiply.wat](../wasm-text/addmultiply.wat). This is an extension of [./wasm-text/math.wat](../wasm-text/math.wat) demonstrating multiple WASM functions call each other. This WASM text performs a two step operation: 1) it adds to numbers, 2) multiply the result of the addition by a factor of 10.

## Compile the WASM text to binary

Assuming you have already installed WABT, please follow these steps to compile the example WASM text file:

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

NOTE:

> If you wish to see WASM in assembly representation, run the command `wat2wasm` with the `-v` option set. For example, when you run the command `wat2wasm simple.wat -v`, you will see an output like this:
>```
>0000000: 0061 736d                                 ; WASM_BINARY_MAGIC
>0000004: 0100 0000                                 ; WASM_BINARY_VERSION
>```

## Inspecting the WASM binary file *.wasm

You can use Linux tools such as `od` (octal dump) or `xxd` (to get a hexdump) of WASM binary.

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

For example, running this command `wasm-objdump -d math.wasm` produces this output:

```
math.wasm:      file format wasm 0x1

Code Disassembly:

000022 func[0] <add>:
 000023: 20 00                      | local.get 0
 000025: 20 01                      | local.get 1
 000027: 6a                         | i32.add
 000028: 0b                         | end
```

