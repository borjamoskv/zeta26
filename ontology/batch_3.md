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
