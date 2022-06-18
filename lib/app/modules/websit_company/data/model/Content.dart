import 'package:marful/app/modules/websit_company/data/model/company.dart';

class Content {
  int? id;
  String?name;
  String?Description;

   Content({
    this.id,
    this.name,
    this.Description,

    
  });

   Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  name = json['name'];
    Description = json['Description'];
 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data[' name '] = this. name ;
    data['Description'] = this.Description;
     
    return data;
  }
}