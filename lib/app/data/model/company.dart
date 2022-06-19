import 'dart:typed_data';

class Company {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? address;
  String? password;
  String? telePhone;
  Uint8List? image;
  String? description;

  Company({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.password,
    required this.telePhone,
    required this.image,
    required this.description,
  });

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    password = json['password'];
    telePhone = json['telePhone'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['id'] = id;
    json['name'] = name;
    json['phone'] = phone;
    json['email'] = email;
    json['address'] = address;
    json['password'] = password;
    json['telePhone'] = telePhone;
    json['description'] = description;
    json['image'] = image;
    return json;
  }
}
