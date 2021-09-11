require("webassembly")
    .load("./pub/math.wasm")
    .then(module => {
        console.log(module.exports.add(1,2));
    });