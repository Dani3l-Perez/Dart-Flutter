// Clase Cliente
class Cliente {
  String nombre;
  String direccion;
  String telefono;

  Cliente(this.nombre, this.direccion, this.telefono);

  @override
  String toString() {
    return "Cliente: $nombre | Dirección: $direccion | Tel: $telefono";
  }
}

// Clase Producto
class Producto {
  String nombre;
  double precio;

  Producto(this.nombre, this.precio);

  @override
  String toString() {
    return "$nombre (\$${precio.toStringAsFixed(2)})";
  }
}

// Clase Pedido
class Pedido {
  Cliente cliente;
  List<Producto> productos;
  double costoEnvio;
  int tiempoEntrega; // en minutos

  Pedido(this.cliente, this.productos, this.costoEnvio, this.tiempoEntrega);

  // Calcular total del pedido
  double calcularTotal() {
    double subtotal = productos.fold(0, (suma, p) => suma + p.precio);
    return subtotal + costoEnvio;
  }

  // Mostrar detalles del pedido
  void mostrarDetalles() {
    print("\nPedido:");
    print(cliente);
    print("Productos:");
    for (var p in productos) {
      print("   - $p");
    }
    print("Costo de envío: \$${costoEnvio.toStringAsFixed(2)}");
    print("Tiempo estimado: $tiempoEntrega min");
    print("Total: \$${calcularTotal().toStringAsFixed(2)}");
  }
}

void main() {
  // Crear clientes
  Cliente c1 = Cliente("Ana López", "Calle 10 #5-30", "3214567890");
  Cliente c2 = Cliente("Carlos Pérez", "Carrera 8 #12-45", "3109876543");

  // Crear productos
  Producto p1 = Producto("Pizza", 35000);
  Producto p2 = Producto("Refresco", 5000);
  Producto p3 = Producto("Hamburguesa", 28000);

  // Crear pedidos
  Pedido pedido1 = Pedido(c1, [p1, p2], 8000, 40);
  Pedido pedido2 = Pedido(c2, [p3, p2, p2], 10000, 55);

  // Mostrar detalles
  print("=== Sistema de Entregas a Domicilio ===");
  pedido1.mostrarDetalles();
  pedido2.mostrarDetalles();
}
