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

    while (pc < len) {
        switch (code[pc]) {
            case 'A': b = stack[--sp]; a = stack[--sp]; stack[sp++] = a + b; break;
            case 'B': b = stack[--sp]; a = stack[--sp]; stack[sp++] = a - b; break;
            case 'C': b = stack[--sp]; a = stack[--sp]; stack[sp++] = a * b; break;
            case 'D': b = stack[--sp]; a = stack[--sp]; stack[sp++] = b ? (a / b) : 0; break;
            case 'E': b = stack[--sp]; a = stack[--sp]; stack[sp++] = b ? (a % b) : 0; break;
            case 'F': stack[sp++] = 0; break;
            case 'G': stack[sp++] = 1; break;
            case 'H': stack[sp] = stack[sp-1]; sp++; break;
            case 'I': b = stack[--sp]; a = stack[--sp]; stack[sp++] = b; stack[sp++] = a; break;
            case 'J': sp--; break;
            case 'K': stack[sp-1]++; break;
            case 'L': stack[sp-1]--; break;
            case 'M': putchar(stack[--sp] & 0xFF); fflush(stdout); break;
            case 'N': printf("%ld", stack[--sp]); fflush(stdout); break;
            case 'O': c = getchar(); stack[sp++] = (c != EOF) ? c : 0; break;
            case 'P': if (scanf("%ld", &a) == 1) stack[sp++] = a; else stack[sp++] = 0; break;
            case 'Q': if (sp == 0 || stack[sp-1] == 0) pc = jumps[pc]; break;
            case 'R': b = stack[--sp]; a = stack[--sp]; stack[sp++] = (a == b) ? 1 : 0; break;
            case 'S': b = stack[--sp]; a = stack[--sp]; stack[sp++] = (a < b) ? 1 : 0; break;
            case 'T': b = stack[--sp]; a = stack[--sp]; stack[sp++] = (a > b) ? 1 : 0; break;
            case 'U': addr = stack[--sp]; val = stack[--sp]; mem[addr] = val; break;
            case 'V': addr = stack[--sp]; stack[sp++] = mem[addr]; break;
            case 'W': stack[sp++] = 26; break;
            case 'X': stack[sp++] = 10; break;
            case 'Y': break;
            case 'Z': if (sp > 0 && stack[sp-1] != 0) pc = jumps[pc]; break;
        }
        pc++;
    }

    free(stack);
    free(mem);
    free(jumps);
    free(code);
    return 0;
}
