class Actividad {
  String tipo;        // Tipo de actividad (caminar, correr, bicicleta, etc.)
  int duracion;       // Duración en minutos
  double calorias;    // Calorías quemadas por minuto
  double distancia;   // Distancia recorrida en km

  // Constructor
  Actividad(this.tipo, this.duracion, this.calorias, this.distancia);

  // Calcular calorías totales quemadas
  double caloriasTotales() {
    return duracion * calorias;
  }

  // Reporte individual de la actividad
  String reporte() {
    return "Actividad: $tipo | Duración: ${duracion}min | "
            "Calorías: ${caloriasTotales()} kcal | Distancia: ${distancia} km";
  }
}

class MonitorActividad {
  List<Actividad> actividades = [];

  // Registrar una actividad
  void registrarActividad(Actividad actividad) {
    actividades.add(actividad);
    print("Actividad registrada: ${actividad.tipo}");
  }

  // Calcular estadísticas
  void mostrarEstadisticas() {
    if (actividades.isEmpty) {
      print("No hay actividades registradas.");
      return;
    }

    double totalCalorias = actividades.fold(0, (sum, act) => sum + act.caloriasTotales());
    int totalTiempo = actividades.fold(0, (sum, act) => sum + act.duracion);
    double totalDistancia = actividades.fold(0, (sum, act) => sum + act.distancia);

    print("\nEstadísticas Generales:");
    print("Tiempo total: $totalTiempo min");
    print("Calorías quemadas: $totalCalorias kcal");
    print("Distancia total: $totalDistancia km");
  }

  // Mostrar reporte detallado de actividades
  void mostrarReporte() {
    print("\nReporte de Actividades:");
    for (var actividad in actividades) {
      print(actividad.reporte());
    }
  }
}

void main() {
  MonitorActividad monitor = MonitorActividad();

  // Registrar actividades
  monitor.registrarActividad(Actividad("Caminar", 30, 5.0, 2.5));
  monitor.registrarActividad(Actividad("Correr", 45, 10.0, 8.0));
  monitor.registrarActividad(Actividad("Bicicleta", 60, 8.0, 15.0));

  // Mostrar reportes
  monitor.mostrarReporte();
  monitor.mostrarEstadisticas();
}
