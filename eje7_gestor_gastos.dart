import 'dart:io';
/// Registrar gastos por categorías (comida, transporte, entretenimiento, servicios).
/// Guardar los gastos en una lista de mapas.
/// Calcular el total de cada categoría.
/// Mostrar el gasto total acumulado.
void main() {
  print("=== Gestor de Gastos Personales ===");
  // Lista donde se guardarán los gastos. Cada gasto es un mapa {categoria: string, monto: double}
  List<Map<String, dynamic>> gastos = [];

  // Categorías válidas
  List<String> categorias = ["comida", "transporte", "entretenimiento", "servicios"];

  while (true) {
    print("\nSeleccione una opción:");
    print("1. Registrar gasto");
    print("2. Ver reporte de gastos");
    print("3. Salir");

    stdout.write("Opción: ");
    String? opcion = stdin.readLineSync();

    if (opcion == "1") {
      // Registrar un gasto
      print("\nCategorías disponibles: ${categorias.join(", ")}");
      stdout.write("Ingrese la categoría: ");
      String? categoria = stdin.readLineSync()?.toLowerCase();

      if (categoria == null || !categorias.contains(categoria)) {
        print("Categoría inválida.");
        continue;
      }

      stdout.write("Ingrese el monto del gasto: ");
      double? monto = double.tryParse(stdin.readLineSync() ?? "");

      if (monto == null || monto <= 0) {
        print("Monto inválido.");
        continue;
      }

      // Guardar gasto en la lista
      gastos.add({"categoria": categoria, "monto": monto});
      print("Gasto registrado: $categoria - \$$monto");

    } else if (opcion == "2") {
      // Mostrar reporte
      if (gastos.isEmpty) {
        print("\nNo hay gastos registrados aún.");
        continue;
      }

      // Totales por categoría
      Map<String, double> totalesPorCategoria = {
        for (var cat in categorias) cat: 0.0
      };

      double gastoTotal = 0;

      for (var gasto in gastos) {
        String cat = gasto["categoria"];
        double monto = gasto["monto"];
        totalesPorCategoria[cat] = (totalesPorCategoria[cat] ?? 0) + monto;
        gastoTotal += monto;
      }

      print("\n=== Reporte de Gastos ===");
      totalesPorCategoria.forEach((categoria, total) {
        print("${categoria[0].toUpperCase()}${categoria.substring(1)}: \$${total.toStringAsFixed(2)}");
      });
      print("Gasto total del mes: \$${gastoTotal.toStringAsFixed(2)}");

    } else if (opcion == "3") {
      print("Saliendo del gestor de gastos. ¡Hasta luego!");
      break;
    } else {
      print("Opción inválida.");
    }
  }
}
