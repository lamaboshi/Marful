import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/data/model/user_model.dart';

class InfulonserUser {
  int? id;
  Infulonser? infulonser;
  int? infulonserId;
  int? userId;
  UserModel? user;

  InfulonserUser({
    this.id,
    this.infulonser,
    this.infulonserId,
    this.userId,
    this.user,
  });

  InfulonserUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    infulonser = json['infulonser'] == null
        ? null
        : Infulonser.fromJson(json['infulonser'] as Map<String, dynamic>);
    infulonserId = json['infulonserId'];
    userId = json['userId'];
    user = json['user'] == null
        ? null
        : UserModel.fromJson(json['user'] as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id == null ? 0 : this.id;
    data['infulonser'] = this.infulonser;
    data['infulonserId'] = this.infulonserId;
    data['userId'] = this.userId;
    data['user'] = this.user;
    return data;
  }
}
