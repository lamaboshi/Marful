class PostInfulonser {
  PostInfulonser({this.id, this.infulonserId, this.interaction, this.postId});

  int? id;
  bool? interaction;
  int? postId;
  int? infulonserId;
  factory PostInfulonser.fromJson(Map<String, dynamic> json) => PostInfulonser(
      id: json["id"],
      interaction: json["interaction"],
      postId: json["postId"],
      infulonserId: json["infulonserId"]);

  Map<String, dynamic> toJson() => {
        "id": id == null ? 0 : id,
        "interaction": interaction,
        "postId": postId == null ? null : postId,
        "infulonserId": infulonserId == null ? null : infulonserId,
      };
}
