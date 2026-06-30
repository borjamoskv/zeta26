# MATRIZ ONTOLÓGICA ZETA — BATCH 2

## 1. Primitivas de Colapso (Mecanismos de Fallo)

| ID | Primitiva | Mecanismo Causal | Activación (Trigger) | Sensor (Síntoma) | Escala Temporal | Gravedad | Intervención |
|---|---|---|---|---|---|---|---|
| P-004 | Desalineación de Pila | Altura de la pila de operandos no coincide en límites de control de flujo estático. | Código ZETA no validado ejecutado en WASM nativo. | Error de validación en compilador WASM. | Compilación | Medio | Simular la pila en memoria lineal en lugar de operandos nativos. |
| P-005 | Bloqueo de Entrada/Salida | Espera infinita de datos en STDIN. | Invocación de `O`/`P` sin entrada disponible en canal no bloqueante. | Hilo del sistema operativo colgado al 0% de CPU. | Indefinido | Medio | Configurar timeouts en llamadas de lectura en C. |
| P-006 | Degradación de Cache | Fallos de predicción de saltos masivos. | VM implementada con `switch` gigante sin computed gotos. | Incremento de ciclos CPU por instrucción. | Continuo | Bajo | Enforzar Direct Threaded Code (Computed Gotos). |

## 2. Invariantes Termodinámicas (Conservación y Flujo)

| ID | Invariante | Lógica / Principio | Implicación Operacional | Condición de Borde | Métrica Falsable |
|---|---|---|---|---|---|
| I-004 | Invariancia de Flujo | El número de lecturas en memoria no puede alterar el estado de la memoria. | El opcode `V` (LDR) debe ser de lectura pura y libre de efectos secundarios. | $\forall \text{addr}, \text{mem}[addr]' == \text{mem}[addr]$ | Comparativa hash de memoria pre y post lectura. |
| I-005 | Invariancia del AST | El código ejecutable es inmutable una vez cargado. | No existe automodificación de código durante el runtime. | $\text{code}' == \text{code}$ | Firma hash de la sección de texto del proceso. |
| I-006 | Equilibrio de Saltos | Cada salto adelante (`Q`) se empareja estrictamente con un salto atrás (`Z`). | El parser estático debe validar la correspondencia biyectiva de loops. | $\sum Q == \sum Z$ | Validación de la tabla de saltos al cargar. |

## 3. Antipatrones Estocásticos (Fragilidad de Diseño)

| ID | Antipatrón | Disfunción Causal | Señal de Presencia | Impacto en Robustez | Refactor (Alternativa) |
|---|---|---|---|---|---|
| A-004 | Direccionamiento Estático | Dependencia de direcciones de memoria hardcodeadas para variables del AST. | Opcodes `PUSH <addr>` fijos en ZASM sin offsets relativos. | Fallo al anidar llamadas a funciones. | Puntero de marco de pila móvil (Frame Pointer). |
| A-005 | Descarte Silencioso | Operaciones que consumen pila (`J`, `U`) sin validar la presencia de datos mínimos. | Pops ciegos en stack sin comprobación previa de subdesbordamiento. | Fallo de segmentación por puntero nulo. | Validación de altura mínima de stack en la VM. |
| A-006 | Enmascaramiento de Bucles | Reutilizar la cima de la pila como condición en bucles anidados sin preservarla. | El bucle interno destruye el iterador del bucle externo. | Bucle infinito inesperado o terminación prematura. | Almacenar iteradores en memoria lineal diferenciada. |

## 4. Redundancias Activas (Aislamiento C5)

| ID | Redundancia C5 | Función Topológica | Riesgo Mitigado | Coste (Overhead) | Dependencias |
|---|---|---|---|---|---|
| R-004 | Doble Registro de Traza | Captura paralela de logs en Sys_Stderr y canal persistente de sesión. | Pérdida de traza de fallo catastrófico de la VM. | Mínimo (E/S asíncrona). | Sys_Stderr, disco. |
| R-005 | Aserción de Límites | Registros de protección física a nivel de runtime para SP y PC. | Ejecución de instrucciones fuera del vector o pila. | Comprobación condicional extra por ciclo. | `zeta_core` VM. |
| R-006 | Chequeo Inductivo | Verificación dinámica de invariantes de bucle antes de cada salto `Z`. | Desbordamiento lógico o violación de invariante matemática en bucles. | Coste computacional menor en depuración. | AST optimizado. |

## 5. Vectores de Ataque Adversarial

| ID | Vector Adversarial | Superficie de Ataque | Mecanismo de Explotación | Impacto Termodinámico | Defensa (Mitigación) |
|---|---|---|---|---|---|
| V-004 | Underflow de Pila | Instrucciones aritméticas o de E/S. | Invocar `A` (ADD) en una pila vacía para forzar desajustes de SP. | Corrupción del segmento de memoria contiguo. | Abortar inmediatamente si $SP < 2$ en binarios aritméticos. |
| V-005 | Lectura de Memoria Insegura | Instrucción `V` (LDR). | Consultar direcciones extremadamente grandes para leer áreas de memoria no asignadas. | Acceso a memoria no inicializada del host (Leak). | Forzar direccionamiento lógico relativo con límites fijos (Máximo 65536). |
| V-006 | Secuestro de Destino | Tabla de saltos dinámica. | Modificar las celdas de la tabla de saltos en memoria para redirigir `Z` a una sección insegura. | Ejecución de código arbitrario. | Guardar la tabla de saltos en memoria de solo lectura (Read-Only Segment). |
