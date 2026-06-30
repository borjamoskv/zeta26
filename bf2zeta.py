import sys
import os

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

def optimize_bf_to_zeta(bf_code):
    zeta_code = "G" # Init DP = 1
    
    i = 0
    n = len(bf_code)
    while i < n:
        char = bf_code[i]
        
        # Optimize consecutive runs
        if char in ['+', '-', '>', '<']:
            count = 1
            while i + 1 < n and bf_code[i+1] == char:
                count += 1
                i += 1
            
            if char == '>':
                if count == 1: zeta_code += "K"
                else: zeta_code += encode_number(count) + "A"
            elif char == '<':
                if count == 1: zeta_code += "L"
                else: zeta_code += encode_number(count) + "B"
            elif char == '+':
                if count == 1: zeta_code += "HHVKIU"
                else: zeta_code += "HHV" + encode_number(count) + "AIU"
            elif char == '-':
                if count == 1: zeta_code += "HHVLIU"
                else: zeta_code += "HHV" + encode_number(count) + "BIU"
        else:
            if char == '.': zeta_code += "HVM"
            elif char == ',': zeta_code += "HOIU"
            elif char == '[': zeta_code += "HVQJ"
            elif char == ']': zeta_code += "HVZJ"
        i += 1
            
    return zeta_code

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: python3 bf2zeta.py <file.bf>")
        sys.exit(1)
        
    input_file = sys.argv[1]
    base_name = os.path.splitext(input_file)[0]
    zeta_file = base_name + ".zta"
    
    with open(input_file, 'r') as f:
        code = f.read()
        
    zeta = optimize_bf_to_zeta(code)
    
    with open(zeta_file, 'w') as f:
        f.write(zeta)
        
    print(f"[C5-REAL] Brainfuck RLE-Transmuted to ZETA: {zeta_file} (Entropy Purged - length: {len(zeta)})")
