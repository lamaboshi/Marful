import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:marful/app/data/model/brand.dart';
import 'package:marful/app/modules/chat_page/data/model/job.dart';

import '../../../websit_company/data/model/companycontent.dart';
import 'adapter/chat_page_adapter.dart';

class ChatPageRepository extends IChatPageRepository {
  final _dio = Get.find<Dio>();
  @override
  Future<void> addJob(Job job) async {
    print(job.toJson());
    var result = await _dio.post(
      'https://localhost:7192/api/Job/AddJob',
      data: job.toJson(),
    );
  }

  @override
  Future<List<Brand>> getAllBrand(int idCompanyContent) async {
    var result = await _dio.get(
        'https://localhost:7192/api/Company/GetAllBarndCompany/$idCompanyContent');
    print(result);
    var list = <Brand>[];
    for (var item in result.data) {
      list.add(Brand.fromJson(item));
    }
    return list;
  }

  @override
  Future<List<CompanyContent>> getCompanyConent(int idCompany) async {
    var result =
        await _dio.get('https://localhost:7192/api/CompanyContent/$idCompany');
    print(result);
    var list = <CompanyContent>[];
    for (var item in result.data) {
      list.add(CompanyContent.fromJson(item));
    }
    return list;
  }
}
