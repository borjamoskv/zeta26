def encode_number(n):
    if n == 0:
        return "F"
    if n == 1:
        return "G"
    if n == 10:
        return "X"
    if n == 26:
        return "W"

    tens = n // 10
    ones = n % 10

    code = ""

    # Helper to push a digit < 10
    def push_digit(d):
        if d == 0:
            return "F"
        if d == 1:
            return "G"
        res = "G"
        for _ in range(d - 1):
            res += "G"
            res += "A"
        return res

    if tens > 0:
        if tens == 1:
            code += "X"
        else:
            # push 10, push tens, MUL
            code += "X"
            code += push_digit(tens)
            code += "C"  # MUL

    if ones > 0:
        code += push_digit(ones)
        if tens > 0:
            code += "A"  # Add ones to tens*10

    return code


def string_to_zeta(s):
    zeta_code = ""
    for char in s:
        zeta_code += encode_number(ord(char))
        zeta_code += "M"  # OUTA
    return zeta_code


if __name__ == "__main__":
    target = "MOSKV-1 APEX"
    zeta = string_to_zeta(target)
    print("Code length:", len(zeta))
    with open("moskv.zta", "w") as f:
        f.write(zeta)
