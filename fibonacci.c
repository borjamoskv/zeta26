#include <stdio.h>
#include <stdlib.h>

int main() {
    int stack[65536];
    int sp = 0;
    int mem[65536] = {0};
    int a, b, addr, val;
    int c;

    // X
    stack[sp++] = 10;
    // F
    stack[sp++] = 0;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // F
    stack[sp++] = 0;
    // G
    stack[sp++] = 1;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // G
    stack[sp++] = 1;
    // G
    stack[sp++] = 1;
    // G
    stack[sp++] = 1;
    // A
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = a + b;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // F
    stack[sp++] = 0;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // Q
    while (sp > 0 && stack[sp-1] != 0) {
    // J
    sp--;
    // G
    stack[sp++] = 1;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // N
    printf("%d", stack[--sp]);
    // X
    stack[sp++] = 10;
    // M
    putchar(stack[--sp] & 0xFF);
    // G
    stack[sp++] = 1;
    // G
    stack[sp++] = 1;
    // A
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = a + b;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // G
    stack[sp++] = 1;
    // G
    stack[sp++] = 1;
    // G
    stack[sp++] = 1;
    // A
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = a + b;
    // A
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = a + b;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // G
    stack[sp++] = 1;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // G
    stack[sp++] = 1;
    // G
    stack[sp++] = 1;
    // A
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = a + b;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // A
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = a + b;
    // G
    stack[sp++] = 1;
    // G
    stack[sp++] = 1;
    // A
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = a + b;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // G
    stack[sp++] = 1;
    // G
    stack[sp++] = 1;
    // G
    stack[sp++] = 1;
    // A
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = a + b;
    // A
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = a + b;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // G
    stack[sp++] = 1;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // F
    stack[sp++] = 0;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // L
    stack[sp-1]--;
    // F
    stack[sp++] = 0;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // F
    stack[sp++] = 0;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // Z
    }
    return 0;
}
