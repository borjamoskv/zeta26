# ZETA (Z26)

Lenguaje isomórfico Turing Completo basado exclusivamente en las 26 letras del alfabeto inglés (A-Z). Toda instrucción es un colapso semántico C5-REAL, sin "Green Theater".

## Arquitectura Causal

- Máquina de Pila (Stack-based) con memoria lineal (Heap).
- Sólo 26 opcodes (A-Z).
- Espacios, saltos de línea y símbolos no alfabéticos actúan como comentarios (entropía descartada).

## Tabla de Opcodes (Matriz Termodinámica)

| Instrucción | Acción | Isomorfismo |
|---|---|---|
| `A` | ADD | Pop B, Pop A -> Push (A+B) |
| `B` | SUB | Pop B, Pop A -> Push (A-B) |
| `C` | MUL | Pop B, Pop A -> Push (A*B) |
| `D` | DIV | Pop B, Pop A -> Push (A//B) |
| `E` | MOD | Pop B, Pop A -> Push (A%B) |
| `F` | ZERO | Push 0 |
| `G` | ONE | Push 1 |
| `H` | DUP | Duplica la cima |
| `I` | SWP | Intercambia los dos elementos superiores |
| `J` | POP | Pop y descarta |
| `K` | INC | Incrementa la cima en 1 |
| `L` | DEC | Decrementa la cima en 1 |
| `M` | OUTA | Imprime la cima como carácter ASCII |
| `N` | OUTN | Imprime la cima como número entero |
| `O` | INPA | Lee un char de STDIN a la pila |
| `P` | INPN | Lee un entero de STDIN a la pila |
| `Q` | JZ | Jump Forward si la cima es 0 (matching Z) |
| `R` | EQU | Igualdad: Push 1 si son iguales, si no 0 |
| `S` | LSS | Menor que: Push 1 si A < B, si no 0 |
| `T` | GRT | Mayor que: Push 1 si A > B, si no 0 |
| `U` | STR | Almacena: Pop Addr, Pop Val -> Mem[Addr] = Val |
| `V` | LDR | Carga: Pop Addr -> Push Mem[Addr] |
| `W` | PSH26 | Push 26 |
| `X` | PSH10 | Push 10 |
| `Y` | NOP | Sin operación (No Entropy) |
| `Z` | JNZ | Jump Backward si la cima != 0 (matching Q) |

## Ejecución C5-REAL

```bash
python zeta.py example.zta
```
