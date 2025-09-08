// El programa permite agregar productos, mostrar el inventario
// y actualizar cantidades.

import 'dart:io'; // Para entrada y salida desde consola

// Definimos el inventario como un mapa global
Map<String, int> inventario = {};

/// Función para agregar o actualizar un producto en el inventario
void agregarProducto(String nombre, int cantidad) {
  if (inventario.containsKey(nombre)) {
    inventario[nombre] = inventario[nombre]! + cantidad;
    print("Cantidad actualizada: $nombre -> ${inventario[nombre]} unidades");
  } else {
    inventario[nombre] = cantidad;
    print("Producto agregado: $nombre -> $cantidad unidades");
  }
}

/// Función para mostrar todos los productos
void mostrarInventario() {
  if (inventario.isEmpty) {
    print("El inventario está vacío.");
  } else {
    print("\nInventario actual:");
    inventario.forEach((nombre, cantidad) {
      print("- $nombre: $cantidad unidades");
    });
  }
}

/// Función para actualizar directamente la cantidad de un producto
void actualizarProducto(String nombre, int cantidad) {
  if (inventario.containsKey(nombre)) {
    inventario[nombre] = cantidad;
    print("Cantidad de $nombre actualizada a $cantidad unidades");
  } else {
    print("El producto $nombre no existe en el inventario.");
  }
}

void main() {
  while (true) {
    print("\n==== MENÚ DE INVENTARIO ====");
    print("1. Agregar producto");
    print("2. Mostrar inventario");
    print("3. Actualizar cantidad de un producto");
    print("4. Salir");
    stdout.write("Seleccione una opción: ");
    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case "1":
        stdout.write("Ingrese el nombre del producto: ");
        String nombre = stdin.readLineSync()!;
        stdout.write("Ingrese la cantidad: ");
        int cantidad = int.parse(stdin.readLineSync()!);
        agregarProducto(nombre, cantidad);
        break;

      case "2":
        mostrarInventario();
        break;

      case "3":
        stdout.write("Ingrese el nombre del producto a actualizar: ");
        String nombre = stdin.readLineSync()!;
        stdout.write("Ingrese la nueva cantidad: ");
        int cantidad = int.parse(stdin.readLineSync()!);
        actualizarProducto(nombre, cantidad);
        break;

      case "4":
        print("Saliendo del programa...");
        return; // Termina el programa

      default:
        print("Opción no válida. Intente de nuevo.");
    }
  }
}
