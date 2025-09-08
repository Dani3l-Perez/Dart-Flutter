// Este programa permite registrar notas, calcular el promedio
// y determinar si el estudiante aprueba o reprueba.

import 'dart:io'; // Para entrada y salida en consola

// Lista global para guardar las notas
List<double> notas = [];

/// Función para agregar una nota a la lista
void agregarNota(double nota) {
  if (nota >= 0 && nota <= 5) {
    notas.add(nota);
    print("Nota $nota registrada con éxito.");
  } else {
    print("La nota debe estar entre 0 y 5.");
  }
}

/// Función para mostrar todas las notas registradas
void mostrarNotas() {
  if (notas.isEmpty) {
    print("No hay notas registradas.");
  } else {
    print("\nNotas del estudiante:");
    for (int i = 0; i < notas.length; i++) {
      print("Nota ${i + 1}: ${notas[i]}");
    }
  }
}

/// Función para calcular el promedio de las notas
double calcularPromedio() {
  if (notas.isEmpty) return 0.0;
  double suma = notas.reduce((a, b) => a + b);
  return suma / notas.length;
}

/// Función para determinar si el estudiante aprueba
void verificarAprobacion() {
  double promedio = calcularPromedio();
  if (notas.isEmpty) {
    print("No se puede calcular promedio, no hay notas.");
  } else {
    print("\nPromedio: ${promedio.toStringAsFixed(2)}");
    if (promedio >= 3.0) {
      print("El estudiante aprueba.");
    } else {
      print("El estudiante reprueba.");
    }
  }
}

void main() {
  while (true) {
    print("\n==== SISTEMA DE NOTAS ====");
    print("1. Agregar nota");
    print("2. Mostrar notas");
    print("3. Calcular promedio y verificar aprobación");
    print("4. Salir");
    stdout.write("Seleccione una opción: ");
    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case "1":
        stdout.write("Ingrese la nota (0 a 5): ");
        double nota = double.parse(stdin.readLineSync()!);
        agregarNota(nota);
        break;

      case "2":
        mostrarNotas();
        break;

      case "3":
        verificarAprobacion();
        break;

      case "4":
        print("Saliendo del sistema de notas...");
        return; // Termina el programa

      default:
        print("Opción no válida, intente nuevamente.");
    }
  }
}
