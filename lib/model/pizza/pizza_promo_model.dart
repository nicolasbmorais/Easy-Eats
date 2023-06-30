class PizzaPromoModel {
  PizzaPromoModel({
    required this.ok,
    required this.mensaje,
    required this.promo,
  });
  late final bool ok;
  late final String mensaje;
  late final List<Promo> promo;

  PizzaPromoModel.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    mensaje = json['mensaje'];
    promo = List.from(json['promo']).map((e) => Promo.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ok'] = ok;
    data['mensaje'] = mensaje;
    data['promo'] = promo.map((e) => e.toJson()).toList();
    return data;
  }
}

class Promo {
  Promo({
    required this.id,
    required this.nombrePromo,
    required this.descripcion,
    required this.precioFinal,
    required this.sucursal,
    required this.linkImagen,
    required this.fechaInicio,
    required this.fechaCaducidad,
    required this.borrado,
    required this.tags,
  });
  late final int id;
  late final String nombrePromo;
  late final String descripcion;
  late final String precioFinal;
  late final int sucursal;
  late final String linkImagen;
  late final String fechaInicio;
  late final String fechaCaducidad;
  late final int borrado;
  late final List<String> tags;

  Promo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombrePromo = json['nombrePromo'];
    descripcion = json['descripcion'];
    precioFinal = json['precioFinal'];
    sucursal = json['sucursal'];
    linkImagen = json['linkImagen'];
    fechaInicio = json['fechaInicio'];
    fechaCaducidad = json['fechaCaducidad'];
    borrado = json['borrado'];
    tags = json['tags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nombrePromo'] = nombrePromo;
    data['descripcion'] = descripcion;
    data['precioFinal'] = precioFinal;
    data['sucursal'] = sucursal;
    data['linkImagen'] = linkImagen;
    data['fechaInicio'] = fechaInicio;
    data['fechaCaducidad'] = fechaCaducidad;
    data['borrado'] = borrado;
    data['tags'] = tags;
    return data;
  }
}
