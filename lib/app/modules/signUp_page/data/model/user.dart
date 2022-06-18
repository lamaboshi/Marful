import 'dart:convert';

List<User> commentsFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String commentsToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.userId,
    required this.name,
    required this.userName,
    required this.email,
    required this.passeword,
    required this.phone,
    required this.age,
    required this.baybal,
    required this.location,
    this.image,
  });
  String? image;
  int userId;
  String name;
  String userName;
  String age;
  String phone;
  String email;
  String passeword;
  String location;
  String baybal;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["userId"],
        name: json["Name"],
        userName: json["UserName"],
        email: json["Email"],
        passeword: json["Passeword"],
        phone: json["Phone"],
        age: json["Age"],
        location: json["Location"],
        baybal: json["Baybal"],
        image: json["Image"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "Name": name,
        "UserName": userName,
        "Email": email,
        "Passeword": passeword,
        "Phone": phone,
        "Age": age,
        "Address": location,
        "Baybal": baybal,
        "Image": image,
      };
}
