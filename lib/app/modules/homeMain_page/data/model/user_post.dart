class PostUser {
  PostUser({this.id, this.userId, this.interaction, this.postId});

  int? id;
  bool? interaction;
  int? postId;
  int? userId;
  factory PostUser.fromJson(Map<String, dynamic> json) => PostUser(
      id: json["id"],
      interaction: json["interaction"],
      postId: json["postId"],
      userId: json["userId"]);

  Map<String, dynamic> toJson() => {
        "id": id == null ? 0 : id,
        "interaction": interaction,
        "postId": postId == null ? null : postId,
        "userId": userId == null ? null : userId,
      };
}