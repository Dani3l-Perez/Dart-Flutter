import 'dart:io';
/// - Solicita al usuario la cantidad de datos consumidos en MB durante una semana.
/// - Calcula el promedio diario de consumo.
/// - Determina si ese consumo semanal puede hacer que supere un plan de 2GB mensuales.
/// - Estima cuántos días le quedan de datos si mantiene ese ritmo de consumo.

void main() {
  // Definir el límite de datos del plan (2 GB en MB)
  const int planMensualMB = 2 * 1024; // 2048 MB
  const int diasDelMes = 30;

  print("=== Calculadora de Datos Móviles ===");
  stdout.write("Ingrese la cantidad de datos consumidos en la semana (MB): ");
  String? entrada = stdin.readLineSync();

  // Validamos la entrada del usuario
  if (entrada == null || entrada.isEmpty) {
    print("No se ingresó un valor válido.");
    return;
  }

  // Convertimos la entrada a número
  double? consumoSemanal = double.tryParse(entrada);
  if (consumoSemanal == null || consumoSemanal < 0) {
    print("Debe ingresar un número válido mayor o igual a 0.");
    return;
  }

  // Cálculo del promedio diario
  double promedioDiario = consumoSemanal / 7;

  // Estimación del consumo mensual (suponiendo mismo ritmo cada semana)
  double consumoMensualEstimado = promedioDiario * diasDelMes;

  // Determinar si excede el plan
  bool excedePlan = consumoMensualEstimado > planMensualMB;

  // Calcular cuántos días duraría el plan con ese consumo diario
  double diasDisponibles = planMensualMB / promedioDiario;

  print("\nResultados:");
  print("Consumo semanal ingresado: ${consumoSemanal.toStringAsFixed(2)} MB");
  print("Promedio diario de consumo: ${promedioDiario.toStringAsFixed(2)} MB");
  print("Consumo mensual estimado: ${consumoMensualEstimado.toStringAsFixed(2)} MB");
  print("Límite del plan: $planMensualMB MB (2 GB)");

  if (excedePlan) {
    print("Advertencia: Con este consumo, excederá el plan de 2 GB.");
  } else {
    print("Buen trabajo: Con este consumo, no excederá el plan.");
  }

  print("Si mantiene este consumo, su plan le durará aproximadamente "
      "${diasDisponibles.toStringAsFixed(0)} días.");
}