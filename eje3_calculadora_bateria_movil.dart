import 'dart:io';
/// - Solicita el porcentaje actual de batería.
/// - Solicita las horas de uso promedio diario.
/// - Calcula cuántas horas le quedan de uso.
/// - Incluye modos de ahorro de energía que extienden la duración.

void main() {
  print("=== Calculadora de Batería Móvil ===");

  // Solicitar porcentaje de batería actual
  stdout.write("Ingrese el porcentaje actual de batería (0-100): ");
  String? entradaBateria = stdin.readLineSync();
  double? porcentajeBateria = double.tryParse(entradaBateria ?? "");

  // Validación
  if (porcentajeBateria == null || porcentajeBateria < 0 || porcentajeBateria > 100) {
    print(" Valor inválido. Debe ingresar un número entre 0 y 100.");
    return;
  }

  // Solicitar horas de uso promedio diario
  stdout.write("Ingrese las horas de uso promedio diario (ej: 5.5): ");
  String? entradaUso = stdin.readLineSync();
  double? horasDiarias = double.tryParse(entradaUso ?? "");

  if (horasDiarias == null || horasDiarias <= 0) {
    print("Valor inválido. Debe ingresar un número mayor a 0.");
    return;
  }

  // Calcular duración estimada con el porcentaje actual
  // Regla: si con 100% dura "horasDiarias", con X% dura proporcionalmente menos
  double horasRestantes = (porcentajeBateria / 100) * horasDiarias;

  // Mostrar resultado inicial
  print("\nResultados:");
  print("Batería actual: ${porcentajeBateria.toStringAsFixed(1)}%");
  print("Horas de uso promedio diario: ${horasDiarias.toStringAsFixed(1)} h");
  print("Duración estimada restante: ${horasRestantes.toStringAsFixed(1)} h");

  // Modos de ahorro de energía (factores multiplicadores)
  Map<int, Map<String, dynamic>> modos = {
    1: {"nombre": "Normal (sin ahorro)", "factor": 1.0},
    2: {"nombre": "Ahorro medio", "factor": 1.2},
    3: {"nombre": "Ahorro máximo", "factor": 1.5},
  };

  print("\nModos de ahorro de energía disponibles:");
  modos.forEach((k, v) => print("$k. ${v['nombre']}"));

  stdout.write("Seleccione un modo (1-3): ");
  String? entradaModo = stdin.readLineSync();
  int? modoSeleccionado = int.tryParse(entradaModo ?? "");

  if (modoSeleccionado == null || !modos.containsKey(modoSeleccionado)) {
    print("Selección inválida. Se usará el modo normal.");
    modoSeleccionado = 1;
  }

  // Aplicar factor de ahorro
  double factor = modos[modoSeleccionado]!["factor"];
  double horasConAhorro = horasRestantes * factor;

  print("\n Modo seleccionado: ${modos[modoSeleccionado]!["nombre"]}");
  print("Duración con ahorro: ${horasConAhorro.toStringAsFixed(1)} h");
}
