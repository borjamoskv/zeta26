#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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

    long *stack = malloc(65536 * sizeof(long));
    long sp = 0;
    long *mem = calloc(65536, sizeof(long));

    long pc = 0;
    long a, b, addr, val;
    int c;

    // DIRECT THREADED CODE (COMPUTED GOTOS)
    static void* dispatch_table[26] = {
        &&op_A, &&op_B, &&op_C, &&op_D, &&op_E, &&op_F, &&op_G, &&op_H, &&op_I, &&op_J,
        &&op_K, &&op_L, &&op_M, &&op_N, &&op_O, &&op_P, &&op_Q, &&op_R, &&op_S, &&op_T,
        &&op_U, &&op_V, &&op_W, &&op_X, &&op_Y, &&op_Z
    };

    if (len == 0) goto end;
    #define DISPATCH() do { if (++pc < len) goto *dispatch_table[code[pc] - 'A']; else goto end; } while(0)

    goto *dispatch_table[code[pc] - 'A'];

op_A: b = stack[--sp]; a = stack[--sp]; stack[sp++] = a + b; DISPATCH();
op_B: b = stack[--sp]; a = stack[--sp]; stack[sp++] = a - b; DISPATCH();
op_C: b = stack[--sp]; a = stack[--sp]; stack[sp++] = a * b; DISPATCH();
op_D: b = stack[--sp]; a = stack[--sp]; stack[sp++] = b ? (a / b) : 0; DISPATCH();
op_E: b = stack[--sp]; a = stack[--sp]; stack[sp++] = b ? (a % b) : 0; DISPATCH();
op_F: stack[sp++] = 0; DISPATCH();
op_G: stack[sp++] = 1; DISPATCH();
op_H: stack[sp] = stack[sp-1]; sp++; DISPATCH();
op_I: b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a; DISPATCH();
op_J: sp--; DISPATCH();
op_K: stack[sp-1]++; DISPATCH();
op_L: stack[sp-1]--; DISPATCH();
op_M: putchar(stack[--sp] & 0xFF); fflush(stdout); DISPATCH();
op_N: printf("%ld", stack[--sp]); fflush(stdout); DISPATCH();
op_O: c = getchar(); stack[sp++] = (c != EOF) ? c : 0; DISPATCH();
op_P: if (scanf("%ld", &a) == 1) stack[sp++] = a; else stack[sp++] = 0; DISPATCH();
op_Q: if (sp == 0 || stack[sp-1] == 0) pc = jumps[pc]; DISPATCH();
op_R: b = stack[--sp]; a = stack[--sp]; stack[sp++] = (a == b) ? 1 : 0; DISPATCH();
op_S: b = stack[--sp]; a = stack[--sp]; stack[sp++] = (a < b) ? 1 : 0; DISPATCH();
op_T: b = stack[--sp]; a = stack[--sp]; stack[sp++] = (a > b) ? 1 : 0; DISPATCH();
op_U: addr = stack[--sp]; val = stack[--sp]; mem[addr] = val; DISPATCH();
op_V: addr = stack[--sp]; stack[sp++] = mem[addr]; DISPATCH();
op_W: stack[sp++] = 26; DISPATCH();
op_X: stack[sp++] = 10; DISPATCH();
op_Y: DISPATCH();
op_Z: if (sp > 0 && stack[sp-1] != 0) pc = jumps[pc]; DISPATCH();

end:
    free(stack);
    free(mem);
    free(jumps);
    free(code);
    return 0;
}
