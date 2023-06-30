class PizzaProductsModel {
  String? mensaje;
  bool? ok;
  List<Productos>? productos;

  PizzaProductsModel({this.mensaje, this.ok, this.productos});

  PizzaProductsModel.fromJson(Map<String, dynamic> json) {
    mensaje = json['mensaje'];
    ok = json['ok'];
    if (json['productos'] != null) {
      productos = <Productos>[];
      json['productos'].forEach((v) {
        productos!.add(Productos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mensaje'] = mensaje;
    data['ok'] = ok;
    if (productos != null) {
      data['productos'] = productos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Productos {
  int? id;
  String? nombre;
  String? descripcion;
  String? linkImagen;
  String? precio;
  String? tasaIva;
  int? vendible;
  int? borrado;
  int? stockRequerido;
  String? createdAt;

  Productos(
      {this.id,
      this.nombre,
      this.descripcion,
      this.linkImagen,
      this.precio,
      this.tasaIva,
      this.vendible,
      this.borrado,
      this.stockRequerido,
      this.createdAt});

  Productos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    descripcion = json['descripcion'];
    linkImagen = json['linkImagen'];
    precio = json['precio'];
    tasaIva = json['tasaIva'];
    vendible = json['vendible'];
    borrado = json['borrado'];
    stockRequerido = json['stockRequerido'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nombre'] = nombre;
    data['descripcion'] = descripcion;
    data['linkImagen'] = linkImagen;
    data['precio'] = precio;
    data['tasaIva'] = tasaIva;
    data['vendible'] = vendible;
    data['borrado'] = borrado;
    data['stockRequerido'] = stockRequerido;
    data['created_at'] = createdAt;
    return data;
  }
}
