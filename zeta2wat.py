import sys
import os

def push_val(val_code):
    return f"""    ;; push
    local.get $sp
    {val_code}
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp\n"""

def pop_to(var_name):
    return f"""    ;; pop to {var_name}
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set {var_name}\n"""

def compile_zeta_to_wat(source_code):
    code = ''.join(c.upper() for c in source_code if c.isalpha())
    
    wat = """(module
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
    
    ;; Initialize SP
    i32.const 0
    local.set $sp
    
"""
    
    indent = "    "
    for inst in code:
        wat += f"{indent};; Inst: {inst}\n"
        if inst == 'A':
            wat += indent + pop_to("$b")
            wat += indent + pop_to("$a")
            wat += indent + push_val("local.get $a\n    local.get $b\n    i32.add")
        elif inst == 'B':
            wat += indent + pop_to("$b")
            wat += indent + pop_to("$a")
            wat += indent + push_val("local.get $a\n    local.get $b\n    i32.sub")
        elif inst == 'C':
            wat += indent + pop_to("$b")
            wat += indent + pop_to("$a")
            wat += indent + push_val("local.get $a\n    local.get $b\n    i32.mul")
        elif inst == 'D':
            wat += indent + pop_to("$b")
            wat += indent + pop_to("$a")
            wat += indent + push_val("""local.get $b
    i32.eqz
    if (result i32)
      i32.const 0
    else
      local.get $a
      local.get $b
      i32.div_s
    end""")
        elif inst == 'E':
            wat += indent + pop_to("$b")
            wat += indent + pop_to("$a")
            wat += indent + push_val("""local.get $b
    i32.eqz
    if (result i32)
      i32.const 0
    else
      local.get $a
      local.get $b
      i32.rem_s
    end""")
        elif inst == 'F':
            wat += indent + push_val("i32.const 0")
        elif inst == 'G':
            wat += indent + push_val("i32.const 1")
        elif inst == 'H':
            wat += indent + push_val("""local.get $sp
    i32.const 4
    i32.sub
    i32.load""")
        elif inst == 'I':
            wat += indent + pop_to("$b")
            wat += indent + pop_to("$a")
            wat += indent + push_val("local.get $b")
            wat += indent + push_val("local.get $a")
        elif inst == 'J':
            wat += indent + "local.get $sp\n    i32.const 4\n    i32.sub\n    local.set $sp\n"
        elif inst == 'K':
            wat += indent + """local.get $sp
    i32.const 4
    i32.sub
    local.set $addr
    local.get $addr
    local.get $addr
    i32.load
    i32.const 1
    i32.add
    i32.store\n"""
        elif inst == 'L':
            wat += indent + """local.get $sp
    i32.const 4
    i32.sub
    local.set $addr
    local.get $addr
    local.get $addr
    i32.load
    i32.const 1
    i32.sub
    i32.store\n"""
        elif inst == 'M':
            wat += indent + pop_to("$a")
            wat += indent + "local.get $a\n    call $print_char\n"
        elif inst == 'N':
            wat += indent + pop_to("$a")
            wat += indent + "local.get $a\n    call $print_num\n"
        elif inst == 'O':
            wat += indent + push_val("call $read_char")
        elif inst == 'P':
            wat += indent + push_val("call $read_num")
        elif inst == 'Q':
            wat += indent + """block
      loop
        local.get $sp
        i32.const 4
        i32.sub
        i32.load
        i32.eqz
        br_if 1\n"""
            indent += "  "
        elif inst == 'R':
            wat += indent + pop_to("$b")
            wat += indent + pop_to("$a")
            wat += indent + push_val("local.get $a\n    local.get $b\n    i32.eq")
        elif inst == 'S':
            wat += indent + pop_to("$b")
            wat += indent + pop_to("$a")
            wat += indent + push_val("local.get $a\n    local.get $b\n    i32.lt_s")
        elif inst == 'T':
            wat += indent + pop_to("$b")
            wat += indent + pop_to("$a")
            wat += indent + push_val("local.get $a\n    local.get $b\n    i32.gt_s")
        elif inst == 'U':
            wat += indent + pop_to("$addr")
            wat += indent + pop_to("$val")
            wat += indent + """local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    local.get $val
    i32.store\n"""
        elif inst == 'V':
            wat += indent + pop_to("$addr")
            wat += indent + push_val("""local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load""")
        elif inst == 'W':
            wat += indent + push_val("i32.const 26")
        elif inst == 'X':
            wat += indent + push_val("i32.const 10")
        elif inst == 'Y':
            pass
        elif inst == 'Z':
            indent = indent[:-2]
            wat += indent + """local.get $sp
        i32.const 4
        i32.sub
        i32.load
        i32.const 0
        i32.ne
        br_if 0
      end
    end\n"""
            
    wat += "  )\n)\n"
    return wat

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: python3 zeta2wat.py <file.zta>")
        sys.exit(1)
        
    input_file = sys.argv[1]
    base_name = os.path.splitext(input_file)[0]
    wat_file = base_name + ".wat"
    
    with open(input_file, 'r') as f:
        code = f.read()
        
    wat = compile_zeta_to_wat(code)
    
    with open(wat_file, 'w') as f:
        f.write(wat)
        
    print(f"[C5-REAL] Compiled ZETA to WAT: {wat_file}")
