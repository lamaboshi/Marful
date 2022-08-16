import 'package:marful/app/data/model/infulonser.dart';

class InfulonserFollowInfulonser {
  int? id;
  Infulonser? follow;
  int? followId;
  int? followedId;
  Infulonser? followed;

  InfulonserFollowInfulonser({
    this.id,
    this.follow,
    this.followId,
    this.followedId,
    this.followed,
  });

  InfulonserFollowInfulonser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    follow = json['follow'] == null
        ? null
        : Infulonser.fromJson(json['follow'] as Map<String, dynamic>);
    followId = json['followId'];
    followedId = json['followedId'];
    followed = json['followed'] == null
        ? null
        : Infulonser.fromJson(json['followed'] as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id == null ? 0 : this.id;
    data['follow'] = this.follow;
    data['followId'] = this.followId;
    data['followedId'] = this.followedId;
    data['followed'] = this.followed;
    return data;
  }
}
