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
  });

  final int? id;
  final String? description;
  final int? brandId;
  final int? jobId;
  Uint8List? image;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      id: json["Id"],
      description: json["Description"],
      brandId: json["BrandId"],
      jobId: json["jobId"],
      image: json['image'] == null ? null : json['image']);

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Description": description,
        "BrandId": brandId,
        "jobId": jobId,
        "image": image,
      };
}
