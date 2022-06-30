import 'dart:typed_data';

class Infulonser {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? paypal;
  String? address;
  String? password;
  String? userName;
  Uint8List? image;
  String? description;

  Infulonser({
     this.id,
     this.name,
     this.phone,
     this.email,
     this.paypal,
     this.address,
     this.password,
     this.userName,
     this.image,
     this.description,
  });

  Infulonser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    paypal = json['paypal'];
    address = json['address'];
    password = json['password'];
    userName = json['userName'];
    description = json['description'];
    image = json['image'] == null ? null : json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['id'] = id;
    json['name'] = name;
    json['phone'] = phone;
    json['email'] = email;
    json['paypal'] = paypal;
    json['address'] = address;
    json['password'] = password;
    json['userName'] = userName;
    json['description'] = description;
    json['image'] = image;
    return json;
  }
}
