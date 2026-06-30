#include <stdio.h>
#include <stdlib.h>

int main() {
    int stack[65536];
    int sp = 0;
    int mem[65536] = {0};
    int a, b, addr, val;
    int c;

    // G
    stack[sp++] = 1;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // Q
    while (sp > 0 && stack[sp-1] != 0) {
    // J
    sp--;
    // K
    stack[sp-1]++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // Q
    while (sp > 0 && stack[sp-1] != 0) {
    // J
    sp--;
    // K
    stack[sp-1]++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // K
    stack[sp-1]++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // K
    stack[sp-1]++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // K
    stack[sp-1]++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // L
    stack[sp-1]--;
    // L
    stack[sp-1]--;
    // L
    stack[sp-1]--;
    // L
    stack[sp-1]--;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // L
    stack[sp-1]--;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // Z
    }
    // J
    sp--;
    // K
    stack[sp-1]++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // K
    stack[sp-1]++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // K
    stack[sp-1]++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // L
    stack[sp-1]--;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // K
    stack[sp-1]++;
    // K
    stack[sp-1]++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // Q
    while (sp > 0 && stack[sp-1] != 0) {
    // J
    sp--;
    // L
    stack[sp-1]--;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // Z
    }
    // J
    sp--;
    // L
    stack[sp-1]--;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // L
    stack[sp-1]--;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // Z
    }
    // J
    sp--;
    // K
    stack[sp-1]++;
    // K
    stack[sp-1]++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // M
    putchar(stack[--sp] & 0xFF);
    // K
    stack[sp-1]++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // L
    stack[sp-1]--;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // L
    stack[sp-1]--;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // L
    stack[sp-1]--;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // M
    putchar(stack[--sp] & 0xFF);
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // M
    putchar(stack[--sp] & 0xFF);
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // M
    putchar(stack[--sp] & 0xFF);
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // M
    putchar(stack[--sp] & 0xFF);
    // K
    stack[sp-1]++;
    // K
    stack[sp-1]++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // M
    putchar(stack[--sp] & 0xFF);
    // L
    stack[sp-1]--;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // L
    stack[sp-1]--;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // M
    putchar(stack[--sp] & 0xFF);
    // L
    stack[sp-1]--;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // M
    putchar(stack[--sp] & 0xFF);
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // M
    putchar(stack[--sp] & 0xFF);
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // L
    stack[sp-1]--;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // L
    stack[sp-1]--;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // L
    stack[sp-1]--;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // L
    stack[sp-1]--;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // L
    stack[sp-1]--;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // L
    stack[sp-1]--;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // M
    putchar(stack[--sp] & 0xFF);
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // L
    stack[sp-1]--;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // L
    stack[sp-1]--;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // L
    stack[sp-1]--;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // L
    stack[sp-1]--;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // L
    stack[sp-1]--;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // L
    stack[sp-1]--;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // L
    stack[sp-1]--;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // L
    stack[sp-1]--;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // M
    putchar(stack[--sp] & 0xFF);
    // K
    stack[sp-1]++;
    // K
    stack[sp-1]++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // M
    putchar(stack[--sp] & 0xFF);
    // K
    stack[sp-1]++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // K
    stack[sp-1]++;
    // I
    b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a;
    // U
    addr = stack[--sp]; val = stack[--sp]; mem[addr] = val;
    // H
    stack[sp] = stack[sp-1]; sp++;
    // V
    addr = stack[--sp]; stack[sp++] = mem[addr];
    // M
    putchar(stack[--sp] & 0xFF);
    return 0;
}
