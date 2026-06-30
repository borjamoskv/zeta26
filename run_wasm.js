const fs = require('fs');
const readline = require('readline');

if (process.argv.length < 3) {
  console.log("Usage: node run_wasm.js <file.wasm>");
  process.exit(1);
}

const wasmFile = process.argv[2];
const wasmBuffer = fs.readFileSync(wasmFile);

// Buffer for numeric inputs
let numBuffer = "";

const importObject = {
  env: {
    print_char: (c) => {
      process.stdout.write(String.fromCharCode(c & 0xFF));
    },
    print_num: (n) => {
      process.stdout.write(String(n));
    },
    read_char: () => {
      // Synchronous char read (mocked or fallback to 0 for simplicity)
      // Node.js doesn't easily support block-less stdin reads synchronously without external deps.
      // We read from a static input buffer if needed, or return 0.
      return 0;
    },
    read_num: () => {
      return 0;
    }
  }
};

WebAssembly.instantiate(wasmBuffer, importObject)
  .then((obj) => {
    obj.instance.exports.main();
  })
  .catch((err) => {
    console.error("[WASM ERROR]", err);
  });
