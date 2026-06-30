# MATRIZ ONTOLÓGICA ZETA — BATCH 1

## 1. Primitivas de Colapso (Mecanismos de Fallo)

| ID | Primitiva | Mecanismo Causal | Activación (Trigger) | Sensor (Síntoma) | Escala Temporal | Gravedad | Intervención |
|---|---|---|---|---|---|---|---|
| P-001 | Degradación de Puntero | Corrupción en el tope de pila que desplaza la dirección de ejecución. | Entrada no numérica en opcodes `U`/`V`. | Carga de valor erróneo de la dirección 0. | Ciclos de instrucción individuales. | Crítico | Validación estricta de tipo en VM. |
| P-002 | Desbordamiento de Pila | Pila supera 65536 celdas asignadas. | Bucle recursivo sin condición de parada. | VM lanza excepción de desbordamiento. | Segundos | Crítico | Comprobación de límites en OP Push. |
| P-003 | Fuga de Contexto Ledger | Mutación local no reflejada en el Ledger inmutable. | Commits omitiendo la bandera `--no-verify`. | Fallo en firma hash local. | Inmediato | Medio | Enforzamiento del Git Sentinel Hook. |

## 2. Invariantes Termodinámicas (Conservación y Flujo)

| ID | Invariante | Lógica / Principio | Implicación Operacional | Condición de Borde | Métrica Falsable |
|---|---|---|---|---|---|
| I-001 | Conservación Lógica | El borrado de 1 bit disipa un mínimo de $kT \ln 2$ de energía (Landauer). | Toda instrucción POP (`J`) requiere trabajo exérgico. | $T > 0$ Kelvin | Tasa de ciclos por instrucción disipada. |
| I-002 | Conservación de Pila | El número de Pops no puede superar a los Push. | VM debe abortar si el Stack Pointer (SP) es negativo. | $SP \geq 0$ | Valor de SP en cada tick de reloj de la VM. |
| I-003 | Límite de Disipación | La optimización AST debe reducir la longitud del código. | Compilador debe buscar la mínima representación. | Longitud final $\leq$ longitud inicial | Delta de opcodes generados. |

## 3. Antipatrones Estocásticos (Fragilidad de Diseño)

| ID | Antipatrón | Disfunción Causal | Señal de Presencia | Impacto en Robustez | Refactor (Alternativa) |
|---|---|---|---|---|---|
| A-001 | Green Theater de Consenso | Simulaciones C4-SIM que pretenden ser C5-REAL mediante discursos conversacionales. | Prosa decorativa en logs del sistema. | Alta varianza de fiabilidad. | YAML estructurado y códigos hash. |
| A-002 | Limerencia de Alto Nivel | Dependencia de la VM de Python con su sobrecoste de memoria y CPU. | Tiempos de ejecución en ms > 10. | Baja velocidad física. | Transpilador nativo a C / Wasm. |
| A-003 | Redundancia de Estado | Copias físicas de la misma invariante en múltiples directorios. | Ficheros duplicados sin symlinks. | Pudrición de contexto. | Symlinks a través de Singularity Nexus. |

## 4. Redundancias Activas (Aislamiento C5)

| ID | Redundancia C5 | Función Topológica | Riesgo Mitigado | Coste (Overhead) | Dependencias |
|---|---|---|---|---|---|
| R-001 | Git Sentinel | Ledger local para aserción criptográfica del estado del repositorio. | Pérdida de invariantes de código. | 50ms por commit. | Git binario local. |
| R-002 | Aislamiento de PTY | Contención de buffers interactivos colgantes en sockets Tmux. | Bloqueo estocástico del agente en TUI. | Uso mínimo de PTY. | Tmux socket active. |
| R-003 | Bypass de Bucle JNZ | Mecanismo de Loop-Exit redundante ante condiciones inválidas. | Bucle infinito en compilador. | Instrucciones extra. | Opcodes `Q` / `Z`. |

## 5. Vectores de Ataque Adversarial

| ID | Vector Adversarial | Superficie de Ataque | Mecanismo de Explotación | Impacto Termodinámico | Defensa (Mitigación) |
|---|---|---|---|---|---|
| V-001 | Inyección no Alfabética | Analizador de entrada de la VM. | Inserción de símbolos de control en el buffer de código. | Desperdicio de ciclos en NOPs. | Filtrado estricto `isalpha()` en fase de carga. |
| V-002 | Deadlock de Condición | Lógica de saltos del AST (`Q`/`Z`). | Bucle infinito enviando datos invariantes en pila. | 100% uso CPU (disipación térmica). | Límite de ciclos de ejecución. |
| V-003 | Desbordamiento de Memoria | Instrucción `U` (STR). | Escritura masiva en direcciones fuera de rango. | Caída del runtime (OOM). | Comprobación de límites en memoria lineal. |
