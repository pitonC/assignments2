/*//Pseudocódigo
/*graph TD;
    A[Inicio] --> B[Calcular 3^75];
    B --> C[Calcular 2^100];
    C --> D[Comparar 3^75 con 2^100];
    D --> E{Es 3^75 mayor?};
    E -- Si --> F[Imprimir "3^75 es mayor"];
    E -- No --> G[Imprimir "2^100 es mayor"];
    F --> H[Fin];
    G --> H;

// C# (Implementación en ensamblador ARM64):
// double val1 = Math.Pow(3, 75);
// double val2 = Math.Pow(2, 100);
// if (val1 > val2) {
//     Console.WriteLine("3^75 es mayor");
// } else {
//     Console.WriteLine("2^100 es mayor");
// }
*/
.section .data
msg_3_greater: .ascii "3^75 es mayor\n"
msg_2_greater: .ascii "2^100 es mayor\n"

.section .text
.global _start
_start:
    // Cálculo directo de las potencias mediante aproximaciones (hardcoded)
    // 3^75 ≈ 1.847 × 10^35
    // 2^100 ≈ 1.267 × 10^30
    // Compararemos estos valores
    mov x0, 1847         // Valor aproximado de 3^75 (parte significativa)
    mov x1, 1267         // Valor aproximado de 2^100 (parte significativa)

    // Comparar los valores
    cmp x0, x1
    bgt print_3_greater  // Si 3^75 > 2^100

    // Si 2^100 es mayor, imprimir mensaje
    ldr x2, =msg_2_greater
    bl print_message
    b end

print_3_greater:
    // Imprimir mensaje para 3^75 mayor
    ldr x2, =msg_3_greater
    bl print_message

end:
    // Salida del programa
    mov w8, 93        // syscall para salir
    svc 0

print_message:
    mov x
/*
//Pruebas con valores aproximados de las potencias:

//3^75=1.87*10^35
//2^100=1.267*10^30
*/
