import sys

def compile_bf_to_zeta(bf_code):
    zeta_code = "G"  # Initialize DP = 1
    
    for char in bf_code:
        if char == '>':
            zeta_code += "K"
        elif char == '<':
            zeta_code += "L"
        elif char == '+':
            zeta_code += "HHVKIU"
        elif char == '-':
            zeta_code += "HHVLIU"
        elif char == '.':
            zeta_code += "HVM"
        elif char == ',':
            zeta_code += "HOIU"
        elif char == '[':
            zeta_code += "HVQJ"
        elif char == ']':
            zeta_code += "HVZJ"
            
    return zeta_code

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: python3 bf2zeta.py <file.bf>")
        sys.exit(1)
        
    input_file = sys.argv[1]
    import os
    base_name = os.path.splitext(input_file)[0]
    zeta_file = base_name + ".zta"
    
    with open(input_file, 'r') as f:
        code = f.read()
        
    zeta = compile_bf_to_zeta(code)
    
    with open(zeta_file, 'w') as f:
        f.write(zeta)
        
    print(f"[C5-REAL] Brainfuck Transmuted to ZETA: {zeta_file} (Entropy Purged)")
