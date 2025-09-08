// El programa permite registrar estudiantes en un mapa (clave = ID, valor = nombre),
// mostrarlos y eliminarlos.

import 'dart:io'; // Librería para entrada y salida desde consola

// Definimos un mapa global para almacenar estudiantes
Map<int, String> estudiantes = {};

/// Función para agregar un estudiante al mapa
void agregarEstudiante(int id, String nombre) {
  estudiantes[id] = nombre; // Guardamos con la clave ID
  print("Estudiante agregado: $nombre con ID $id");
}

/// Función para mostrar todos los estudiantes
void mostrarEstudiantes() {
  if (estudiantes.isEmpty) {
    print("No hay estudiantes registrados.");
  } else {
    print("\nLista de estudiantes:");
    estudiantes.forEach((id, nombre) {
      print("ID: $id - Nombre: $nombre");
    });
  }
}

/// Función para eliminar un estudiante
void eliminarEstudiante(int id) {
  if (estudiantes.containsKey(id)) {
    String nombre = estudiantes.remove(id)!; // Eliminamos y obtenemos el nombre
    print("Estudiante eliminado: $nombre (ID $id)");
  } else {
    print("No existe un estudiante con el ID $id.");
  }
}

void main() {
  while (true) {
    print("\n==== MENÚ DE ESTUDIANTES ====");
    print("1. Agregar estudiante");
    print("2. Mostrar estudiantes");
    print("3. Eliminar estudiante");
    print("4. Salir");
    stdout.write("Seleccione una opción: ");
    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case "1":
        stdout.write("Ingrese el ID del estudiante: ");
        int id = int.parse(stdin.readLineSync()!);
        stdout.write("Ingrese el nombre del estudiante: ");
        String nombre = stdin.readLineSync()!;
        agregarEstudiante(id, nombre);
        break;

      case "2":
        mostrarEstudiantes();
        break;

      case "3":
        stdout.write("Ingrese el ID del estudiante a eliminar: ");
        int id = int.parse(stdin.readLineSync()!);
        eliminarEstudiante(id);
        break;

      case "4":
        print("Saliendo del programa...");
        return; // Finaliza el programa

      default:
        print("Opción no válida, intente de nuevo.");
    }
  }
}
