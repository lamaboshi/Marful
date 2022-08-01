import 'dart:convert';
import 'dart:typed_data';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post(
      {this.id,
      this.description,
      this.brandId,
      this.jobId,
      this.image,
      this.dateTime,
      this.infulonserId});

  int? id;
  String? description;
  DateTime? dateTime;
  int? brandId;
  int? jobId;
  Uint8List? image;
  int? infulonserId;
  factory Post.fromJson(Map<String, dynamic> json) => Post(
      id: json["id"],
      description: json["description"],
      dateTime: DateTime.parse(json["dateTime"].toString()),
      brandId: json["brandId"],
      infulonserId: json["infulonserId"],
      jobId: json["jobId"],
      image: json['image'] == null ? null : json['image']);

  Map<String, dynamic> toJson() => {
        "id": id == null ? 0 : id,
        "description": description,
        "dateTime": dateTime == null ? null : dateTime!.toIso8601String(),
        "brandId": brandId == null ? null : brandId,
        "jobId": jobId == null ? null : jobId,
        "infulonserId": infulonserId == null ? null : infulonserId,
        "image": image == null ? null : image,
      };
}
