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

# MATRIZ ONTOLÓGICA ZETA — BATCH 3

## 1. Primitivas de Colapso (Mecanismos de Fallo)

| ID | Primitiva | Mecanismo Causal | Activación (Trigger) | Sensor (Síntoma) | Escala Temporal | Gravedad | Intervención |
|---|---|---|---|---|---|---|---|
| P-007 | Agotamiento Lineal | Llenado completo del espacio de memoria de 262144 celdas. | Secuencia infinita de PUSH sin consumo o Fuga de Memoria lineal (`W` sin liberación). | OOM en runtime local de la VM ZETA. | Medio Plazo | Crítica | Aserción estricta del límite superior del Heap Address. |
| P-008 | Transición Fantasma | Salto PC a una dirección fuera de la cinta de instrucciones. | `Z` o `Q` apuntan a un índice `>= code_length`. | PC apunta a instrucción vacía (NOP/Crash). | Inmediato | Crítica | Bound-check riguroso sobre `pc` post-salto. |
| P-009 | Mutación Concurrente | El motor WASM y el Host JS acceden simultáneamente a una celda compartida sin sincronización atómica. | Escritura en linear memory mapeada a `SharedArrayBuffer` durante lectura asíncrona. | Lectura de estado rasgado (Torn Read). | Estocástico | Medio | Forzar operaciones de carga/almacenamiento atómicas (WASM atomics). |

## 2. Invariantes Termodinámicas (Conservación y Flujo)

| ID | Invariante | Lógica / Principio | Implicación Operacional | Condición de Borde | Métrica Falsable |
|---|---|---|---|---|---|
| I-007 | Determinismo Estricto | Un AST de entrada con el mismo estado de memoria siempre producirá el mismo vector de salida. | Prohibición absoluta de funciones `rand()` o E/S temporal (`Date.now()`) no inyectadas exógenamente. | $F(S_{in}) = S_{out}$ inmutable. | Hash del log de traza para entradas idénticas. |
| I-008 | Isomorfismo Transaccional | El número de operaciones lógicas emitidas por Anvil es proporcional a las instrucciones ejecutadas en ZETA. | La transpilación no puede inyectar bucles estocásticos ocultos. | $O(N)_{Anvil} \approx O(N)_{ZETA}$ | Ratio de expansión de bytecode en `anvil2zeta.py`. |
| I-009 | Integridad del Contexto Local | El marco de pila local (`bp`) de una función retorna exactamente al mismo estado de memoria del que partió tras `RETURN`. | Las llamadas a subrutinas son transparentes a los efectos secundarios del stack del llamador. | $SP_{pre-call} == SP_{post-return}$ | Validación dinámica de SP tras opcode `RET`. |

## 3. Antipatrones Estocásticos (Fragilidad de Diseño)

| ID | Antipatrón | Disfunción Causal | Señal de Presencia | Impacto en Robustez | Refactor (Alternativa) |
|---|---|---|---|---|---|
| A-007 | Captura Parcial de Logs | Extraer output por `stdout` pero dejar los errores `stderr` sin rastrear. | Fallo asíncrono no reportado en el UI web. | Pérdida de visibilidad epistémica (Sensor Drift). | Unificación de descriptores `STDOUT` y `STDERR` en un único buffer de memoria estructurada. |
| A-008 | Parseo Ciego de ZASM | Confiar en que el transpiler generará instrucciones 100% legales sin validación final. | Excepciones del motor WASM en vez del compilador ZETA (Late failure). | Degrada la experiencia del desarrollador y dificulta el debug. | Fase de análisis semántico post-transpilación antes de ejecución. |
| A-009 | Acoplamiento Interfaz-Lógica | Mezclar la manipulación del DOM web con la inicialización del módulo WASM de manera síncrona. | Congelación del hilo principal del navegador durante `WebAssembly.instantiate`. | Destruye la exergía de la UI interactiva. | Cargar WASM asíncronamente vía Worker o promesa suspendida. |

## 4. Redundancias Activas (Aislamiento C5)

| ID | Redundancia C5 | Función Topológica | Riesgo Mitigado | Coste (Overhead) | Dependencias |
|---|---|---|---|---|---|
| R-007 | Respaldo del AST | Guardar la versión JSON pura de Anvil en el binario ZETA (o comentario) para auditoría reversible. | Imposibilidad de descompilar a alto nivel una vez forjado el binario en servidor. | +20-50% tamaño del archivo distribuido. | Serializador JSON de Anvil. |
| R-008 | Mapeo Fuente-Destino | Generar Source Maps implícitos entre las líneas de `.anv` y los opcodes generados en ZASM. | Complejidad de correlacionar un Panic de runtime ZETA con la línea de fallo Anvil. | Tiempo de transpilación mayor; requerimiento de estructura de metadata. | `anvil2zeta.py` map struct. |
| R-009 | Comprobación de Firmas | Embeber el Hash SHA-256 del AST base en el módulo compilado final para verificar su procedencia. | Ejecución de un binario modificado maliciosamente post-compilación. | Ciclos extra de hashing en tiempo de compilación/carga. | Entorno de despliegue, Hash gen. |

## 5. Vectores de Ataque Adversarial

| ID | Vector Adversarial | Superficie de Ataque | Mecanismo de Explotación | Impacto Termodinámico | Defensa (Mitigación) |
|---|---|---|---|---|---|
| V-007 | Envenenamiento de Input | Instrucción `O` (Lectura). | Inyectar una cadena infinita que agote la pila al intentar leer un número entero (`NaN` infinito). | Bucle CPU continuo en rutina de parseo. | Límite determinista de caracteres por opcode de lectura. |
| V-008 | Overflow Aritmético | Acumulación matemática (`A`, `M`). | Explotar cálculos sin límite superior forzando wraparounds enteros (`int32` a negativo) afectando lógica condicional posterior. | Violación de contratos de valor (`safe_transfer` exploit). | Aserción estática SMT en Anvil y traps automáticos (Saturating Math) en WASM. |
| V-009 | Ejecución Especulativa (WASM) | VM Engine local. | Realizar temporización cruzada de la memoria local para extraer secretos mediante side-channels tipo Spectre si se usan SharedArrayBuffers. | Filtración de datos de ejecución a pestañas cruzadas (si el host lo permite). | Minimizar resolución temporal de los temporizadores o aislar el hilo en modo estricto. |

