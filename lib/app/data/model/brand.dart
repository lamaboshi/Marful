class Brand {
  int? id;
  String? name;
  String? description;
  int? infulonserId;
  int? companyContentId;
  Brand(
      {this.id,
      this.description,
      this.name,
      this.infulonserId,
      this.companyContentId});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    infulonserId = json['infulonserId'];
    companyContentId = json['companyContentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['id'] = id;
    json['name'] = name;
    json['description'] = description;
    json['infulonserId'] = infulonserId == null ? null : infulonserId;
    json['companyContentId'] =
        companyContentId == null ? null : companyContentId;
    return json;
  }
}
