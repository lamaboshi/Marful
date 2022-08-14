import 'package:marful/app/data/model/brand.dart';
import 'package:marful/app/modules/chat_page/data/model/job.dart';

import '../../../../websit_company/data/model/companycontent.dart';

abstract class IChatPageRepository {
  Future<void> addJob(Job job);
  Future<List<Brand>> getAllBrand(int idCompany);
  Future<List<CompanyContent>> getCompanyConent(int idCompany);
}
