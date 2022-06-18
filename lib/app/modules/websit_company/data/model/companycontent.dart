import 'package:marful/app/modules/websit_company/data/model/Content.dart';
import 'package:marful/app/modules/websit_company/data/model/company.dart';

import 'Content.dart';


class CompanyContent {
  int? id;
  Company?company;
  int? companyId;
  int?  ContentId;
  Content?content;

 CompanyContent({
    this.id,
    this.company,
    this.companyId,
    this.ContentId,
    this.content,
  });

 CompanyContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  company = json['company'];
    companyId = json['companyId'];
  ContentId = json['ContentId'];
 content= json['Content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company'] = this.company;
    data['companyId'] = this.companyId;
    data['ContentId'] = this.ContentId;
     data['Content'] = this.content;
    return data;
  }
}