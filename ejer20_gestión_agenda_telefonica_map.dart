// Este programa permite registrar, mostrar, buscar y eliminar contactos
// usando un Map donde la clave es el nombre y el valor es el número de teléfono.

import 'dart:io'; // Para entrada y salida en consola

// Agenda telefónica representada con un Map
Map<String, String> agenda = {};

/// Función para agregar un contacto
void agregarContacto(String nombre, String telefono) {
  if (agenda.containsKey(nombre)) {
    print("El contacto $nombre ya existe. Se actualizará el número.");
  }
  agenda[nombre] = telefono;
  print("Contacto guardado: $nombre -> $telefono");
}

/// Función para mostrar todos los contactos
void mostrarContactos() {
  if (agenda.isEmpty) {
    print("La agenda está vacía.");
  } else {
    print("\nContactos en la agenda:");
    agenda.forEach((nombre, telefono) {
      print("- $nombre: $telefono");
    });
  }
}

/// Función para buscar un contacto por nombre
void buscarContacto(String nombre) {
  if (agenda.containsKey(nombre)) {
    print("Contacto encontrado: $nombre -> ${agenda[nombre]}");
  } else {
    print("El contacto $nombre no existe en la agenda.");
  }
}

/// Función para eliminar un contacto
void eliminarContacto(String nombre) {
  if (agenda.remove(nombre) != null) {
    print("Contacto $nombre eliminado con éxito.");
  } else {
    print("El contacto $nombre no existe en la agenda.");
  }
}

void main() {
  while (true) {
    print("\n==== AGENDA TELEFÓNICA ====");
    print("1. Agregar contacto");
    print("2. Mostrar contactos");
    print("3. Buscar contacto");
    print("4. Eliminar contacto");
    print("5. Salir");
    stdout.write("Seleccione una opción: ");
    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case "1":
        stdout.write("Ingrese el nombre del contacto: ");
        String nombre = stdin.readLineSync()!;
        stdout.write("Ingrese el número de teléfono: ");
        String telefono = stdin.readLineSync()!;
        agregarContacto(nombre, telefono);
        break;

      case "2":
        mostrarContactos();
        break;

      case "3":
        stdout.write("Ingrese el nombre a buscar: ");
        String nombre = stdin.readLineSync()!;
        buscarContacto(nombre);
        break;

      case "4":
        stdout.write("Ingrese el nombre a eliminar: ");
        String nombre = stdin.readLineSync()!;
        eliminarContacto(nombre);
        break;

      case "5":
        print("Saliendo de la agenda...");
        return; // Finaliza el programa

      default:
        print("Opción no válida. Intente nuevamente.");
    }
  }
}
