// Importamos la librería dart:io para trabajar con entrada/salida desde la consola.
import 'dart:io';

// La función principal del programa, punto de entrada.
void main() {
  // Mostramos un mensaje en consola para que el usuario ingrese su respuesta.
  // stdout.write() no da salto de línea automáticamente.
  stdout.write("¿Eres mayor de edad? (true/false): ");

  // Capturamos la entrada del usuario como un String.
  String? entrada = stdin.readLineSync();

  // Convertimos la entrada en un valor booleano.
  // Si el usuario escribe "true", será true; en cualquier otro caso será false.
  bool esMayorDeEdad = (entrada == "true");

  // Estructura condicional if-else:
  // - if: se ejecuta si esMayorDeEdad es true
  // - else: se ejecuta si esMayorDeEdad es false
  if (esMayorDeEdad) {
    print("Eres mayor de edad, tienes acceso permitido.");
  } else {
    print("Eres menor de edad, acceso denegado.");
  }
}
