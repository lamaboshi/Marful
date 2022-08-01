import 'dart:convert';
import 'dart:typed_data';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    this.id,
    this.description,
    this.brandId,
    this.jobId,
    this.image,
    this.dateTime,
  });

  int? id;
  String? description;
  DateTime? dateTime;
  int? brandId;
  int? jobId;
  Uint8List? image;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      id: json["id"],
      description: json["description"],
      dateTime: DateTime.parse(json["dateTime"].toString()),
      brandId: json["brandId"],
      jobId: json["jobId"],
      image: json['image'] == null ? null : json['image']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "dateTime": dateTime,
        "brandId": brandId,
        "jobId": jobId,
        "image": image == null ? null : image,
      };
}
