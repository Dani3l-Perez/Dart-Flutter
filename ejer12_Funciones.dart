// Se define una función que recibe dos números,
// calcula su suma y devuelve el resultado.

// Definición de la función con la palabra reservada "int"
// porque el valor que devuelve es de tipo entero.
int sumar(int numero1, int numero2) {
  // Usamos el operador "+" para obtener la suma de ambos parámetros.
  int resultado = numero1 + numero2;

  // Con la palabra "return" devolvemos el resultado al punto donde se llamó la función.
  return resultado;
}

void main() {
  // Punto de entrada del programa con la palabra reservada "void"
  // porque no devuelve ningún valor.

  // Llamamos a la función "sumar" pasando dos valores enteros.
  int suma1 = sumar(5, 7);   // aquí numero1=5 y numero2=7
  int suma2 = sumar(10, 20); // aquí numero1=10 y numero2=20

  // Mostramos los resultados en consola usando "print".
  print("La suma de 5 + 7 es: $suma1");     // Resultado: 12
  print("La suma de 10 + 20 es: $suma2");   // Resultado: 30
}
