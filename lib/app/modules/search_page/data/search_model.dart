import 'package:marful/app/data/model/brand.dart';
import 'package:marful/app/data/model/company.dart';
import 'package:marful/app/data/model/content.dart';
import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/modules/websit_company/data/model/Product.dart';

class SearchModel {
  String? type;
  List<dynamic>? search;

  SearchModel({
    this.type,
    this.search,
  });

  SearchModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['type'] == 'brand') {
      search = json['search'] == null
          ? null
          : List<Brand>.from((json["search"] as Iterable)
              .map((x) => Brand.fromJson(x as Map<String, dynamic>)));
    } else if (json['type'] == 'product') {
      search = json['search'] == null
          ? null
          : List<Product>.from((json["search"] as Iterable)
              .map((x) => Product.fromJson(x as Map<String, dynamic>)));
    } else if (json['type'] == 'company') {
      search = json['search'] == null
          ? null
          : List<Company>.from((json["search"] as Iterable)
              .map((x) => Company.fromJson(x as Map<String, dynamic>)));
    } else if (json['type'] == 'infulonser') {
      search = json['search'] == null
          ? null
          : List<Infulonser>.from((json["search"] as Iterable)
              .map((x) => Infulonser.fromJson(x as Map<String, dynamic>)));
    } else if (json['type'] == 'content') {
      search = json['search'] == null
          ? null
          : List<Content>.from((json["search"] as Iterable)
              .map((x) => Content.fromJson(x as Map<String, dynamic>)));
    }
  }
}
