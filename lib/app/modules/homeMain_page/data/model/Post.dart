import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
    Post({
         this.name,
         this.picture,
         this.post,
         this.postImage,
    });

    final String? name;
    final String? picture;
    final String? post;
    final String? postImage;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        name: json["Name"],
        picture: json["Picture"],
        post: json["Post"],
        postImage: json["PostImage"],
    );

    Map<String, dynamic> toJson() => {
        "Name": name,
        "Picture": picture,
        "Post": post,
        "PostImage": postImage,
    };
}
