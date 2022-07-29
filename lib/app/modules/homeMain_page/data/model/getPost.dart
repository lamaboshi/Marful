import 'dart:convert';
import 'dart:typed_data';

import 'package:marful/app/modules/homeMain_page/data/model/Post.dart';

List<GetPost> getPostFromJson(String str) =>
    List<GetPost>.from(json.decode(str).map((x) => GetPost.fromJson(x)));

String getPostToJson(List<GetPost> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetPost {
  GetPost(
      {this.interaction, this.noInteraction, this.post, this.image, this.name});

  bool? interaction;
  bool? noInteraction;
  Post? post;
  String? name;
  Uint8List? image;
  factory GetPost.fromJson(Map<String, dynamic> json) => GetPost(
        interaction: json["interaction"],
        noInteraction: json["noInteraction"],
        name: json["name"],
        image: json["image"] == null ? null : json["image"],
        post: Post.fromJson(json["post"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "interaction": interaction,
        "noInteraction": noInteraction,
        "post": post,
        "image": image,
        "name": name
      };
}
