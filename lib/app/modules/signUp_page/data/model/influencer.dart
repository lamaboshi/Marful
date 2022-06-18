import 'dart:convert';

List<Influencer> influencerFromJson(String str) =>
    List<Influencer>.from(json.decode(str).map((x) => Influencer.fromJson(x)));

String influencerToJson(List<Influencer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Influencer {
  Influencer({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    required this.passeword,
    required this.phone,
    required this.paybal,
    this.image,
    required this.address,
    required this.description,
  });

   int id;
   String name;
   String userName;
   String email;
   String passeword;
   String phone;
   String paybal;
   String? image;
   String address;
   String description;

  factory Influencer.fromJson(Map<String, dynamic> json) => Influencer(
        id: json["Id"],
        name: json["Name"],
        userName: json["UserName"],
        email: json["Email"],
        passeword: json["Passeword"],
        phone: json["Phone"],
        paybal: json["Paybal"],
        image: json["Image"],
        address: json["Address"],
        description: json["Description"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "UserName": userName,
        "Email": email,
        "Passeword": passeword,
        "Phone": phone,
        "Paybal": paybal,
        "Image": image,
        "Address": address,
        "Description": description,
      };
}
