// El programa pide el año de nacimiento y calcula cuántos años
// tendrá la persona en el año 2050.

import 'dart:io'; // Librería necesaria para leer datos desde teclado.

void main() {
  // Mensaje inicial para el usuario.
  stdout.write("Ingrese su año de nacimiento: ");

  // Usamos stdin.readLineSync() para capturar el dato escrito en consola.
  // El operador "!" indica que el valor no será nulo (Null Safety).
  String? entrada = stdin.readLineSync();

  // Convertimos la entrada (que llega como String) a entero con int.parse().
  int anioNacimiento = int.parse(entrada!);

  // Definimos el año objetivo (2050).
  int anioFuturo = 2050;

  // Restamos el año futuro con el año de nacimiento para obtener la edad.
  int edadFutura = anioFuturo - anioNacimiento;

  // Mostramos el resultado en consola.
  print("En el año $anioFuturo tendrás $edadFutura años.");
}
