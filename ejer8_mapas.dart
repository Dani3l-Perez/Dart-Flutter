// Programa para trabajar con Mapas en Dart.
// Un Mapa es una colección de pares clave → valor.

void main() {
  // Declaramos un Map donde las llaves son países y los valores son capitales
  Map<String, String> capitales = {
    "Colombia": "Bogotá",
    "Argentina": "Buenos Aires",
    "México": "Ciudad de México",
    "España": "Madrid"
  };

  // Imprimimos todo el mapa
  print("Mapa completo de países y capitales: $capitales");

  // Accedemos a la capital de un país específico
  String? capitalColombia = capitales["Colombia"];
  print("La capital de Colombia es: $capitalColombia");

  // Agregar un nuevo país con su capital
  capitales["Chile"] = "Santiago";
  print("Después de agregar Chile: $capitales");

  // Eliminar un país del mapa
  capitales.remove("México");
  print("Después de eliminar México: $capitales");
}
