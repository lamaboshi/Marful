class Basket {
  int? id;
  double? totalPrice;
  int? productId;
  int? userPostId;

  Basket({
    this.id,
    this.totalPrice,
    this.productId,
    this.userPostId,
  });

  Basket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalPrice = json['totalPrice'];
    productId = json['productId'];
    userPostId = json['userPostId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id == null ? 0 : this.id;
    data['totalPrice'] = this.totalPrice;
    data['userPostId'] = this.userPostId;
    data['productId'] = this.productId;

    return data;
  }
}
