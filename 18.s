/*//Pseudocódigo
/*graph TD;
    A[Inicio] --> B[Inicializar arreglo de 35 enteros];
    B --> C[Inicializar suma = 0];
    C --> D[Recorrer i desde 0 hasta 34];
    D --> E[Sumar arreglo[i] a suma];
    E --> F[Incrementar i];
    F --> G{i < 35?};
    G -- Si --> D;
    G -- No --> H[Imprimir suma];
    H --> I[Fin];
//Código en Ensamblador ARM64
// C# (Implementación en ensamblador ARM64):
// int[] arr = new int[35];
// int suma = 0;
// for (int i = 0; i < 35; i++) {
//     suma += arr[i];
// }
// Console.WriteLine($"Suma: {suma}");
*/
.section .data
msg_suma_35: .ascii "Suma de 35 enteros es: \n"
array_35: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, \
              21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35

.section .text
.global _start
_start:
    // Inicializar suma en 0
    mov x1, 0        // suma = 0
    mov x2, 0        // índice = 0

loop_sum_35:
    // Cargar el valor del arreglo
    ldr w3, [x0, x2, lsl #2]

    // Sumar el valor del arreglo a la suma
    add x1, x1, x3

    // Incrementar índice
    add x2, x2, 1

    // ¿índice < 35?
    cmp x2, 35
    blt loop_sum_35

    // Imprimir el resultado
    ldr x0, =msg_suma_35
    bl print_message

    // Salida del programa
    mov w8, 93
    svc 0
    /*
//Sumar 35 enteros secuenciales (1 a 35). El resultado esperado es 630. La salida esperada es:

//Suma de 35 enteros es: 630
*/
