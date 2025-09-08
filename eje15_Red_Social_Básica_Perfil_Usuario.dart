// Clase Publicacion
class Publicacion {
  String contenido;
  int likes;
  DateTime fecha;

  Publicacion(this.contenido)
      : likes = 0,
        fecha = DateTime.now();

  void darLike() {
    likes++;
  }

  @override
  String toString() {
    return " \"$contenido\" |  $likes | ${fecha.toLocal()}";
  }
}

// Clase Usuario
class Usuario {
  String nombre;
  String username;
  List<Usuario> seguidores = [];
  List<Usuario> siguiendo = [];
  List<Publicacion> publicaciones = [];

  Usuario(this.nombre, this.username);

  // Seguir a otro usuario
  void seguir(Usuario otro) {
    if (!siguiendo.contains(otro)) {
      siguiendo.add(otro);
      otro.seguidores.add(this);
    }
  }

  // Crear publicación
  void publicar(String contenido) {
    publicaciones.add(Publicacion(contenido));
  }

  // Mostrar perfil
  void mostrarPerfil() {
    print("\n👤 Perfil de @$username - $nombre");
    print("👥 Seguidores: ${seguidores.length} | Siguiendo: ${siguiendo.length}");
    print("📌 Publicaciones:");
    if (publicaciones.isEmpty) {
      print("   (sin publicaciones)");
    } else {
      for (var p in publicaciones) {
        print("   - $p");
      }
    }
  }
}

void main() {
  print("===Red Social Básica ===");

  // Crear usuarios
  Usuario u1 = Usuario("Ana López", "ana123");
  Usuario u2 = Usuario("Carlos Pérez", "carlitos");
  Usuario u3 = Usuario("María Gómez", "maria_g");

  // Relaciones de seguidores
  u1.seguir(u2);
  u2.seguir(u3);
  u3.seguir(u1);

  // Publicaciones
  u1.publicar("¡Hola a todos en la red social!");
  u2.publicar("Aprendiendo Dart");
  u3.publicar("Me encanta programar");

  // Dar likes
  u2.publicaciones[0].darLike();
  u2.publicaciones[0].darLike();
  u3.publicaciones[0].darLike();

  // Mostrar perfiles
  u1.mostrarPerfil();
  u2.mostrarPerfil();
  u3.mostrarPerfil();
}
