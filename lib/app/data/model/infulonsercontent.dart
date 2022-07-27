import 'package:marful/app/data/model/infulonser.dart';


import 'Content.dart';
import 'infulonser.dart';


class InfulonserContent{
  int? id;
  Infulonser?infulonser;
  int? InfulonserId ;
  int?  ContentId;
  Content?content;

InfulonserContent({
    this.id,
    this.infulonser,
    this.InfulonserId,
    this.ContentId,
    this.content,
  });

InfulonserContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
infulonser = json['Infulonser'];
   InfulonserId = json['InfulonserId '];
  ContentId = json['ContentId'];
 content= json['Content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Infulonser '] = this.infulonser ;
    data['InfulonserId '] = this.InfulonserId ;
    data['ContentId'] = this.ContentId;
     data['Content'] = this.content;
    return data;
  }
}