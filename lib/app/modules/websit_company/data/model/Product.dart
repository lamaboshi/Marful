import 'dart:io';

class Product {
  int? id;
  String? name;
  int? price;
  String? description;
  File? image;
  String? code;
  int? brandId;

  Product({
    this.id,
    this.name,
    this.price,
    this.description,
    this.image,
    this.code,
    this.brandId,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    image = json['image'];
    code = json['code'];
    brandId = json['brandId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['image'] = this.image;
    data['code'] = this.code;
    data['brandId'] = this.brandId;
    return data;
  }
}
