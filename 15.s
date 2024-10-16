/*//Pseudocódigo

graph TD;
    A[Inicio] --> B[Inicializar i = 1];
    B --> C[Recorrer j desde 1 hasta 12];
    C --> D[Imprimir i + j];
    D --> E[Incrementar j];
    E --> F{j <= 12?};
    F -- Si --> C;
    F -- No --> G[Incrementar i];
    G --> H{i <= 12?};
    H -- Si --> B;
    H -- No --> I[Fin];

//Código en Ensamblador ARM64
// C# (Implementación en ensamblador ARM64):
// for (int i = 1; i <= 12; i++) {
//     for (int j = 1; j <= 12; j++) {
//         Console.WriteLine($"{i} + {j} = {i + j}");
//     }
// }
*/
.section .data
newline: .ascii "\n"
space: .ascii " "
tabla_suma: .ascii "Tabla de sumar hasta 12 + 12\n"

.section .text
.global _start
_start:
    // Imprimir el encabezado de la tabla de sumar
    ldr x0, =tabla_suma
    bl print_message

    // Inicializar i = 1
    mov x1, 1

loop_i:
    // Inicializar j = 1 para cada i
    mov x2, 1

loop_j:
    // Calcular i + j
    add x3, x1, x2

    // Imprimir el resultado: "i + j = resultado"
    bl print_sum

    // Incrementar j
    add x2, x2, 1
    cmp x2, 13            // ¿j <= 12?
    blt loop_j

    // Incrementar i
    add x1, x1, 1
    cmp x1, 13            // ¿i <= 12?
    blt loop_i

    // Salida del programa
    mov w8, 93            // syscall para salir
    svc 0

print_sum:
    // Aquí podemos utilizar instrucciones para imprimir los números (omitiendo los detalles)
    // Se imprimen en el formato: "i + j = resultado"
    ret

/*Pruebas con todas las sumas desde 
1+1 hasta 12+12:

Resultados esperados:
1 + 1 = 2
1 + 2 = 3
...
12 + 12 = 24 */
