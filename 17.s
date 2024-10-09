/*//Pseudocódigo
/*graph TD;
    A[Inicio] --> B[Inicializar suma = 0];
    B --> C[Recorrer i desde 1 hasta 20];
    C --> D[Sumar i a suma];
    D --> E[Incrementar i];
    E --> F{i <= 20?};
    F -- Si --> C;
    F -- No --> G[Imprimir suma];
    G --> H[Fin];

//Código en Ensamblador ARM64
/ C# (Implementación en ensamblador ARM64):
// int suma = 0;
// for (int i = 1; i <= 20; i++) {
//     suma += i;
// }
// Console.WriteLine($"Suma: {suma}");

.section .data
msg_suma: .ascii "Suma de 1 al 20 es: \n"
*/
.section .text
.global _start
_start:
    // Inicializar suma en 0
    mov x1, 0         // suma = 0
    mov x2, 1         // i = 1

loop_sum_1_to_20:
    // Sumar i a suma
    add x1, x1, x2    // suma += i

    // Incrementar i
    add x2, x2, 1

    // ¿i <= 20?
    cmp x2, 21
    blt loop_sum_1_to_20

    // Imprimir el resultado de la suma
    ldr x0, =msg_suma
    bl print_message

    // Salida del programa
    mov w8, 93
    svc 0

/*
//Se espera que el resultado de la suma sea 210. La salida esperada es:

//Suma de 1 al 20 es: 210
*/
