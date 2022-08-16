import 'package:marful/app/modules/websit_company/data/model/companycontent.dart';

import '../model/bascket.dart';
import '../model/company_dto.dart';

abstract class IWebsiteCompanyRepository {
  Future<CompanyDto> getdata();
  Future<List<CompanyContent>> getdatacompcontent();
  Future<bool> addBasket(Basket basket);
}
