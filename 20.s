/*Encontrar la suma de todos los enteros pares del 2 al 2,000
//Pseudocódigo
/*graph TD;
    A[Inicio] --> B[Inicializar suma = 0];
    B --> C[Recorrer i desde 2 hasta 2000 con paso 2];
    C --> D[Sumar i a suma];
    D --> E[Incrementar i];
    E --> F{i <= 2000?};
    F -- Si --> C;
    F -- No --> G[Imprimir suma];
    G --> H[Fin];
Código en Ensamblador ARM64

// C# (Implementación en ensamblador ARM64):
// int suma = 0;
// for (int i = 2; i <= 2000; i += 2) {
//     suma += i;
// }
// Console.WriteLine($"Suma: {suma}");

.section .data
msg_suma_pares: .ascii "Suma de pares del 2 al 2000 es: \n"
*/
.section .text
.global _start
_start:
    // Inicializar suma en 0
    mov x1, 0         // suma = 0
    mov x2, 2         // i = 2

loop_sum_pares:
    // Sumar i a suma
    add x1, x1, x2    // suma += i

    // Incrementar i en 2
    add x2, x2, 2

    // ¿i <= 2000?
    cmp x2, 2002
    blt loop_sum_pares

    // Imprimir el resultado de la suma
    ldr x0, =msg_suma_pares
    bl print_message

    // Salida del programa
    mov w8, 93
    svc 0
/*
//Se espera que la suma de todos los enteros pares del 2 al 2,000 sea 1,001,000. La salida esperada es:

//Suma de pares del 2 al 2000 es: 1001000
*/
