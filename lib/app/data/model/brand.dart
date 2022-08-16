import 'dart:typed_data';

class Brand {
  int? id;
  String? name;
  String? description;
  int? infulonserId;
  int? companyContentId;
  Uint8List? image;
  Brand(
      {this.id,
      this.description,
      this.name,
      this.infulonserId,
      this.image,
      this.companyContentId});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    infulonserId = json['infulonserId'];
    companyContentId = json['companyContentId'];
    image = json['image'] == null
        ? null
        : Uint8List.fromList(List<int>.from(json['image']!));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['id'] = id == null ? 0 : id;
    json['name'] = name;
    json['description'] = description;
    json['image'] = image == null ? null : Uint8List.fromList(image!);
    json['InfulonserId'] = infulonserId == null ? null : infulonserId;
    json['companyContentId'] =
        companyContentId == null ? null : companyContentId;
    return json;
  }
}
