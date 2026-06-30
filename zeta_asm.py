import sys
import os

OPCODES = {
    'ADD': 'A', 'SUB': 'B', 'MUL': 'C', 'DIV': 'D', 'MOD': 'E',
    'ZERO': 'F', 'ONE': 'G', 'DUP': 'H', 'SWP': 'I', 'POP': 'J',
    'INC': 'K', 'DEC': 'L', 'OUTA': 'M', 'OUTN': 'N', 'INPA': 'O',
    'INPN': 'P', 'JZ': 'Q', 'EQU': 'R', 'LSS': 'S', 'GRT': 'T',
    'STR': 'U', 'LDR': 'V', 'PSH26': 'W', 'PSH10': 'X', 'NOP': 'Y',
    'JNZ': 'Z'
}

def encode_number(n):
    if n == 0: return 'F'
    if n == 1: return 'G'
    if n == 10: return 'X'
    if n == 26: return 'W'
    tens = n // 10
    ones = n % 10
    code = ''
    def push_digit(d):
        if d == 0: return 'F'
        if d == 1: return 'G'
        res = 'G'
        for _ in range(d - 1): res += 'GA'
        return res
    if tens > 0:
        if tens == 1: code += 'X'
        else: code += 'X' + push_digit(tens) + 'C'
    if ones > 0:
        code += push_digit(ones)
        if tens > 0: code += 'A'
    return code

def assemble(asm_text):
    zeta_code = ""
    lines = asm_text.splitlines()
    for line_num, line in enumerate(lines):
        line = line.strip()
        if not line or line.startswith(';'):
            continue
        
        # Remove inline comments
        if ';' in line:
            line = line.split(';')[0].strip()
            
        parts = line.split()
        cmd = parts[0].upper()
        
        if cmd == 'PUSH':
            if len(parts) < 2:
                raise SyntaxError(f"Line {line_num+1}: PUSH requires an integer argument")
            try:
                val = int(parts[1])
                zeta_code += encode_number(val)
            except ValueError:
                raise SyntaxError(f"Line {line_num+1}: PUSH argument must be an integer")
        elif cmd in OPCODES:
            zeta_code += OPCODES[cmd]
        else:
            raise SyntaxError(f"Line {line_num+1}: Unknown instruction '{cmd}'")
            
    return zeta_code

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: python3 zeta_asm.py <file.zasm>")
        sys.exit(1)
        
    input_file = sys.argv[1]
    base_name = os.path.splitext(input_file)[0]
    output_file = base_name + ".zta"
    
    with open(input_file, 'r') as f:
        asm = f.read()
        
    try:
        zeta = assemble(asm)
        with open(output_file, 'w') as f:
            f.write(zeta)
        print(f"[C5-REAL] Assembled successfully: {output_file} ({len(zeta)} opcodes)")
    except SyntaxError as e:
        print(f"[ERROR] {e}", file=sys.stderr)
        sys.exit(1)
