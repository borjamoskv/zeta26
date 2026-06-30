// Examples
const EXAMPLES = {
  countdown: `PUSH 10
JZ
DUP
OUTN
PUSH 10
OUTA
DEC
JNZ`,

  fibonacci: `X F U
F G U
G G G A U
F V
Q
J
G V N X M
G G A V
G G G A A U
G V
G G A V
A
G G A U
G G G A A V
G U
F V L F U
F V
Z`,

  moskv: `XGAGAGAGAGAGACGAGAGAGAGAGAGAMXGAGAGAGAGAGACGAGAGAGAGAGAGAGAGAMXGAGAGAGAGAGAGACGAGAGAMXGAGAGAGAGAGACGAGAGAGAGAMXGAGAGAGAGAGAGACGAGAGAGAGAGAMXGAGAGACGAGAGAGAGAMXGAGAGACGAGAGAGAGAGAGAGAGAMXGAGACGAGAMXGAGAGAGAGACGAGAGAGAGAMXGAGAGAGAGAGAGACMXGAGAGAGAGACGAGAGAGAGAGAGAGAGAMXGAGAGAGAGAGAGACGAGAGAGAGAGAGAGAM`
};

const OPCODES = {
  'ADD': 'A', 'SUB': 'B', 'MUL': 'C', 'DIV': 'D', 'MOD': 'E',
  'ZERO': 'F', 'ONE': 'G', 'DUP': 'H', 'SWP': 'I', 'POP': 'J',
  'INC': 'K', 'DEC': 'L', 'OUTA': 'M', 'OUTN': 'N', 'INPA': 'O',
  'INPN': 'P', 'JZ': 'Q', 'EQU': 'R', 'LSS': 'S', 'GRT': 'T',
  'STR': 'U', 'LDR': 'V', 'PSH26': 'W', 'PSH10': 'X', 'NOP': 'Y',
  'JNZ': 'Z'
};

function encodeNumber(n) {
  if (n === 0) return 'F';
  if (n === 1) return 'G';
  if (n === 10) return 'X';
  if (n === 26) return 'W';
  const tens = Math.floor(n / 10);
  const ones = n % 10;
  let code = '';
  function pushDigit(d) {
    if (d === 0) return 'F';
    if (d === 1) return 'G';
    let res = 'G';
    for (let i = 0; i < d - 1; i++) res += 'GA';
    return res;
  }
  if (tens > 0) {
    if (tens === 1) code += 'X';
    else code += 'X' + pushDigit(tens) + 'C';
  }
  if (ones > 0) {
    code += pushDigit(ones);
    if (tens > 0) code += 'A';
  }
  return code;
}

function assemble(asmText) {
  let zetaCode = "";
  const lines = asmText.split('\n');
  for (let i = 0; i < lines.length; i++) {
    let line = lines[i].trim();
    if (!line || line.startsWith(';')) continue;
    if (line.includes(';')) line = line.split(';')[0].trim();
    
    const parts = line.split(/\s+/);
    const cmd = parts[0].toUpperCase();
    
    if (cmd === 'PUSH') {
      const val = parseInt(parts[1], 10);
      if (isNaN(val)) throw new Error(`Line ${i+1}: PUSH requires an integer`);
      zetaCode += encodeNumber(val);
    } else if (OPCODES[cmd]) {
      zetaCode += OPCODES[cmd];
    } else if (/^[A-Z\s]+$/i.test(line)) {
      // Raw ZETA letters fallback
      zetaCode += line.replace(/[^A-Z]/gi, '').toUpperCase();
    } else {
      throw new Error(`Line ${i+1}: Unknown mnemonic '${cmd}'`);
    }
  }
  return zetaCode;
}

// Interpreter State
let stack = [];
let memory = {};
let pc = 0;
let code = "";
let jumps = {};
let runningInterval = null;

function parseJumps() {
  jumps = {};
  let tempStack = [];
  for (let i = 0; i < code.length; i++) {
    const char = code[i];
    if (char === 'Q') {
      tempStack.push(i);
    } else if (char === 'Z') {
      if (tempStack.length === 0) throw new Error(`Unmatched 'Z' at index ${i}`);
      const start = tempStack.pop();
      jumps[start] = i;
      jumps[i] = start;
    }
  }
  if (tempStack.length > 0) throw new Error(`Unmatched 'Q' at index ${tempStack.pop()}`);
}

// DOM elements
const editor = document.getElementById('editor');
const exampleSelect = document.getElementById('example-select');
const btnLoad = document.getElementById('btn-load');
const btnAssemble = document.getElementById('btn-assemble');
const btnRun = document.getElementById('btn-run');
const btnWasm = document.getElementById('btn-wasm');
const btnStep = document.getElementById('btn-step');
const btnStop = document.getElementById('btn-stop');
const consoleLog = document.getElementById('console');
const stackList = document.getElementById('stack-list');
const memoryGrid = document.getElementById('memory-grid');

// UI helpers
function log(msg, type = "info") {
  const color = type === "error" ? "var(--error)" : type === "success" ? "var(--success)" : "var(--text-primary)";
  consoleLog.innerHTML += `<div style="color: ${color}">${msg}</div>`;
  consoleLog.scrollTop = consoleLog.scrollHeight;
}

function updateVisualizer() {
  // Update Stack
  if (stack.length === 0) {
    stackList.innerHTML = `<div class="stack-item">[Empty Stack]</div>`;
  } else {
    stackList.innerHTML = stack.map((val, idx) => {
      const isNew = idx === stack.length - 1 ? 'new' : '';
      return `<div class="stack-item ${isNew}">${val}</div>`;
    }).join('');
  }
  
  // Update Memory (active addresses)
  const sortedAddrs = Object.keys(memory).sort((a,b) => parseInt(a) - parseInt(b));
  if (sortedAddrs.length === 0) {
    memoryGrid.innerHTML = `<div style="color: var(--text-secondary); font-size: 0.85rem;">[Memory Uninitialized]</div>`;
  } else {
    memoryGrid.innerHTML = sortedAddrs.map(addr => {
      return `
        <div class="memory-cell active">
          <div class="addr">@${addr}</div>
          <div class="val">${memory[addr]}</div>
        </div>
      `;
    }).join('');
  }
}

function stopExecution() {
  if (runningInterval) {
    clearInterval(runningInterval);
    runningInterval = null;
  }
  btnRun.innerText = "Run VM";
}

function initVM(source) {
  stopExecution();
  try {
    // If it is ZASM, compile it first. Else use raw letters.
    if (source.includes('PUSH') || source.includes('JZ') || source.includes('ADD')) {
      code = assemble(source);
    } else {
      code = source.replace(/[^A-Za-z]/g, '').toUpperCase();
    }
    
    stack = [];
    memory = {};
    pc = 0;
    parseJumps();
    consoleLog.innerHTML = "";
    log(`[VM] Init code: ${code.length} instructions.`, "success");
    updateVisualizer();
    return true;
  } catch (err) {
    log(`[Error] ${err.message}`, "error");
    return false;
  }
}

function stepVM() {
  if (pc >= code.length) {
    log("[VM] Program Halted.", "success");
    stopExecution();
    return false;
  }
  
  const inst = code[pc];
  const pop = () => stack.pop() || 0;
  const peek = () => stack[stack.length - 1] || 0;
  const push = (val) => stack.push(val);
  
  let a, b, addr, val;
  
  switch (inst) {
    case 'A': b = pop(); a = pop(); push(a + b); break;
    case 'B': b = pop(); a = pop(); push(a - b); break;
    case 'C': b = pop(); a = pop(); push(a * b); break;
    case 'D': b = pop(); a = pop(); push(b !== 0 ? Math.floor(a / b) : 0); break;
    case 'E': b = pop(); a = pop(); push(b !== 0 ? a % b : 0); break;
    case 'F': push(0); break;
    case 'G': push(1); break;
    case 'H': push(peek()); break;
    case 'I': b = pop(); a = pop(); push(b); push(a); break;
    case 'J': pop(); break;
    case 'K': push(pop() + 1); break;
    case 'L': push(pop() - 1); break;
    case 'M': 
      const char = String.fromCharCode(pop() & 0xFF);
      processStdout(char);
      break;
    case 'N': 
      processStdout(String(pop()));
      break;
    case 'Q': 
      if (peek() === 0) pc = jumps[pc]; 
      break;
    case 'R': b = pop(); a = pop(); push(a === b ? 1 : 0); break;
    case 'S': b = pop(); a = pop(); push(a < b ? 1 : 0); break;
    case 'T': b = pop(); a = pop(); push(a > b ? 1 : 0); break;
    case 'U': 
      addr = pop(); val = pop(); 
      memory[addr] = val; 
      break;
    case 'V': 
      addr = pop(); 
      push(memory[addr] || 0); 
      break;
    case 'W': push(26); break;
    case 'X': push(10); break;
    case 'Y': break;
    case 'Z': 
      if (peek() !== 0) pc = jumps[pc]; 
      break;
  }
  
  pc++;
  updateVisualizer();
  return true;
}

function processStdout(data) {
  consoleLog.innerHTML += data;
  consoleLog.scrollTop = consoleLog.scrollHeight;
}

// Compile ZETA to WebAssembly Text (WAT)
function generateWat(zetaCode) {
  const code = zetaCode.replace(/[^A-Z]/gi, '').toUpperCase();
  
  function watPush(valCode) {
    return `    ;; push
    local.get $sp
    ${valCode}
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp\n`;
  }
  
  function watPop(varName) {
    return `    ;; pop to ${varName}
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set ${varName}\n`;
  }
  
  let wat = `(module
  (import "env" "print_char" (func $print_char (param i32)))
  (import "env" "print_num" (func $print_num (param i32)))
  (import "env" "read_char" (func $read_char (result i32)))
  (import "env" "read_num" (func $read_num (result i32)))
  
  (memory 32)
  
  (func (export "main")
    (local $sp i32)
    (local $temp i32)
    (local $addr i32)
    (local $val i32)
    (local $a i32)
    (local $b i32)
    
    i32.const 0
    local.set $sp
    
`;
  
  let indent = "    ";
  for (let i = 0; i < code.length; i++) {
    const inst = code[i];
    wat += `${indent};; Inst: ${inst}\n`;
    
    if (inst === 'A') {
      wat += indent + watPop("$b") + indent + watPop("$a") + indent + watPush("local.get $a\n    local.get $b\n    i32.add");
    } else if (inst === 'B') {
      wat += indent + watPop("$b") + indent + watPop("$a") + indent + watPush("local.get $a\n    local.get $b\n    i32.sub");
    } else if (inst === 'C') {
      wat += indent + watPop("$b") + indent + watPop("$a") + indent + watPush("local.get $a\n    local.get $b\n    i32.mul");
    } else if (inst === 'D') {
      wat += indent + watPop("$b") + indent + watPop("$a") + indent + watPush(`local.get $b
    i32.eqz
    if (result i32)
      i32.const 0
    else
      local.get $a
      local.get $b
      i32.div_s
    end`);
    } else if (inst === 'E') {
      wat += indent + watPop("$b") + indent + watPop("$a") + indent + watPush(`local.get $b
    i32.eqz
    if (result i32)
      i32.const 0
    else
      local.get $a
      local.get $b
      i32.rem_s
    end`);
    } else if (inst === 'F') {
      wat += indent + watPush("i32.const 0");
    } else if (inst === 'G') {
      wat += indent + watPush("i32.const 1");
    } else if (inst === 'H') {
      wat += indent + watPush(`local.get $sp
    i32.const 4
    i32.sub
    i32.load`);
    } else if (inst === 'I') {
      wat += indent + watPop("$b") + indent + watPop("$a") + indent + watPush("local.get $b") + indent + watPush("local.get $a");
    } else if (inst === 'J') {
      wat += indent + "local.get $sp\n    i32.const 4\n    i32.sub\n    local.set $sp\n";
    } else if (inst === 'K') {
      wat += indent + `local.get $sp
    i32.const 4
    i32.sub
    local.set $addr
    local.get $addr
    local.get $addr
    i32.load
    i32.const 1
    i32.add
    i32.store\n`;
    } else if (inst === 'L') {
      wat += indent + `local.get $sp
    i32.const 4
    i32.sub
    local.set $addr
    local.get $addr
    local.get $addr
    i32.load
    i32.const 1
    i32.sub
    i32.store\n`;
    } else if (inst === 'M') {
      wat += indent + watPop("$a") + indent + "local.get $a\n    call $print_char\n";
    } else if (inst === 'N') {
      wat += indent + watPop("$a") + indent + "local.get $a\n    call $print_num\n";
    } else if (inst === 'O') {
      wat += indent + watPush("call $read_char");
    } else if (inst === 'P') {
      wat += indent + watPush("call $read_num");
    } else if (inst === 'Q') {
      wat += indent + `block
      loop
        local.get $sp
        i32.const 4
        i32.sub
        i32.load
        i32.eqz
        br_if 1\n`;
      indent += "  ";
    } else if (inst === 'R') {
      wat += indent + watPop("$b") + indent + watPop("$a") + indent + watPush("local.get $a\n    local.get $b\n    i32.eq");
    } else if (inst === 'S') {
      wat += indent + watPop("$b") + indent + watPop("$a") + indent + watPush("local.get $a\n    local.get $b\n    i32.lt_s");
    } else if (inst === 'T') {
      wat += indent + watPop("$b") + indent + watPop("$a") + indent + watPush("local.get $a\n    local.get $b\n    i32.gt_s");
    } else if (inst === 'U') {
      wat += indent + watPop("$addr") + indent + watPop("$val") + indent + `local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    local.get $val
    i32.store\n`;
    } else if (inst === 'V') {
      wat += indent + watPop("$addr") + indent + watPush(`local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load`);
    } else if (inst === 'W') {
      wat += indent + watPush("i32.const 26");
    } else if (inst === 'X') {
      wat += indent + watPush("i32.const 10");
    } else if (inst === 'Y') {
      // NOP
    } else if (inst === 'Z') {
      indent = indent.slice(0, -2);
      wat += indent + `local.get $sp
        i32.const 4
        i32.sub
        i32.load
        i32.const 0
        i32.ne
        br_if 0
      end
    end\n`;
    }
  }
  
  wat += "  )\n)\n";
  return wat;
}

// Event Listeners
btnLoad.addEventListener('click', () => {
  const selected = exampleSelect.value;
  editor.value = EXAMPLES[selected];
  log(`[System] Loaded example '${selected}'`);
});

btnAssemble.addEventListener('click', () => {
  try {
    const raw = editor.value;
    const zeta = assemble(raw);
    editor.value = zeta;
    log(`[Assembler] Compilation successful. Output size: ${zeta.length} opcodes.`, "success");
  } catch (err) {
    log(`[Error] Assembler failed: ${err.message}`, "error");
  }
});

btnRun.addEventListener('click', () => {
  if (runningInterval) {
    stopExecution();
    return;
  }
  
  const success = initVM(editor.value);
  if (!success) return;
  
  btnRun.innerText = "Pause VM";
  runningInterval = setInterval(() => {
    if (!stepVM()) {
      stopExecution();
    }
  }, 100); // 10 steps per second for visualization
});

btnStep.addEventListener('click', () => {
  if (!code || pc >= code.length) {
    initVM(editor.value);
  }
  stepVM();
});

btnStop.addEventListener('click', () => {
  stopExecution();
  log("[VM] Execution interrupted by operator.");
  stack = [];
  memory = {};
  pc = 0;
  updateVisualizer();
});

btnWasm.addEventListener('click', () => {
  try {
    let zetaCode;
    try {
      zetaCode = assemble(editor.value);
    } catch {
      zetaCode = editor.value.replace(/[^A-Za-z]/g, '').toUpperCase();
    }
    
    const wat = generateWat(zetaCode);
    log("[Compiler] Transpiled to WebAssembly Text (WAT). compiling via WABT...", "info");
    
    // Check if WABT is loaded
    if (typeof wabt === 'undefined') {
      throw new Error("WABT.js not loaded. Verify internet connection or CDN link.");
    }
    
    wabt().then((wabtInstance) => {
      const module = wabtInstance.parseWat("zeta.wat", wat);
      const binary = module.toBinary({});
      const blob = new Blob([binary.buffer], { type: "application/wasm" });
      const url = URL.createObjectURL(blob);
      
      const a = document.createElement('a');
      a.href = url;
      a.download = "zeta.wasm";
      a.click();
      
      log("[Compiler] WebAssembly compilation successful! Download triggered.", "success");
    }).catch(err => {
      log(`[Error] Wasm Compiler: ${err.message}`, "error");
    });
    
  } catch (err) {
    log(`[Error] Compiler: ${err.message}`, "error");
  }
});

// Init visualizer
updateVisualizer();
log("System loaded.");
