// El programa pide al usuario un número entero y muestra su tabla
// de multiplicar desde 1 hasta 10.

import 'dart:io'; // Para leer datos desde teclado

void main() {
  // Pedimos al usuario el número
  stdout.write("Ingrese un número para ver su tabla de multiplicar: ");
  int numero = int.parse(stdin.readLineSync()!);

  print("\nTabla de multiplicar del $numero:");

  // Usamos un ciclo for para generar la tabla
  for (int i = 1; i <= 10; i++) {
    int resultado = numero * i; // Multiplicación
    print("$numero x $i = $resultado"); // Mostramos el resultado
  }
}
