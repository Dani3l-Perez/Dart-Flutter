// Diferencia entre "var" y "final":
// - "var": permite declarar variables cuyo valor puede cambiar después.
// - "final": declara variables cuyo valor no puede ser modificado 
//después de asignado (constante en tiempo de ejecución).

void main() {
  // Uso de "var"
  var ciudad = "Bogotá"; // se puede cambiar después
  ciudad = "Medellín";   // válido, porque "var" permite reasignar
  print("Ciudad con var: $ciudad");

  // Uso de "final"
  final pais = "Colombia"; 
  // pais = "Ecuador"; // Esto daría error, porque "final" no permite reasignar.
  print("País con final: $pais");
}
