// Clase que representa un Servicio (ej: restaurante, farmacia, cajero)
class Servicio {
  String nombre;
  String direccion;
  double calificacion; // en escala de 0.0 a 5.0
  String tipo; // restaurante, farmacia, cajero
  
  Servicio(this.nombre, this.direccion, this.calificacion, this.tipo);

  // Método para mostrar la información del servicio
  void mostrarInfo() {
    print("$tipo: $nombre");
    print("   Dirección: $direccion");
    print("     Calificación: $calificacion");
    print("----------------------------------");
  }
}

void main() {
  // Lista de servicios disponibles
  List<Servicio> servicios = [
    Servicio("Restaurante La Sazón", "Calle 10 #5-30", 4.5, "restaurante"),
    Servicio("Farmacia Salud Total", "Carrera 7 #15-20", 4.8, "farmacia"),
    Servicio("Cajero Bancolombia", "Avenida 1 #45-67", 3.9, "cajero"),
    Servicio("Restaurante El Rincón", "Calle 12 #7-45", 4.2, "restaurante"),
    Servicio("Farmacia Drogas La Rebaja", "Calle 8 #12-33", 4.0, "farmacia"),
    Servicio("Cajero Davivienda", "Carrera 11 #30-21", 4.3, "cajero"),
  ];

  print("=== Localizador de Servicios Cercanos ===\n");

  // 🔹 Simulación de búsqueda: tipo de servicio que el usuario quiere
  String busqueda = "farmacia"; // <- Cambiar por "restaurante", "cajero" o cualquier otro

  print("Buscando servicios de tipo: $busqueda...\n");

  // Filtrar los servicios por tipo
  List<Servicio> filtrados =
      servicios.where((s) => s.tipo.toLowerCase() == busqueda.toLowerCase()).toList();

  if (filtrados.isEmpty) {
    print("No se encontraron servicios de tipo $busqueda.");
  } else {
    print("Servicios encontrados:\n");
    for (var servicio in filtrados) {
      servicio.mostrarInfo();
    }

    // Ordenar por calificación de mayor a menor
    filtrados.sort((a, b) => b.calificacion.compareTo(a.calificacion));
    print("Mejor calificado en $busqueda:\n");
    filtrados.first.mostrarInfo();
  }
}
