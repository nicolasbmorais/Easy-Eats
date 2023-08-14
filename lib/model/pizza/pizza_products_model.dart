class PizzaProductsModel {
  String? mensaje;
  bool? ok;
  List<Products>? productos;

  PizzaProductsModel({this.mensaje, this.ok, this.productos});

  PizzaProductsModel.fromJson(Map<String, dynamic> json) {
    mensaje = json['mensaje'];
    ok = json['ok'];
    if (json['productos'] != null) {
      productos = <Products>[];
      json['productos'].forEach((v) {
        productos!.add(Products.fromJson(v));
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

class Products {
  int? id;
  String? name;
  String? description;
  String? linkImagen;
  String? price;
  String? tax;
  int? sold;
  int? erased;
  int? stockRequired;
  String? createdAt;

  Products(
      {this.id,
      this.name,
      this.description,
      this.linkImagen,
      this.price,
      this.tax,
      this.sold,
      this.erased,
      this.stockRequired,
      this.createdAt});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['nombre'];
    description = json['descripcion'];
    linkImagen = json['linkImagen'];
    price = json['precio'];
    tax = json['tasaIva'];
    sold = json['vendible'];
    erased = json['borrado'];
    stockRequired = json['stockRequerido'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nombre'] = name;
    data['descripcion'] = description;
    data['linkImagen'] = linkImagen;
    data['precio'] = price;
    data['tasaIva'] = tax;
    data['vendible'] = sold;
    data['borrado'] = erased;
    data['stockRequerido'] = stockRequired;
    data['created_at'] = createdAt;
    return data;
  }
}
