
/*//Pseudocódigo
/* graph TD;
    A[Inicio] --> B[Inicializar lista de 15 enteros];
    B --> C[Inicializar maximo = 0, segundoMaximo = 0];
    C --> D[Recorrer cada entero en la lista];
    D --> E{Es el entero > maximo?};
    E -- Si --> F[segundoMaximo = maximo; maximo = entero];
    E -- No --> G{Es el entero > segundoMaximo?};
    G -- Si --> H[Actualizar segundoMaximo];
    G -- No --> I[Seguir al siguiente entero];
    F --> I;
    H --> I;
    I --> J{Todos los enteros revisados?};
    J -- Si --> K[Imprimir segundoMaximo];
    J -- No --> D;
    K --> L[Fin];

//Código en Ensamblador ARM64
// C# (Implementación en ensamblador ARM64):
// int[] lista = {15 enteros};
// int maximo = 0;
// int segundoMaximo = 0;
// for (int i = 0; i < 15; i++) {
//     if (lista[i] > maximo) {
//         segundoMaximo = maximo;
//         maximo = lista[i];
//     } else if (lista[i] > segundoMaximo) {
//         segundoMaximo = lista[i];
//     }
// }
// Console.WriteLine(segundoMaximo);
*/
.section .data
lista: .word 10, 23, 42, 5, 78, 90, 33, 27, 88, 1, 9, 45, 64, 39, 50

.section .text
.global _start
_start:
    // Inicializar maximo y segundoMaximo en 0
    mov x0, 0          // maximo = 0
    mov x1, 0          // segundoMaximo = 0
    mov x2, 0          // índice i = 0

    // Cargar la dirección base de la lista
    ldr x3, =lista

loop:
    // Cargar el entero de la lista en el índice actual
    ldr w4, [x3, x2, LSL #2] // lista[i]

    // Comparar con maximo
    cmp w4, w0
    ble check_second_max      // Si no es mayor, comprobar segundoMaximo

    // Actualizar segundoMaximo y maximo
    mov w1, w0               // segundoMaximo = maximo
    mov w0, w4               // maximo = lista[i]
    b next

check_second_max:
    // Comparar con segundoMaximo
    cmp w4, w1
    ble next                 // Si no es mayor, continuar
    mov w1, w4               // segundoMaximo = lista[i]

next:
    // Incrementar índice
    add x2, x2, 1
    cmp x2, 15               // ¿Hemos revisado todos los elementos?
    bne loop

    // Salida del programa
    mov w8, 93               // syscall para salir
    svc 0
/*
//Probar con diferentes listas y verificar el segundo mayor:

//Lista: [10, 23, 42, 5, 78, 90, 33, 27, 88, 1, 9, 45, 64, 39, 50], resultado esperado: 88
//Lista: [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29], resultado esperado: 27
*/
