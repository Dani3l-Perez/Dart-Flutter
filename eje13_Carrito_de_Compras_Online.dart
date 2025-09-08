class Producto {
  String nombre;
  double precio;
  String categoria;
  int stock;

  Producto(this.nombre, this.precio, this.categoria, this.stock);

  @override
  String toString() {
    return "$nombre | Precio: \$${precio.toStringAsFixed(2)} | Categoría: $categoria | Stock: $stock";
  }
}

class Carrito {
  List<Map<String, dynamic>> _items = [];

  // Agregar producto al carrito
  void agregarProducto(Producto producto, int cantidad) {
    if (producto.stock >= cantidad) {
      _items.add({"producto": producto, "cantidad": cantidad});
      producto.stock -= cantidad;
      print("${producto.nombre} agregado al carrito (x$cantidad)");
    } else {
      print("Stock insuficiente para ${producto.nombre}");
    }
  }

  // Calcular el subtotal
  double calcularSubtotal() {
    return _items.fold(0, (sum, item) =>
      sum + (item["producto"].precio * item["cantidad"]));
  }

  // Calcular impuestos (IVA 19%)
  double calcularImpuestos() {
    return calcularSubtotal() * 0.19;
  }

  // Calcular total
  double calcularTotal() {
    return calcularSubtotal() + calcularImpuestos();
  }

  // Mostrar resumen del carrito
  void mostrarCarrito() {
    if (_items.isEmpty) {
      print("El carrito está vacío.");
      return;
    }

    print("\nCarrito de Compras:");
    for (var item in _items) {
      Producto p = item["producto"];
      int cantidad = item["cantidad"];
      print("- ${p.nombre} (x$cantidad) -> \$${(p.precio * cantidad).toStringAsFixed(2)}");
    }

    print("\n Subtotal: \$${calcularSubtotal().toStringAsFixed(2)}");
    print("IVA (19%): \$${calcularImpuestos().toStringAsFixed(2)}");
    print("Total: \$${calcularTotal().toStringAsFixed(2)}");
  }
}

void main() {
  // Crear algunos productos
  Producto p1 = Producto("Laptop", 3500.00, "Tecnología", 5);
  Producto p2 = Producto("Auriculares", 250.00, "Accesorios", 10);
  Producto p3 = Producto("Cafetera", 400.00, "Hogar", 3);

  // Mostrar productos disponibles
  print("Productos Disponibles:");
  print(p1);
  print(p2);
  print(p3);

  // Crear carrito
  Carrito carrito = Carrito();

  // Agregar productos al carrito
  carrito.agregarProducto(p1, 1);
  carrito.agregarProducto(p2, 2);
  carrito.agregarProducto(p3, 1);

  // Mostrar carrito con totales
  carrito.mostrarCarrito();
}
