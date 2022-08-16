class CompanyTypeModel {
  int? id;
  String? type;
  String? password;
  int? companyId;

  CompanyTypeModel({this.id, this.type, this.password, this.companyId});

  CompanyTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    password = json['password'];
    companyId = json['companyId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['id'] = id == null ? 0 : id;
    json['type'] = type;
    json['password'] = password;
    json['companyId'] = companyId;
    return json;
  }
}
