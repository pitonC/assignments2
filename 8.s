/*Determinar si un entero dado es un múltiplo de 6
Pseudocódigo

/*graph TD;
    A[Inicio] --> B[Leer número];
    B --> C{Número mod 6 == 0?};
    C -- Si --> D[Imprimir "Es múltiplo de 6"];
    C -- No --> E[Imprimir "No es múltiplo de 6"];
    D --> F[Fin];
    E --> F;
Código en Ensamblador ARM64 

/* C# (Implementación en ensamblador ARM64):
// Console.Write("Introduce un número: ");
// int numero = Convert.ToInt32(Console.ReadLine());
// if (numero % 6 == 0) {
//     Console.WriteLine($"{numero} es múltiplo de 6.");
// } else {
//     Console.WriteLine($"{numero} no es múltiplo de 6.");
// }
*/
.section .data
msg_input: .ascii "Introduce un número: "
msg_multiplo: .ascii " es múltiplo de 6.\n"
msg_no_multiplo: .ascii " no es múltiplo de 6.\n"

.section .bss
numero: .skip 4

.section .text
.global _start
_start:
    // Solicitar número al usuario
    ldr x0, =msg_input
    bl print_message
    bl read_int
    str w0, numero // Almacenar el número

    // Cargar el número y comprobar si es múltiplo de 6
    ldr w1, numero
    mov w2, 6
    udiv w3, w1, w2      // w3 = numero / 6
    mul w3, w3, w2       // w3 = (numero / 6) * 6
    cmp w1, w3           // Comparar numero con el resultado
    beq es_multiplo      // Si son iguales, es múltiplo de 6

    // Imprimir que no es múltiplo de 6
    ldr x0, =msg_no_multiplo
    bl print_message
    b fin

es_multiplo:
    // Imprimir que es múltiplo de 6
    ldr x0, =msg_multiplo
    bl print_message

fin:
    // Salida del programa
    mov w8, 93
    svc 0
/*
//Pruebas y Depuración 
//Entrada: 12 Salida: 12 es múltiplo de 6.
//Entrada: 13 Salida: 13 no es múltiplo de 6.
*/
