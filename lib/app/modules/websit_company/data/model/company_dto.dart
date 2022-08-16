import 'package:marful/app/data/model/brand.dart';
import 'package:marful/app/data/model/company.dart';
import 'package:marful/app/modules/websit_company/data/model/Product.dart';

import 'companycontent.dart';

class CompanyDto {
  Company? company;
  List<Product>? products;
  List<CompanyContent>? companyContents;
  List<Brand>? brands;
  CompanyDto({this.products, this.company, this.brands, this.companyContents});

  CompanyDto.fromJson(Map<String, dynamic> json) {
    company = json['company'] == null
        ? null
        : Company.fromJson(json['company'] as Map<String, dynamic>);
    products = json["products"] == null
        ? []
        : List<Product>.from((json["products"] as Iterable)
            .map((x) => Product.fromJson(x as Map<String, dynamic>)));
    companyContents = json["companyContents"] == null
        ? []
        : List<CompanyContent>.from((json["companyContents"] as Iterable)
            .map((x) => CompanyContent.fromJson(x as Map<String, dynamic>)));
    brands = json["brands"] == null
        ? []
        : List<Brand>.from((json["brands"] as Iterable)
            .map((x) => Brand.fromJson(x as Map<String, dynamic>)));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company'] = this.company;
    data["products"] =
        products == null ? [] : List.from(products!.map((x) => x.toJson()));
    data["brands"] =
        brands == null ? [] : List.from(brands!.map((x) => x.toJson()));
    data["companyContents"] = companyContents == null
        ? []
        : List.from(companyContents!.map((x) => x.toJson()));
    return data;
  }
}
