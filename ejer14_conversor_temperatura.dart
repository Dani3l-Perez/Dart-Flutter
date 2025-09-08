// El programa define funciones para convertir temperaturas
// entre Celsius y Fahrenheit y prueba con distintos valores.

// Función para convertir Celsius a Fahrenheit.
// Fórmula: (C × 9/5) + 32
double celsiusAFahrenheit(double celsius) {
  double fahrenheit = (celsius * 9 / 5) + 32;
  return fahrenheit; // devolvemos el resultado
}

// Función para convertir Fahrenheit a Celsius.
// Fórmula: (F - 32) × 5/9
double fahrenheitACelsius(double fahrenheit) {
  double celsius = (fahrenheit - 32) * 5 / 9;
  return celsius; // devolvemos el resultado
}

void main() {
  // Probamos las funciones con algunos valores
  double tempC = 25;   // 25 °C
  double tempF = 77;   // 77 °F

  // Usamos las funciones y guardamos los resultados
  double resultadoF = celsiusAFahrenheit(tempC);
  double resultadoC = fahrenheitACelsius(tempF);

  // Mostramos los resultados en consola
  print("$tempC °C equivalen a $resultadoF °F");
  print("$tempF °F equivalen a $resultadoC °C");
}
