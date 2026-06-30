import sys
import os
import json
import subprocess


def compile_anvil_ast_to_zasm(ast_data):
    zasm_lines = []

    # We map parameters and local variables to fixed memory addresses
    # Address 0: Reserved or Return Value
    # Address 1..N: Variables
    var_map = {}
    next_addr = 1

    # Helper to get/allocate address for variable
    def get_var_addr(name):
        nonlocal next_addr
        if name not in var_map:
            var_map[name] = next_addr
            next_addr += 1
        return var_map[name]

    # Locate contracts
    for item in ast_data.get("items", []):
        contract = item.get("Contract")
        if not contract:
            continue

        zasm_lines.append(f";; --- Contract: {contract['name']} ---")

        # We only transpile the first function for simplicity in our VM mapping
        for func in contract.get("functions", []):
            zasm_lines.append(f";; Function: {func['name']}")

            # Param mapping
            # Parameters are expected to be on the stack, with the last parameter on top.
            # Example: [param1, param2] -> param2 is top.
            # So we pop them in reverse order.
            params = func.get("params", [])
            for param in reversed(params):
                name = param["name"]
                addr = get_var_addr(name)
                zasm_lines.append(f"PUSH {addr}  ; Address for {name}")
                zasm_lines.append("STR     ; Pop param and store")

            # Compile statements in body
            body = func.get("body", {})
            for stmt in body.get("stmts", []):
                if "Assign" in stmt:
                    assign = stmt["Assign"]
                    target = assign["target"]["Ident"]
                    op = assign["op"]
                    val_node = assign["value"]

                    target_addr = get_var_addr(target)

                    # Load current target value if it's a compound assignment (+=, -=)
                    if op in ["SubAssign", "AddAssign"]:
                        zasm_lines.append(
                            f"PUSH {target_addr} ; Load {target} for compound assignment"
                        )
                        zasm_lines.append("LDR")

                    # Evaluate value
                    if "Ident" in val_node:
                        val_name = val_node["Ident"]
                        val_addr = get_var_addr(val_name)
                        zasm_lines.append(f"PUSH {val_addr} ; Load {val_name}")
                        zasm_lines.append("LDR")
                    elif "Literal" in val_node:
                        lit_val = val_node["Literal"]
                        zasm_lines.append(f"PUSH {lit_val}")

                    # Apply operator
                    if op == "SubAssign":
                        zasm_lines.append("SUB")
                    elif op == "AddAssign":
                        zasm_lines.append("ADD")

                    # Store back to target
                    zasm_lines.append(f"PUSH {target_addr} ; Store back to {target}")
                    zasm_lines.append("STR")

                elif "Return" in stmt:
                    ret = stmt["Return"]
                    if "Ident" in ret:
                        ret_name = ret["Ident"]
                        ret_addr = get_var_addr(ret_name)
                        zasm_lines.append(
                            f"PUSH {ret_addr} ; Load return value {ret_name}"
                        )
                        zasm_lines.append("LDR")
                    elif "Literal" in ret:
                        lit_val = ret["Literal"]
                        zasm_lines.append(f"PUSH {lit_val}")

                    zasm_lines.append("OUTN    ; Print return value")
                    zasm_lines.append("PUSH 10 ; Print newline")
                    zasm_lines.append("OUTA")

            zasm_lines.append(";; --- End Function ---")
            break  # Compiles one function

    return "\n".join(zasm_lines)


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python3 anvil2zeta.py <file.anv>")
        sys.exit(1)

    input_file = sys.argv[1]
    base_name = os.path.splitext(input_file)[0]
    zasm_file = base_name + ".zasm"

    # Run anvil ast using cargo
    anvil_dir = "/Users/borjafernandezangulo/10_PROJECTS/anvil-lang"
    # Find absolute path of input
    abs_input = os.path.abspath(input_file)

    print("[C5-REAL] Dumping Anvil AST via Cargo...")
    cmd = ["cargo", "run", "--quiet", "--", "ast", abs_input]
    res = subprocess.run(cmd, cwd=anvil_dir, text=True, capture_output=True)

    if res.returncode != 0:
        print(f"[ERROR] Anvil AST generation failed:\n{res.stderr}", file=sys.stderr)
        sys.exit(1)

    # Find JSON start in output (filtering out the header)
    output = res.stdout
    json_start = output.find("{")
    if json_start == -1:
        print(f"[ERROR] No JSON found in output:\n{output}", file=sys.stderr)
        sys.exit(1)

    json_data = json.loads(output[json_start:])

    zasm = compile_anvil_ast_to_zasm(json_data)

    with open(zasm_file, "w") as f:
        f.write(zasm)

    print(f"[C5-REAL] Compiled Anvil verified code to ZASM: {zasm_file}")
