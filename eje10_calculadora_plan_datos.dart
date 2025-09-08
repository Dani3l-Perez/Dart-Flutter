// Elegir el mejor plan de datos móviles
// según el consumo mensual promedio del usuario.
// Se comparan los planes en términos de costo total (incluyendo GB extra).
import 'dart:io';
// Clase que representa un plan de datos
class PlanDatos {
  String nombre;
  int gbIncluidos;
  double costoMensual;
  double costoPorGbExtra;
  PlanDatos(this.nombre, this.gbIncluidos, this.costoMensual, this.costoPorGbExtra);
  // Método para calcular el costo total según el consumo del usuario
  double calcularCosto(int consumoGb) {
    if (consumoGb <= gbIncluidos) {
      return costoMensual; // No paga extras
    } else {
      int extras = consumoGb - gbIncluidos;
      return costoMensual + (extras * costoPorGbExtra);
    }
  }

  // Mostrar info del plan
  void mostrarInfo() {
    print(" $nombre");
    print("   GB incluidos: $gbIncluidos GB");
    print("     Costo mensual: \$${costoMensual.toStringAsFixed(2)}");
    print("       Costo por GB extra: \$${costoPorGbExtra.toStringAsFixed(2)}\n");
  }
}

void main() {
  // Lista de planes disponibles
  List<PlanDatos> planes = [
    PlanDatos("Plan Básico", 5, 20000, 5000),
    PlanDatos("Plan Intermedio", 10, 35000, 4000),
    PlanDatos("Plan Premium", 20, 50000, 3000),
    PlanDatos("Plan Ilimitado", 50, 70000, 0), // simulación de casi ilimitado
  ];

  print("===  Calculadora de Plan de Datos ===\n");

  // Mostrar planes disponibles
  print("Planes disponibles:\n");
  for (var plan in planes) {
    plan.mostrarInfo();
  }

  // 🔹 Solicitar consumo promedio mensual al usuario
  stdout.write("Ingrese su consumo promedio mensual de datos (GB): ");
  int consumo = int.parse(stdin.readLineSync()!);

  // Calcular el costo de cada plan para el consumo dado
  double costoMinimo = double.infinity;
  PlanDatos? mejorPlan;

  for (var plan in planes) {
    double costo = plan.calcularCosto(consumo);
    print("Con el plan ${plan.nombre}, pagarías: \$${costo.toStringAsFixed(2)}");
    if (costo < costoMinimo) {
      costoMinimo = costo;
      mejorPlan = plan;
    }
  }

  // Mostrar recomendación final
  print("\nEl mejor plan para ti es: ${mejorPlan!.nombre}");
  print("   Con un costo estimado de: \$${costoMinimo.toStringAsFixed(2)} al mes.");
}
