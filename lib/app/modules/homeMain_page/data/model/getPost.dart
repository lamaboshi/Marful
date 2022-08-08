import 'dart:convert';
import 'dart:typed_data';

import 'package:marful/app/modules/homeMain_page/data/model/Post.dart';

List<GetPost> getPostFromJson(String str) =>
    List<GetPost>.from(json.decode(str).map((x) => GetPost.fromJson(x)));

String getPostToJson(List<GetPost> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetPost {
  GetPost(
      {this.interaction,
      this.noInteraction,
      this.post,
      this.image,
      this.name,
      this.numberLike,
      this.numDislike});

  bool? interaction;
  bool? noInteraction;
  Post? post;
  String? name;
  double? numberLike;
  double? numDislike;
  Uint8List? image;
  factory GetPost.fromJson(Map<String, dynamic> json) => GetPost(
        interaction: json["interaction"],
        noInteraction: json["noInteraction"],
        numberLike: json["numberLike"],
        numDislike: json["numDislike"],
        name: json["name"],
        image: json['image'] == null
            ? null
            : Uint8List.fromList(
                List<int>.from(json['image']! as List<dynamic>)),
        post: json['post'] == null
            ? null
            : Post.fromJson(json['post'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "interaction": interaction,
        "noInteraction": noInteraction,
        "post": post,
        "image": image,
        "name": name
      };
}
