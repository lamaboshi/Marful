import 'dart:io';

import 'package:marful/app/data/model/user_model.dart';
import 'package:marful/app/modules/homeMain_page/data/model/Post.dart';
import 'package:marful/app/modules/websit_company/data/model/Product.dart';

class   UserPost {
  int? id;
  bool?  InterAction;
  UserModel?userModel;
  int?userModelId ;
  int?postId;
  Post?post;


  UserPost({
    this.id,
    this. InterAction,
    this.userModel,
    this.userModelId,
    this.postId,
    this.post,
   
  });

 UserPost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
   InterAction= json[' InterAction'];
  userModel= json[' userModel'];
  userModelId = json['userModelId'];
 postId = json['postId'];
  post = json['post'];
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['  InterAction'] = this. InterAction;
    data[' userModel'] = this. userModel;
    data['  userModelId '] = this.  userModelId ;
    data['postId'] = this.postId;
    data['post'] = this.post;
    return data;
  }
}