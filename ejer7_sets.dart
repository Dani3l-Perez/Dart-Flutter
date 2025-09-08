// Programa para trabajar con Sets en Dart.
// Usamos la palabra reservada "Set" para declarar una colección de elementos únicos.

void main() {
  // Declaramos un Set con nombres de ciudades
  Set<String> ciudades = {"Bogotá", "Medellín", "Cali"};

  // Mostramos el Set original
  print("Ciudades iniciales: $ciudades");

  // Agregar una nueva ciudad al Set
  ciudades.add("Cartagena");
  print("Después de agregar Cartagena: $ciudades");

  // Intentar agregar un duplicado (no se añadirá porque Set no permite repetidos)
  ciudades.add("Bogotá");
  print("Después de intentar agregar Bogotá otra vez: $ciudades");

  // Eliminar una ciudad
  ciudades.remove("Cali");
  print("Después de eliminar Cali: $ciudades");
}
