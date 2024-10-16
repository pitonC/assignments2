/*Introducir un número y determinar si es “par” o “impar”
Pseudocódigo

graph TD;
    A[Inicio] --> B[Leer número];
    B --> C{Número mod 2 == 0?};
    C -- Si --> D[Imprimir "Es par"];
    C -- No --> E[Imprimir "Es impar"];
    D --> F[Fin];
    E --> F;
*/ 

# (Implementación en ensamblador ARM64):
// Console.Write("Introduce un número: ");
// int numero = Convert.ToInt32(Console.ReadLine());
// if (numero % 2 == 0) {
//     Console.WriteLine($"{numero} es par.");
// } else {
//     Console.WriteLine($"{numero} es impar.");
// }

.section .data
msg_input_par: .ascii "Introduce un número: "
msg_par: .ascii " es par.\n"
msg_impar: .ascii " es impar.\n"

.section .bss
numero_par: .skip 4

.section .text
.global _start
_start:
    // Solicitar número al usuario
    ldr x0, =msg_input_par
    bl print_message
    bl read_int
    str w0, numero_par // Almacenar el número

    // Cargar el número y comprobar si es par o impar
    ldr w1, numero_par
    and w2, w1, 1 // Verificar si el último bit es 1 (impar)

    cmp w2, 0
    beq es_par       // Si es igual a 0, es par

    // Imprimir que es impar
    ldr x0, =msg_impar
    bl print_message
    b fin_par

es_par:
    // Imprimir que es par
    ldr x0, =msg_par
    bl print_message

fin_par:
    // Salida del programa
    mov w8, 93
    svc 0

/*Pruebas y Depuración 
Entrada: 12
Salida: 12 es par.
Entrada: 13
Salida: 13 es impar. */
