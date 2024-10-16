/*//Encontrar el entero positivo mayor en una lista de quince enteros

//Pseudocódigo

graph TD;
    A[Inicio] --> B[Inicializar lista de 15 enteros];
    B --> C[Inicializar maximo = 0];
    C --> D[Recorrer cada entero en la lista];
    D --> E{Es el entero > maximo?};
    E -- Si --> F[Actualizar maximo];
    E -- No --> G[Seguir al siguiente entero];
    F --> G;
    G --> H{Todos los enteros revisados?};
    H -- Si --> I[Imprimir maximo];
    H -- No --> D;
    I --> J[Fin];

//Código en Ensamblador ARM64
// C# (Implementación en ensamblador ARM64):
// int[] lista = {15 enteros};
// int maximo = 0;
// for (int i = 0; i < 15; i++) {
//     if (lista[i] > maximo) {
//         maximo = lista[i];
//     }
// }
// Console.WriteLine(maximo);
*/
.section .data
lista: .word 10, 23, 42, 5, 78, 90, 33, 27, 88, 1, 9, 45, 64, 39, 50

.section .text
.global _start
_start:
    // Inicializar maximo en 0
    mov x0, 0          // maximo = 0
    mov x1, 0          // índice i = 0

    // Cargar la dirección base de la lista
    ldr x2, =lista

loop:
    // Cargar el entero de la lista en el índice actual
    ldr w3, [x2, x1, LSL #2] // lista[i]

    // Comparar el valor actual con el maximo
    cmp w3, w0
    ble next              // Si no es mayor, pasar al siguiente

    // Actualizar maximo
    mov w0, w3            // maximo = lista[i]

next:
    // Incrementar índice
    add x1, x1, 1
    cmp x1, 15            // ¿Hemos revisado todos los elementos?
    bne loop

    // Salida del programa
    mov w8, 93            // syscall para salir
    svc 0
    /*
//Probar con diferentes listas de enteros y documentar los resultados:

//Lista: [10, 23, 42, 5, 78, 90, 33, 27, 88, 1, 9, 45, 64, 39, 50], resultado esperado: 90
//Lista: [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29], resultado esperado: 29
*/
