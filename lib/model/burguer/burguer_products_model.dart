class BurguerProductsModel {
  num? id;
  String? name;
  List<Images>? images;
  String? desc;
  List<Ingredients>? ingredients;
  num? price;
  bool? veg;

  BurguerProductsModel(
      {this.id,
      this.name,
      this.images,
      this.desc,
      this.ingredients,
      this.price,
      this.veg});

  BurguerProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    desc = json['desc'];
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(Ingredients.fromJson(v));
      });
    }
    price = json['price'];
    veg = json['veg'];
  }
 
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['desc'] = desc;
    if (ingredients != null) {
      data['ingredients'] = ingredients!.map((v) => v.toJson()).toList();
    }
    data['price'] = price;
    data['veg'] = veg;
    return data;
  }
}

class Images {
  String? sm;
  String? lg;

  Images({this.sm, this.lg});

  Images.fromJson(Map<String, dynamic> json) {
    sm = json['sm'];
    lg = json['lg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sm'] = sm;
    data['lg'] = lg;
    return data;
  }
}

class Ingredients {
  num? id;
  String? name;
  String? img;

  Ingredients({this.id, this.name, this.img});

  Ingredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['img'] = img;
    return data;
  }
}
