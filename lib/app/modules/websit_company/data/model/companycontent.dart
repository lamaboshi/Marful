import 'package:marful/app/modules/websit_company/data/model/Content.dart';
import 'package:marful/app/modules/websit_company/data/model/company.dart';

import 'Content.dart';

class CompanyContent {
  int? id;
  Company? company;
  int? companyId;
  int? contentId;
  Content? content;

  CompanyContent({
    this.id,
    this.company,
    this.companyId,
    this.contentId,
    this.content,
  });

  CompanyContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company = json['company'] == null
        ? null
        : Company.fromJson(json['company'] as Map<String, dynamic>);
    companyId = json['companyId'];
    contentId = json['contentId'];
    content = Content.fromJson(json['content'] as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company'] = this.company;
    data['companyId'] = this.companyId;
    data['ContentId'] = this.contentId;
    data['Content'] = this.content;
    return data;
  }
}
