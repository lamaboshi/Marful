
import 'dart:convert';

import 'package:marful/app/modules/homeMain_page/data/model/Post.dart';

List<GetPost> getPostFromJson(String str) => List<GetPost>.from(json.decode(str).map((x) => GetPost.fromJson(x)));

String getPostToJson(List<GetPost> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetPost {
  GetPost({this.interaction, this.noInteraction, this.post});

  final bool? interaction;
  final bool? noInteraction;
  final Post? post;

  factory GetPost.fromJson(Map<String, dynamic> json) => GetPost(
        interaction: json["Interaction"],
        noInteraction: json["NoInteraction"],
        post: json["Post"],
      );

  Map<String, dynamic> toJson() => {
        "Interaction": interaction,
        "NoInteraction": noInteraction,
        "Post": post,
      };
}
