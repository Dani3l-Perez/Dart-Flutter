import 'dart:io';
/// - Almacena información de 5 contactos (nombre, teléfono, email).
/// - Muestra todos los contactos registrados.
/// - Permite buscar un contacto por nombre.
/// - Muestra la cantidad de contactos almacenados.
void main() {
  // Lista que almacenará los contactos (cada contacto es un Map)
  List<Map<String, String>> contactos = [];

  print("=== Gestor de Contactos Básico ===");

  // Registro de 5 contactos (se podría pedir al usuario, aquí lo hacemos fijo para simplificar)
  for (int i = 1; i <= 5; i++) {
    print("\nRegistro del contacto #$i");

    stdout.write("Ingrese el nombre: ");
    String? nombre = stdin.readLineSync();

    stdout.write("Ingrese el teléfono: ");
    String? telefono = stdin.readLineSync();

    stdout.write("Ingrese el email: ");
    String? email = stdin.readLineSync();

    // Validamos entradas nulas o vacías
    if (nombre == null || telefono == null || email == null || 
        nombre.isEmpty || telefono.isEmpty || email.isEmpty) {
      print("Entrada inválida. Contacto no guardado.");
      continue; // pasa al siguiente contactoD
    }

    // Guardamos el contacto en la lista
    contactos.add({
      "nombre": nombre,
      "telefono": telefono,
      "email": email,
    });
  }

  // Mostrar todos los contactos registrados
  print("\nLista de contactos registrados:");
  for (var contacto in contactos) {
    print("${contacto['nombre']} | ${contacto['telefono']} | ${contacto['email']}");
  }

  // Mostrar cantidad de contactos
  print("\n Total de contactos registrados: ${contactos.length}");

  // Búsqueda de un contacto por nombre
  stdout.write("\n Ingrese un nombre para buscar: ");
  String? buscar = stdin.readLineSync();

  if (buscar != null && buscar.isNotEmpty) {
    // Se busca ignorando mayúsculas/minúsculas
    var resultado = contactos.where((c) => c['nombre']!.toLowerCase() == buscar.toLowerCase()).toList();

    if (resultado.isNotEmpty) {
      print("Contacto encontrado:");
      for (var c in resultado) {
        print("${c['nombre']} | ${c['telefono']} | ${c['email']}");
      }
    } else {
      print("No se encontró un contacto con ese nombre.");
    }
  } else {
    print("No se ingresó un nombre válido.");
  }
}
