// El programa permite crear una lista de tareas pendientes,
// mostrarlas y marcarlas como realizadas.

import 'dart:io'; // Para leer datos desde teclado
// Lista global donde se almacenan las tareas
List<String> tareas = [];
// Lista paralela para marcar si cada tarea está completada o no
List<bool> completadas = [];
/// Función para agregar una tarea
void agregarTarea(String tarea) {
  tareas.add(tarea);       // Agregamos la tarea a la lista
  completadas.add(false);  // Inicialmente está pendiente (false)
  print("Tarea agregada: $tarea");
}
/// Función para mostrar todas las tareas
void mostrarTareas() {
  if (tareas.isEmpty) {
    print("No hay tareas registradas.");
  } else {
    print("\nLista de tareas:");
    for (int i = 0; i < tareas.length; i++) {
      String estado = completadas[i] ? "Completada" : "Pendiente";
      print("${i + 1}. ${tareas[i]} - $estado");
    }
  }
}

/// Función para marcar una tarea como completada
void completarTarea(int indice) {
  if (indice < 0 || indice >= tareas.length) {
    print("Número de tarea inválido.");
  } else {
    completadas[indice] = true;
    print("Tarea completada: ${tareas[indice]}");
  }
}

void main() {
  while (true) {
    print("\n==== MENÚ DE TAREAS ====");
    print("1. Agregar tarea");
    print("2. Mostrar tareas");
    print("3. Completar tarea");
    print("4. Salir");
    stdout.write("Seleccione una opción: ");
    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case "1":
        stdout.write("Ingrese la nueva tarea: ");
        String? tarea = stdin.readLineSync();
        if (tarea != null && tarea.isNotEmpty) {
          agregarTarea(tarea);
        } else {
          print("La tarea no puede estar vacía.");
        }
        break;

      case "2":
        mostrarTareas();
        break;

      case "3":
        mostrarTareas();
        stdout.write("Ingrese el número de la tarea a completar: ");
        String? entrada = stdin.readLineSync();
        int indice = int.parse(entrada!) - 1; // Convertimos a índice
        completarTarea(indice);
        break;

      case "4":
        print("Saliendo del programa...");
        return; // Finaliza el programa

      default:
        print("Opción no válida, intente de nuevo.");
    }
  }
}
