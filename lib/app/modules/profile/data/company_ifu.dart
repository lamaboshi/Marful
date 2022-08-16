import 'package:marful/app/data/model/infulonser.dart';

import '../../../data/model/company.dart';

class CompanyInfulonser {
  int? id;
  String? followed;
  Company? company;
  int? companyId;
  int? infulonserId;
  Infulonser? infulonser;

  CompanyInfulonser({
    this.id,
    this.company,
    this.companyId,
    this.infulonserId,
    this.infulonser,
    this.followed,
  });

  CompanyInfulonser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    followed = json['followed'];
    company = json['company'] == null
        ? null
        : Company.fromJson(json['company'] as Map<String, dynamic>);
    companyId = json['companyId'];
    infulonserId = json['infulonserId'];
    infulonser = json['infulonser'] == null
        ? null
        : Infulonser.fromJson(json['infulonser'] as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id == null ? 0 : this.id;
    data['followed'] = this.followed;
    data['company'] = this.company;
    data['companyId'] = this.companyId;
    data['infulonserId'] = this.infulonserId;
    data['infulonser'] = this.infulonser;
    return data;
  }
}
