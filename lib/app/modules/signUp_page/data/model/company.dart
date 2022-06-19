import 'dart:convert';

List<Company> companyFromJson(String str) =>
    List<Company>.from(json.decode(str).map((x) => Company.fromJson(x)));

String companyToJson(List<Company> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Company {
  Company({
    
    required this.name,
    required this.email,
    required this.passeword,
    required this.phone,
    required this.telePhone,
    this.image,
    required this.address,
    required this.description,
  });


   String name;
   String email;
   String passeword;
   String phone;
   String telePhone;
   String? image;
   String address;
   String description;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
     
        name: json["Name"],
        email: json["Email"],
        passeword: json["Passeword"],
        phone: json["Phone"],
        telePhone: json["TelePhone"],
        image: json["Image"],
        address: json["Address"],
        description: json["Description"],
      );

  Map<String, dynamic> toJson() => {
        
        "Name": name,
        "Email": email,
        "Passeword": passeword,
        "Phone": phone,
        "TelePhone": telePhone,
        "Image": image,
        "Address": address,
        "Description": description,
      };
}
