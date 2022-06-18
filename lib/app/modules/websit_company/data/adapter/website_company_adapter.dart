import 'package:marful/app/modules/websit_company/data/model/company.dart';

import '../model/Product.dart';

abstract class IWebsiteCompanyRepository {
  Future<List<Product>> getdata();
   Future<List<Company>> getdatacompany();
}
