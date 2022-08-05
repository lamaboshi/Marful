import 'dart:io';

import 'package:marful/app/data/model/userpost.dart';
import 'package:marful/app/modules/websit_company/data/model/Product.dart';

class  Basket {
  int? id;
  double? TotalPrice;
  int?ProductId ;
  int?UserPostId;
  Product? product;
  UserPost?userPost;

  Basket({
    this.id,
    this.TotalPrice,
    this.ProductId,
    this.UserPostId,
    this.product,
   this.userPost,
  });

Basket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    TotalPrice = json['TotalPrice'];
   ProductId = json['ProductId'];
  UserPostId = json['UserPostId'];
  product = json['product'];
   userPost = json['userPost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data[' TotalPrice'] = this. TotalPrice;
    data[' ProductId'] = this. ProductId;
    data['  UserPostId '] = this.  UserPostId ;
    data[' product'] = this. product;
    data['  userPost'] = this.  userPost;
    return data;
  }
}