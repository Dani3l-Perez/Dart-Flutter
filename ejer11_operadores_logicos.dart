// Programa que demuestra el uso de operadores lógicos en Dart

void main() {
  // Declaramos dos variables booleanas de ejemplo
  bool a = true;   // Puede representar "el usuario está registrado"
  bool b = false;  // Puede representar "el usuario está logueado"

  // ************** PARA RECORDAR *****************//

  // AND (&&): devuelve true solo si ambas condiciones son verdaderas.
  // En este caso: a=true y b=false -> resultado = false
  // Ejemplo de uso: verificar que el usuario esté registrado **y** logueado.
  bool resultadoAnd = a && b;  

  // OR (||): devuelve true si al menos una de las condiciones es verdadera.
  // En este caso: a=true o b=false -> resultado = true
  // Ejemplo de uso: verificar que el usuario esté registrado **o** tenga invitación.
  bool resultadoOr  = a || b;  

  // NOT (!): invierte el valor de la condición.
  // En este caso: a=true -> !a=false
  // Ejemplo de uso: verificar que el usuario **no** esté registrado.
  bool resultadoNotA = !a;     

  // NOT (!): también aplicado a b.
  // En este caso: b=false -> !b=true
  // Ejemplo de uso: verificar que el usuario **no** esté logueado.
  bool resultadoNotB = !b;     

  // Podemos confirmar de la siguiente manera
  print("a && b : $resultadoAnd");  // false
  print("a || b : $resultadoOr");   // true
  print("!a     : $resultadoNotA"); // false
  print("!b     : $resultadoNotB"); // true
}
