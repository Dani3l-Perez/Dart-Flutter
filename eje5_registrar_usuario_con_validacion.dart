import 'dart:io';
/// Pide al usuario: nombre de usuario, contraseña, email, edad y teléfono.
/// Incluye validaciones específicas:
/// - Contraseña: mínimo 8 caracteres.
/// - Email: debe contener "@".
/// - Edad: mayor de 13 años.
/// - Teléfono: exactamente 10 dígitos.
void main() {
  print("=== Registro de Usuario ===");
  // Solicitar nombre de usuario
  stdout.write("Ingrese su nombre de usuario: ");
  String username = stdin.readLineSync() ?? "";

  // Solicitar contraseña
  stdout.write("Ingrese su contraseña (mínimo 8 caracteres): ");
  String password = stdin.readLineSync() ?? "";
  if (password.length < 8) {
    print("Error: La contraseña debe tener al menos 8 caracteres.");
    return; // Detiene el programa
  }

  // Solicitar email
  stdout.write("Ingrese su correo electrónico: ");
  String email = stdin.readLineSync() ?? "";
  if (!email.contains("@")) {
    print("Error: El correo debe contener '@'.");
    return;
  }

  // Solicitar edad
  stdout.write("Ingrese su edad: ");
  int? age = int.tryParse(stdin.readLineSync() ?? "");
  if (age == null || age <= 13) {
    print("Error: La edad debe ser mayor a 13 años.");
    return;
  }

  // Solicitar teléfono
  stdout.write("Ingrese su número de teléfono (10 dígitos): ");
  String phone = stdin.readLineSync() ?? "";
  if (phone.length != 10 || int.tryParse(phone) == null) {
    print("Error: El número de teléfono debe tener exactamente 10 dígitos.");
    return;
  }

  // Si todas las validaciones pasan
  print("\nRegistro exitoso!");
  print("Usuario: $username");
  print("Correo: $email");
  print("Edad: $age");
  print("Teléfono: $phone");
}
