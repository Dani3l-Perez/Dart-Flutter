import 'dart:io';
/// Incluye 4 medios: Bus, Metro, Taxi y Aplicación Móvil.
/// Cada transporte tiene:
/// - Una tarifa base (mínimo a pagar).
/// - Un costo por kilómetro recorrido.
/// El usuario elige el medio y la distancia, y se calcula el total.

/// Clase abstracta que define un transporte
abstract class Transporte {
  String nombre;
  double tarifaBase;
  double costoPorKm;

  Transporte(this.nombre, this.tarifaBase, this.costoPorKm);

  /// Método para calcular el costo según la distancia recorrida
  double calcularCosto(double km) {
    return tarifaBase + (costoPorKm * km);
  }
}

/// Clase para Bus
class Bus extends Transporte {
  Bus() : super("Bus", 2000, 300); // Ejemplo: base = $2000, $300 por km
}

/// Clase para Metro
class Metro extends Transporte {
  Metro() : super("Metro", 2500, 250);
}

/// Clase para Taxi
class Taxi extends Transporte {
  Taxi() : super("Taxi", 4000, 800);
}

/// Clase para Aplicación Móvil (tipo Uber/Didi)
class AppMovil extends Transporte {
  AppMovil() : super("Aplicación Móvil", 5000, 1000);
}

void main() {
  print("=== Calculadora de Tarifa de Transporte ===");

  // Crear una lista de transportes disponibles
  List<Transporte> transportes = [Bus(), Metro(), Taxi(), AppMovil()];

  // Mostrar menú
  print("\nSeleccione el medio de transporte:");
  for (int i = 0; i < transportes.length; i++) {
    print("${i + 1}. ${transportes[i].nombre}");
  }

  stdout.write("Opción: ");
  int? opcion = int.tryParse(stdin.readLineSync() ?? "");

  if (opcion == null || opcion < 1 || opcion > transportes.length) {
    print("Opción inválida.");
    return;
  }

  Transporte seleccionado = transportes[opcion - 1];

  // Pedir distancia
  stdout.write("Ingrese la distancia en km: ");
  double? km = double.tryParse(stdin.readLineSync() ?? "");

  if (km == null || km <= 0) {
    print("Distancia inválida.");
    return;
  }
  // Calcular costo
  double costo = seleccionado.calcularCosto(km);

  print("\nMedio de transporte: ${seleccionado.nombre}");
  print("Distancia: $km km");
  print("Costo total: \$${costo.toStringAsFixed(2)} COP");
}
