import 'dart:io';
/// - Conversión de temperatura (Celsius ↔ Fahrenheit).
/// - Conversión de distancia (metros ↔ kilómetros ↔ millas).
/// - Conversión de peso (gramos ↔ kilogramos ↔ libras).
/// - Conversión de almacenamiento digital (KB ↔ MB ↔ GB).

void main() {
  while (true) {
    print("\n=== Conversor de Unidades ===");
    print("1. Temperatura (Celsius/Fahrenheit)");
    print("2. Distancia (metros/kilómetros/millas)");
    print("3. Peso (gramos/kilogramos/libras)");
    print("4. Almacenamiento (KB/MB/GB)");
    print("5. Salir");

    stdout.write("Seleccione una opción (1-5): ");
    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case "1":
        convertirTemperatura();
        break;
      case "2":
        convertirDistancia();
        break;
      case "3":
        convertirPeso();
        break;
      case "4":
        convertirAlmacenamiento();
        break;
      case "5":
        print("Gracias por usar el conversor. ¡Hasta luego!");
        return; // Sale del programa
      default:
        print("Opción inválida. Intente de nuevo.");
    }
  }
}

/// Conversión de temperatura entre Celsius y Fahrenheit
void convertirTemperatura() {
  stdout.write("Ingrese el valor de temperatura: ");
  double? valor = double.tryParse(stdin.readLineSync() ?? "");

  if (valor == null) {
    print("Valor inválido.");
    return;
  }

  print("Seleccione la unidad de origen:");
  print("1. Celsius");
  print("2. Fahrenheit");
  stdout.write("Opción: ");
  String? opcion = stdin.readLineSync();

  if (opcion == "1") {
    double fahrenheit = (valor * 9 / 5) + 32;
    print("$valor °C = ${fahrenheit.toStringAsFixed(2)} °F");
  } else if (opcion == "2") {
    double celsius = (valor - 32) * 5 / 9;
    print("$valor °F = ${celsius.toStringAsFixed(2)} °C");
  } else {
    print("Opción inválida.");
  }
}

/// Conversión de distancias
void convertirDistancia() {
  stdout.write("Ingrese el valor de distancia: ");
  double? valor = double.tryParse(stdin.readLineSync() ?? "");

  if (valor == null) {
    print("Valor inválido.");
    return;
  }

  print("Seleccione la unidad de origen:");
  print("1. Metros");
  print("2. Kilómetros");
  print("3. Millas");
  stdout.write("Opción: ");
  String? opcion = stdin.readLineSync();

  switch (opcion) {
    case "1": // metros
      print("$valor m = ${(valor / 1000).toStringAsFixed(3)} km");
      print("$valor m = ${(valor / 1609.34).toStringAsFixed(3)} mi");
      break;
    case "2": // km
      print("$valor km = ${(valor * 1000).toStringAsFixed(2)} m");
      print("$valor km = ${(valor / 1.609).toStringAsFixed(3)} mi");
      break;
    case "3": // millas
      print("$valor mi = ${(valor * 1609.34).toStringAsFixed(2)} m");
      print("$valor mi = ${(valor * 1.609).toStringAsFixed(3)} km");
      break;
    default:
      print("Opción inválida.");
  }
}

/// Conversión de pesos
void convertirPeso() {
  stdout.write("Ingrese el valor de peso: ");
  double? valor = double.tryParse(stdin.readLineSync() ?? "");

  if (valor == null) {
    print("Valor inválido.");
    return;
  }

  print("Seleccione la unidad de origen:");
  print("1. Gramos");
  print("2. Kilogramos");
  print("3. Libras");
  stdout.write("Opción: ");
  String? opcion = stdin.readLineSync();

  switch (opcion) {
    case "1": // gramos
      print("$valor g = ${(valor / 1000).toStringAsFixed(3)} kg");
      print("$valor g = ${(valor / 453.592).toStringAsFixed(3)} lb");
      break;
    case "2": // kg
      print("$valor kg = ${(valor * 1000).toStringAsFixed(2)} g");
      print("$valor kg = ${(valor * 2.205).toStringAsFixed(3)} lb");
      break;
    case "3": // libras
      print("$valor lb = ${(valor * 453.592).toStringAsFixed(2)} g");
      print("$valor lb = ${(valor / 2.205).toStringAsFixed(3)} kg");
      break;
    default:
      print("Opción inválida.");
  }
}

/// Conversión de almacenamiento digital
void convertirAlmacenamiento() {
  stdout.write("Ingrese el valor de almacenamiento: ");
  double? valor = double.tryParse(stdin.readLineSync() ?? "");

  if (valor == null) {
    print("Valor inválido.");
    return;
  }

  print("Seleccione la unidad de origen:");
  print("1. KB");
  print("2. MB");
  print("3. GB");
  stdout.write("Opción: ");
  String? opcion = stdin.readLineSync();

  switch (opcion) {
    case "1": // KB
      print("$valor KB = ${(valor / 1024).toStringAsFixed(3)} MB");
      print("$valor KB = ${(valor / (1024 * 1024)).toStringAsFixed(6)} GB");
      break;
    case "2": // MB
      print("$valor MB = ${(valor * 1024).toStringAsFixed(2)} KB");
      print("$valor MB = ${(valor / 1024).toStringAsFixed(3)} GB");
      break;
    case "3": // GB
      print("$valor GB = ${(valor * 1024).toStringAsFixed(2)} MB");
      print("$valor GB = ${(valor * 1024 * 1024).toStringAsFixed(2)} KB");
      break;
    default:
      print("Opción inválida.");
  }
}
