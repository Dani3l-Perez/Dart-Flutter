// Este programa implementa un sistema básico de reservas para eventos
// (conciertos, cine, teatro). Cada evento tiene un nombre, fecha, lugar,
// precio de entrada y capacidad máxima de asistentes.
//
// El usuario puede ver eventos disponibles, reservar entradas y cancelar reservas.

import 'dart:io';

// Clase que representa un Evento
class Evento {
  String nombre;
  String fecha;
  String lugar;
  double precio;
  int capacidadMaxima;
  int reservados = 0; // entradas ya reservadas

  Evento(this.nombre, this.fecha, this.lugar, this.precio, this.capacidadMaxima);

  // Método para mostrar información del evento
  void mostrarInfo() {
    print("$nombre");
    print("    Fecha: $fecha");
    print("    Lugar: $lugar");
    print("    Precio: \$${precio.toStringAsFixed(2)}");
    print("    Capacidad disponible: ${capacidadMaxima - reservados}\n");
  }

  // Reservar entradas
  bool reservar(int cantidad) {
    if (reservados + cantidad <= capacidadMaxima) {
      reservados += cantidad;
      print("Reserva realizada: $cantidad entradas para $nombre.");
      return true;
    } else {
      print("No hay suficientes entradas disponibles para $nombre.");
      return false;
    }
  }

  // Cancelar reserva
  bool cancelar(int cantidad) {
    if (cantidad <= reservados) {
      reservados -= cantidad;
      print("Se cancelaron $cantidad entradas de $nombre.");
      return true;
    } else {
      print("No puedes cancelar más entradas de las que has reservado.");
      return false;
    }
  }
}

void main() {
  // Lista de eventos disponibles
  List<Evento> eventos = [
    Evento("Concierto RockFest", "2025-09-15", "Estadio Nacional", 120000, 5000),
    Evento("Obra de Teatro Hamlet", "2025-09-20", "Teatro Colón", 60000, 800),
    Evento("Estreno Cine Avengers 5", "2025-09-25", "Cineplex Central", 25000, 300),
  ];

  print("=== Sistema de Reservas de Eventos ===\n");

  bool salir = false;
  while (!salir) {
    print("Menú:");
    print("1. Ver eventos disponibles");
    print("2. Reservar entradas");
    print("3. Cancelar reserva");
    print("4. Salir");
    stdout.write("Seleccione una opción: ");
    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case "1":
        print("\n Lista de eventos disponibles:\n");
        for (var e in eventos) {
          e.mostrarInfo();
        }
        break;

      case "2":
        print("\n🔹 Reservar entradas");
        for (int i = 0; i < eventos.length; i++) {
          print("${i + 1}. ${eventos[i].nombre}");
        }
        stdout.write("Seleccione el evento: ");
        int idx = int.parse(stdin.readLineSync()!) - 1;
        stdout.write("Ingrese la cantidad de entradas: ");
        int cantidad = int.parse(stdin.readLineSync()!);
        eventos[idx].reservar(cantidad);
        break;

      case "3":
        print("\n🔹 Cancelar reserva");
        for (int i = 0; i < eventos.length; i++) {
          print("${i + 1}. ${eventos[i].nombre}");
        }
        stdout.write("Seleccione el evento: ");
        int idx = int.parse(stdin.readLineSync()!) - 1;
        stdout.write("Ingrese la cantidad de entradas a cancelar: ");
        int cantidad = int.parse(stdin.readLineSync()!);
        eventos[idx].cancelar(cantidad);
        break;

      case "4":
        salir = true;
        print("\n Gracias por usar el sistema de reservas.");
        break;

      default:
        print("Opción no válida. Intente de nuevo.");
    }

    print("\n-----------------------------------\n");
  }
}
