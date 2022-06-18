import 'dart:typed_data';

class UserModel {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? paypal;
  int? age;
  String? password;
  String? userName;
  Uint8List? image;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.paypal,
    required this.age,
    required this.password,
    required this.userName,
    this.image,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    paypal = json['paypal'];
    age = json['age'];
    password = json['password'];
    userName = json['userName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['id'] = id;
    json['name'] = name;
    json['phone'] = phone;
    json['email'] = email;
    json['paypal'] = paypal;
    json['age'] = age;
    json['password'] = password;
    json['userName'] = userName;
    json['image'] = image;
    return json;
  }
}
