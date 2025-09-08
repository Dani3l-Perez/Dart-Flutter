// Programa para trabajar con Listas en Dart.
// Usamos la palabra reservada "List" para declarar una colección de datos.

void main() {
  // Creamos una lista de tipo String con los nombres de tres amigos
  List<String> amigos = ["Carlos", "María", "Sofía"];

  // Bucle for clásico para recorrer la lista
  // - "i" comienza en 0 y va aumentando hasta que i < amigos.length
  // - amigos.length devuelve la cantidad de elementos en la lista
  for (int i = 0; i < amigos.length; i++) {
    print("Amigo ${i + 1}: ${amigos[i]}");
  }
}
