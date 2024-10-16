/*//Pseudocódigo
/*graph TD;
    A[Inicio] --> B[Inicializar i = 1];
    B --> C[Recorrer j desde 1 hasta 12];
    C --> D[Multiplicar i * j];
    D --> E[Imprimir i * j];
    E --> F[Incrementar j];
    F --> G{j <= 12?};
    G -- Si --> C;
    G -- No --> H[Incrementar i];
    H --> I{i <= 12?};
    I -- Si --> B;
    I -- No --> J[Fin];


// C# (Implementación en ensamblador ARM64):
// for (int i = 1; i <= 12; i++) {
//     for (int j = 1; j <= 12; j++) {
//         Console.WriteLine($"{i} x {j} = {i * j}");
//     }
// }
*/
.section .data
tabla_mult: .ascii "Tabla de multiplicar hasta 12 x 12\n"

.section .text
.global _start
_start:
    // Imprimir el encabezado de la tabla de multiplicar
    ldr x0, =tabla_mult
    bl print_message

    // Inicializar i = 1
    mov x1, 1

loop_i_mult:
    // Inicializar j = 1 para cada i
    mov x2, 1

loop_j_mult:
    // Calcular i * j
    mul x3, x1, x2

    // Imprimir el resultado: "i x j = resultado"
    bl print_mult

    // Incrementar j
    add x2, x2, 1
    cmp x2, 13            // ¿j <= 12?
    blt loop_j_mult

    // Incrementar i
    add x1, x1, 1
    cmp x1, 13            // ¿i <= 12?
    blt loop_i_mult

    // Salida del programa
    mov w8, 93            // syscall para salir
    svc 0

print_mult:
    // Aquí imprimimos los resultados de la multiplicación (omitiendo los detalles de la impresión)
    ret
/*
//Probar con las combinaciones de multiplicaciones desde 
//1×1 hasta 12×12. Se espera que los resultados impresos incluyan:
*/
//1 x 1 = 1
//2 x 2 = 4
//...
//12 x 12 = 144
