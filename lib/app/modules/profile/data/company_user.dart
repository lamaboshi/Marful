import 'package:marful/app/data/model/company.dart';
import 'package:marful/app/data/model/user_model.dart';

class UserCompany {
  int? id;
  Company? company;
  int? companyId;
  int? userId;
  UserModel? user;

  UserCompany({
    this.id,
    this.company,
    this.companyId,
    this.userId,
    this.user,
  });

  UserCompany.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company = json['company'] == null
        ? null
        : Company.fromJson(json['company'] as Map<String, dynamic>);
    companyId = json['companyId'];
    userId = json['userId'];
    user = json['user'] == null
        ? null
        : UserModel.fromJson(json['user'] as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id == null ? 0 : this.id;
    data['company'] = this.company;
    data['companyId'] = this.companyId;
    data['userId'] = this.userId;
    data['user'] = this.user;
    return data;
  }
}
