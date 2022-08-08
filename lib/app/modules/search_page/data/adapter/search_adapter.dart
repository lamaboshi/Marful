import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/data/model/user_model.dart';
import 'package:marful/app/modules/websit_company/data/model/Product.dart';

import '../../../../data/model/brand.dart';
import '../../../../data/model/company.dart';
import '../../../../data/model/content.dart';

abstract class ISearchRepository {
  Future<Infulonser>getInfulonserSearch(String name);
   Future<Company>getCompanySearch(String name);
    Future<Brand>getBrandSearch(String name);
    Future<Product>getProductSearch(String name);
    Future<Content>getContentSearch(String name);
}