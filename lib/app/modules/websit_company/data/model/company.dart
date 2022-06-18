import 'dart:io';

class Company {
  int? id;
  String? name;
   String? Email;
  String?Phone;
  String?Password;
  String?TelePhone;
  String?Address;
  String? Description;
  File? image;

  Company({
    this.id,
    this.name,
    this.Email,
    this.Phone,
    this.Password,
    this.TelePhone,
    this.Description,
    this.image,
  });

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    Email = json['Email'];
    Description = json['Description'];
    image = json['image'];
   Password = json['Password'];
    Phone = json['Phone'];
      TelePhone = json['TelePhone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['Email'] = this.Email;
    data['Description'] = this.Description;
    data['image'] = this.image;
    data['Phone'] = this.Phone;
    data['Password'] = this.Password;
    data[' TelePhone'] = this. TelePhone;
    return data;
  }
}