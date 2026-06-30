#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define STACK_SIZE 65536
#define MEM_SIZE 65536

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Usage: ./zeta_core <file.zta>\n");
        return 1;
    }

    FILE *f = fopen(argv[1], "r");
    if (!f) {
        perror("fopen");
        return 1;
    }

    fseek(f, 0, SEEK_END);
    long fsize = ftell(f);
    fseek(f, 0, SEEK_SET);

    char *raw_code = malloc(fsize + 1);
    fread(raw_code, 1, fsize, f);
    fclose(f);
    raw_code[fsize] = '\0';

    char *code = malloc(fsize + 1);
    long len = 0;
    for (long i = 0; i < fsize; i++) {
        char c = raw_code[i];
        if (c >= 'A' && c <= 'Z') code[len++] = c;
        else if (c >= 'a' && c <= 'z') code[len++] = c - 32;
    }
    code[len] = '\0';
    free(raw_code);

    long *jumps = malloc(len * sizeof(long));
    long *temp_stack = malloc(len * sizeof(long));
    long temp_sp = 0;

    for (long i = 0; i < len; i++) {
        if (code[i] == 'Q') {
            temp_stack[temp_sp++] = i;
        } else if (code[i] == 'Z') {
            if (temp_sp == 0) {
                fprintf(stderr, "SyntaxError: Unmatched 'Z' at %ld\n", i);
                return 1;
            }
            long start = temp_stack[--temp_sp];
            jumps[start] = i;
            jumps[i] = start;
        }
    }
    if (temp_sp > 0) {
        fprintf(stderr, "SyntaxError: Unmatched 'Q' at %ld\n", temp_stack[--temp_sp]);
        return 1;
    }
    free(temp_stack);

    long *stack = malloc(STACK_SIZE * sizeof(long));
    long sp = 0;
    long *mem = calloc(MEM_SIZE, sizeof(long));

    long pc = 0;
    long a, b, addr, val;
    int c;

#define C5_PANIC(msg) ({ fprintf(stderr, "C5-PANIC: %s at PC=%ld\n", msg, pc); exit(1); 0; })
#define PUSH(x) do { if (sp >= STACK_SIZE) C5_PANIC("Stack Overflow"); stack[sp++] = (x); } while(0)
#define POP() (sp == 0 ? C5_PANIC("Stack Underflow") : stack[--sp])
#define CHECK_MEM(addr) do { if ((addr) < 0 || (addr) >= MEM_SIZE) C5_PANIC("Memory Violation"); } while(0)

    // DIRECT THREADED CODE (COMPUTED GOTOS)
    static void* dispatch_table[26] = {
        &&op_A, &&op_B, &&op_C, &&op_D, &&op_E, &&op_F, &&op_G, &&op_H, &&op_I, &&op_J,
        &&op_K, &&op_L, &&op_M, &&op_N, &&op_O, &&op_P, &&op_Q, &&op_R, &&op_S, &&op_T,
        &&op_U, &&op_V, &&op_W, &&op_X, &&op_Y, &&op_Z
    };

    if (len == 0) goto end;
    #define DISPATCH() do { if (++pc < len) goto *dispatch_table[code[pc] - 'A']; else goto end; } while(0)

    goto *dispatch_table[code[pc] - 'A'];

op_A: b = POP(); a = POP(); PUSH(a + b); DISPATCH();
op_B: b = POP(); a = POP(); PUSH(a - b); DISPATCH();
op_C: b = POP(); a = POP(); PUSH(a * b); DISPATCH();
op_D: b = POP(); a = POP(); PUSH(b ? (a / b) : 0); DISPATCH();
op_E: b = POP(); a = POP(); PUSH(b ? (a % b) : 0); DISPATCH();
op_F: PUSH(0); DISPATCH();
op_G: PUSH(1); DISPATCH();
op_H: if (sp == 0) C5_PANIC("Stack Underflow (Dup)"); PUSH(stack[sp-1]); DISPATCH();
op_I: b = POP(); a = POP(); PUSH(b); PUSH(a); DISPATCH();
op_J: POP(); DISPATCH();
op_K: if (sp == 0) C5_PANIC("Stack Underflow"); stack[sp-1]++; DISPATCH();
op_L: if (sp == 0) C5_PANIC("Stack Underflow"); stack[sp-1]--; DISPATCH();
op_M: a = POP(); putchar(a & 0xFF); fflush(stdout); DISPATCH();
op_N: a = POP(); printf("%ld", a); fflush(stdout); DISPATCH();
op_O: c = getchar(); PUSH((c != EOF) ? c : 0); DISPATCH();
op_P: if (scanf("%ld", &a) == 1) PUSH(a); else PUSH(0); DISPATCH();
op_Q: if (sp == 0 || stack[sp-1] == 0) pc = jumps[pc]; DISPATCH();
op_R: b = POP(); a = POP(); PUSH((a == b) ? 1 : 0); DISPATCH();
op_S: b = POP(); a = POP(); PUSH((a < b) ? 1 : 0); DISPATCH();
op_T: b = POP(); a = POP(); PUSH((a > b) ? 1 : 0); DISPATCH();
op_U: addr = POP(); val = POP(); CHECK_MEM(addr); mem[addr] = val; DISPATCH();
op_V: addr = POP(); CHECK_MEM(addr); PUSH(mem[addr]); DISPATCH();
op_W: PUSH(26); DISPATCH();
op_X: PUSH(10); DISPATCH();
op_Y: DISPATCH();
op_Z: if (sp > 0 && stack[sp-1] != 0) pc = jumps[pc]; DISPATCH();

end:
    free(stack);
    free(mem);
    free(jumps);
    free(code);
    return 0;
}
