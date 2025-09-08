import 'dart:io';
/// Clase que representa a un estudiante
class Estudiante {
  String nombre;
  String id;
  List<double> calificaciones = [];

  Estudiante(this.nombre, this.id);

  /// Agregar una calificación a la lista
  void agregarCalificacion(double nota) {
    calificaciones.add(nota);
  }

  /// Calcular el promedio de las notas
  double calcularPromedio() {
    if (calificaciones.isEmpty) return 0.0;
    double suma = calificaciones.reduce((a, b) => a + b);
    return suma / calificaciones.length;
  }
  /// Determinar si aprobó (mínimo 3.0)
  bool aprobo() {
    return calcularPromedio() >= 3.0;
  }

  /// Generar un reporte con todas las calificaciones
  String generarReporte() {
    return '''
Estudiante: $nombre
ID: $id
Calificaciones: ${calificaciones.isEmpty ? "Ninguna" : calificaciones.join(", ")}
Promedio: ${calcularPromedio().toStringAsFixed(2)}
Estado: ${aprobo() ? "APROBADO" : "REPROBADO"}
''';
  }
}

/// Función principal
void main() {
  List<Estudiante> estudiantes = [];

  print("=== Sistema de Calificaciones Estudiantil ===");

  while (true) {
    print("\nMenú:");
    print("1. Registrar estudiante");
    print("2. Agregar calificaciones");
    print("3. Mostrar reportes individuales");
    print("4. Ver estadísticas del grupo");
    print("5. Salir");
    stdout.write("Seleccione una opción: ");
    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case "1":
        // Registrar estudiante
        stdout.write("Ingrese el nombre del estudiante: ");
        String? nombre = stdin.readLineSync();

        stdout.write("Ingrese el ID del estudiante: ");
        String? id = stdin.readLineSync();

        if (nombre != null && id != null) {
          estudiantes.add(Estudiante(nombre, id));
          print("Estudiante registrado con éxito.");
        }
        break;

      case "2":
        // Agregar calificaciones
        if (estudiantes.isEmpty) {
          print("No hay estudiantes registrados.");
          break;
        }

        print("\nSeleccione un estudiante:");
        for (int i = 0; i < estudiantes.length; i++) {
          print("${i + 1}. ${estudiantes[i].nombre}");
        }
        stdout.write("Opción: ");
        int index = int.parse(stdin.readLineSync()!) - 1;

        if (index >= 0 && index < estudiantes.length) {
          stdout.write("Ingrese la calificación: ");
          double nota = double.parse(stdin.readLineSync()!);
          estudiantes[index].agregarCalificacion(nota);
          print("Calificación agregada.");
        } else {
          print("Estudiante no válido.");
        }
        break;

      case "3":
        // Mostrar reportes individuales
        for (var est in estudiantes) {
          print(est.generarReporte());
        }
        break;

      case "4":
        // Estadísticas del grupo
        if (estudiantes.isEmpty) {
          print("No hay estudiantes registrados.");
          break;
        }

        double promedioGeneral = estudiantes
            .map((e) => e.calcularPromedio())
            .reduce((a, b) => a + b) /
            estudiantes.length;

        int aprobados = estudiantes.where((e) => e.aprobo()).length;
        int reprobados = estudiantes.length - aprobados;

        print("\nEstadísticas del Grupo:");
        print("Número de estudiantes: ${estudiantes.length}");
        print("Promedio general: ${promedioGeneral.toStringAsFixed(2)}");
        print("Aprobados: $aprobados");
        print("Reprobados: $reprobados");
        break;

      case "5":
        print("Saliendo del sistema...");
        return;

      default:
        print("Opción inválida. Intente nuevamente.");
    }
  }
}
  