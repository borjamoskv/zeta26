import sys
import os
import json
import subprocess


class ZasmCompiler:
    """Atomic Compiler Core for mapping Anvil AST to ZASM."""

    def __init__(self):
        self.zasm_lines = []
        self.var_map = {}
        self.next_addr = 1

    def get_var_addr(self, name: str) -> int:
        if name not in self.var_map:
            self.var_map[name] = self.next_addr
            self.next_addr += 1
        return self.var_map[name]

    def emit(self, instruction: str):
        self.zasm_lines.append(instruction)

    def compile(self, ast_data: dict) -> str:
        for item in ast_data.get("items", []):
            if "Contract" in item:
                self.compile_contract(item["Contract"])
        return "\n".join(self.zasm_lines)

    def compile_contract(self, contract: dict):
        self.emit(f";; --- Contract: {contract.get('name', 'Unknown')} ---")
        for func in contract.get("functions", []):
            self.compile_function(func)
            break  # Currently only transpiling the first function

    def compile_function(self, func: dict):
        self.emit(f";; Function: {func.get('name', 'Unknown')}")
        self.compile_params(func.get("params", []))
        self.compile_body(func.get("body", {}))
        self.emit(";; --- End Function ---")

    def compile_params(self, params: list):
        for param in reversed(params):
            name = param["name"]
            addr = self.get_var_addr(name)
            self.emit(f"PUSH {addr}  ; Address for {name}")
            self.emit("STR     ; Pop param and store")

    def compile_body(self, body: dict):
        for stmt in body.get("stmts", []):
            if "Assign" in stmt:
                self.compile_assign(stmt["Assign"])
            elif "Return" in stmt:
                self.compile_return(stmt["Return"])

    def compile_assign(self, assign: dict):
        target = assign["target"]["Ident"]
        target_addr = self.get_var_addr(target)
        op = assign["op"]

        if op in ["SubAssign", "AddAssign"]:
            self.emit(f"PUSH {target_addr} ; Load {target} for compound assignment")
            self.emit("LDR")

        self.compile_expr(assign["value"])

        if op == "SubAssign":
            self.emit("SUB")
        elif op == "AddAssign":
            self.emit("ADD")

        self.emit(f"PUSH {target_addr} ; Store back to {target}")
        self.emit("STR")

    def compile_expr(self, expr: dict):
        if "Ident" in expr:
            val_name = expr["Ident"]
            self.emit(f"PUSH {self.get_var_addr(val_name)} ; Load {val_name}")
            self.emit("LDR")
        elif "Literal" in expr:
            self.emit(f"PUSH {expr['Literal']}")

    def compile_return(self, ret: dict):
        self.compile_expr(ret)
        self.emit("OUTN    ; Print return value")
        self.emit("PUSH 10 ; Print newline")
        self.emit("OUTA")


def main():
    if len(sys.argv) < 2:
        print("Usage: python3 anvil2zeta.py <file.anv>")
        sys.exit(1)

    input_file = sys.argv[1]
    base_name = os.path.splitext(input_file)[0]
    zasm_file = base_name + ".zasm"

    # Run anvil ast using cargo
    anvil_dir = "/Users/borjafernandezangulo/10_PROJECTS/anvil-lang"
    abs_input = os.path.abspath(input_file)

    print("[C5-REAL] Dumping Anvil AST via Cargo...")
    cmd = ["cargo", "run", "--quiet", "--", "ast", abs_input]
    res = subprocess.run(cmd, cwd=anvil_dir, text=True, capture_output=True)

    if res.returncode != 0:
        print(f"[ERROR] Anvil AST generation failed:\n{res.stderr}", file=sys.stderr)
        sys.exit(1)

    output = res.stdout
    json_start = output.find("{")
    if json_start == -1:
        print(f"[ERROR] No JSON found in output:\n{output}", file=sys.stderr)
        sys.exit(1)

    json_data = json.loads(output[json_start:])

    compiler = ZasmCompiler()
    zasm = compiler.compile(json_data)

    with open(zasm_file, "w") as f:
        f.write(zasm)

    print(f"[C5-REAL] Compiled Anvil verified code to ZASM: {zasm_file}")


if __name__ == "__main__":
    main()
