import sys
import argparse

class ZetaInterpreter:
    def __init__(self):
        self.stack = []
        self.memory = {}
        self.pc = 0
        self.code = ""
        self.jumps = {}

    def parse_jumps(self):
        temp_stack = []
        for i, char in enumerate(self.code):
            if char == 'Q':
                temp_stack.append(i)
            elif char == 'Z':
                if not temp_stack:
                    raise SyntaxError(f"Unmatched 'Z' at instruction {i}")
                start = temp_stack.pop()
                self.jumps[start] = i
                self.jumps[i] = start
        if temp_stack:
            raise SyntaxError(f"Unmatched 'Q' at instruction {temp_stack.pop()}")

    def pop(self):
        return self.stack.pop() if self.stack else 0

    def peek(self):
        return self.stack[-1] if self.stack else 0

    def push(self, val):
        self.stack.append(val)

    def execute(self, source_code):
        # Filter only A-Z
        self.code = ''.join(c.upper() for c in source_code if c.isalpha())
        self.parse_jumps()
        self.pc = 0

        while self.pc < len(self.code):
            inst = self.code[self.pc]

            if inst == 'A': # ADD
                b, a = self.pop(), self.pop()
                self.push(a + b)
            elif inst == 'B': # SUB
                b, a = self.pop(), self.pop()
                self.push(a - b)
            elif inst == 'C': # MUL
                b, a = self.pop(), self.pop()
                self.push(a * b)
            elif inst == 'D': # DIV
                b, a = self.pop(), self.pop()
                self.push(a // b if b != 0 else 0)
            elif inst == 'E': # MOD
                b, a = self.pop(), self.pop()
                self.push(a % b if b != 0 else 0)
            elif inst == 'F': # ZERO
                self.push(0)
            elif inst == 'G': # ONE
                self.push(1)
            elif inst == 'H': # DUP
                self.push(self.peek())
            elif inst == 'I': # SWP
                b, a = self.pop(), self.pop()
                self.push(b)
                self.push(a)
            elif inst == 'J': # POP
                self.pop()
            elif inst == 'K': # INC
                a = self.pop()
                self.push(a + 1)
            elif inst == 'L': # DEC
                a = self.pop()
                self.push(a - 1)
            elif inst == 'M': # OUTA
                sys.stdout.write(chr(self.pop() % 256))
                sys.stdout.flush()
            elif inst == 'N': # OUTN
                sys.stdout.write(str(self.pop()))
                sys.stdout.flush()
            elif inst == 'O': # INPA
                c = sys.stdin.read(1)
                self.push(ord(c) if c else 0)
            elif inst == 'P': # INPN
                # Read integer from stdin
                val = ""
                while True:
                    c = sys.stdin.read(1)
                    if not c or c.isspace():
                        break
                    val += c
                try:
                    self.push(int(val))
                except ValueError:
                    self.push(0)
            elif inst == 'Q': # JZ
                if self.peek() == 0:
                    self.pc = self.jumps[self.pc]
            elif inst == 'R': # EQU
                b, a = self.pop(), self.pop()
                self.push(1 if a == b else 0)
            elif inst == 'S': # LSS
                b, a = self.pop(), self.pop()
                self.push(1 if a < b else 0)
            elif inst == 'T': # GRT
                b, a = self.pop(), self.pop()
                self.push(1 if a > b else 0)
            elif inst == 'U': # STR (Store)
                addr, val = self.pop(), self.pop()
                self.memory[addr] = val
            elif inst == 'V': # LDR (Load)
                addr = self.pop()
                self.push(self.memory.get(addr, 0))
            elif inst == 'W': # PSH26
                self.push(26)
            elif inst == 'X': # PSH10
                self.push(10)
            elif inst == 'Y': # NOP
                pass
            elif inst == 'Z': # JNZ
                if self.peek() != 0:
                    self.pc = self.jumps[self.pc]

            self.pc += 1

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="ZETA Base-26 Language Interpreter")
    parser.add_argument("file", help="ZETA source file")
    args = parser.parse_args()

    with open(args.file, "r") as f:
        code = f.read()

    interpreter = ZetaInterpreter()
    interpreter.execute(code)
