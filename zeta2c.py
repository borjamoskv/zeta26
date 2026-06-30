import sys
import os

def compile_zeta_to_c(source_code, output_file):
    code = ''.join(c.upper() for c in source_code if c.isalpha())
    
    c_code = """#include <stdio.h>
#include <stdlib.h>

int main() {
    int stack[65536];
    int sp = 0;
    int mem[65536] = {0};
    int a, b, addr, val;
    int c;

"""
    
    for i, inst in enumerate(code):
        c_code += f"    // {inst}\n"
        if inst == 'A':
            c_code += "    b = stack[--sp]; a = stack[--sp]; stack[sp++] = a + b;\n"
        elif inst == 'B':
            c_code += "    b = stack[--sp]; a = stack[--sp]; stack[sp++] = a - b;\n"
        elif inst == 'C':
            c_code += "    b = stack[--sp]; a = stack[--sp]; stack[sp++] = a * b;\n"
        elif inst == 'D':
            c_code += "    b = stack[--sp]; a = stack[--sp]; stack[sp++] = (b != 0) ? (a / b) : 0;\n"
        elif inst == 'E':
            c_code += "    b = stack[--sp]; a = stack[--sp]; stack[sp++] = (b != 0) ? (a % b) : 0;\n"
        elif inst == 'F':
            c_code += "    stack[sp++] = 0;\n"
        elif inst == 'G':
            c_code += "    stack[sp++] = 1;\n"
        elif inst == 'H':
            c_code += "    stack[sp] = stack[sp-1]; sp++;\n"
        elif inst == 'I':
            c_code += "    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;\n"
        elif inst == 'J':
            c_code += "    sp--;\n"
        elif inst == 'K':
            c_code += "    stack[sp-1]++;\n"
        elif inst == 'L':
            c_code += "    stack[sp-1]--;\n"
        elif inst == 'M':
            c_code += "    putchar(stack[--sp] & 0xFF);\n"
        elif inst == 'N':
            c_code += "    printf(\"%d\", stack[--sp]);\n"
        elif inst == 'O':
            c_code += "    c = getchar(); stack[sp++] = (c != EOF) ? c : 0;\n"
        elif inst == 'P':
            c_code += "    if (scanf(\"%d\", &a) == 1) stack[sp++] = a; else stack[sp++] = 0;\n"
        elif inst == 'Q':
            c_code += "    while (sp > 0 && stack[sp-1] != 0) {\n"
        elif inst == 'R':
            c_code += "    b = stack[--sp]; a = stack[--sp]; stack[sp++] = (a == b) ? 1 : 0;\n"
        elif inst == 'S':
            c_code += "    b = stack[--sp]; a = stack[--sp]; stack[sp++] = (a < b) ? 1 : 0;\n"
        elif inst == 'T':
            c_code += "    b = stack[--sp]; a = stack[--sp]; stack[sp++] = (a > b) ? 1 : 0;\n"
        elif inst == 'U':
            c_code += "    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;\n"
        elif inst == 'V':
            c_code += "    addr = stack[--sp]; stack[sp++] = mem[addr];\n"
        elif inst == 'W':
            c_code += "    stack[sp++] = 26;\n"
        elif inst == 'X':
            c_code += "    stack[sp++] = 10;\n"
        elif inst == 'Y':
            pass
        elif inst == 'Z':
            c_code += "    }\n"
            
    c_code += "    return 0;\n}\n"
    
    with open(output_file, 'w') as f:
        f.write(c_code)

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: python3 zeta2c.py <file.zta>")
        sys.exit(1)
        
    input_file = sys.argv[1]
    base_name = os.path.splitext(input_file)[0]
    c_file = base_name + ".c"
    
    with open(input_file, 'r') as f:
        code = f.read()
        
    compile_zeta_to_c(code, c_file)
    print(f"[C5-REAL] ZETA transmuted to C: {c_file}")
    
    # Compile with GCC (Turbo / O3)
    os.system(f"gcc -O3 -o {base_name} {c_file}")
    print(f"[C5-REAL] Binary forged: {base_name}")
