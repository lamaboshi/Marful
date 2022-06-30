import 'package:marful/app/modules/websit_company/data/model/company.dart';
import 'package:marful/app/modules/websit_company/data/model/companycontent.dart';

import '../model/Product.dart';

abstract class IWebsiteCompanyRepository {
  Future<List<Product>> getdata();
   Future<Company> getdatacompany(int id);
      Future<List<CompanyContent>> getdatacompcontent();

}
