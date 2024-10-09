/*//Pseudocódigo
/*graph TD;
    A[Inicio] --> B[Inicializar suma = 0];
    B --> C[Recorrer i desde 1 hasta 1000];
    C --> D[Sumar i a suma];
    D --> E[Incrementar i];
    E --> F{i <= 1000?};
    F -- Si --> C;
    F -- No --> G[Imprimir suma];
    G --> H[Fin];

// C# (Implementación en ensamblador ARM64):
// int suma = 0;
// for (int i = 1; i <= 1000; i++) {
//     suma += i;
// }
// Console.WriteLine($"Suma: {suma}");
*/
.section .data
msg_suma_1000: .ascii "Suma de 1 al 1000 es: \n"

.section .text
.global _start
_start:
    // Inicializar suma en 0
    mov x1, 0         // suma = 0
    mov x2, 1         // i = 1

loop_sum_1_to_1000:
    // Sumar i a suma
    add x1, x1, x2    // suma += i

    // Incrementar i
    add x2, x2, 1

    // ¿i <= 1000?
    cmp x2, 1001
    blt loop_sum_1_to_1000
/*
    // Imprimir el resultado de la suma
    ldr x0, =msg_suma_1000
    bl print_message

    // Salida del programa
    mov w8, 93
    svc 0
    */

//Se espera que la suma de los números del 1 al 1,000 sea 500,500. La salida esperada es:

//Suma de 1 al 1000 es: 500500
