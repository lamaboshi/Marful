import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/chat_page/data/model/job.dart';

import 'adapter/chat_page_adapter.dart';

class ChatPageRepository extends IChatPageRepository {
  final _dio = Get.find<Dio>();
  @override
  Future<void> addJob(Job job) async {
    print(job.toJson());
    var result = await _dio.post(
      'https://localhost:7192/api/Job',
      data: job.toJson(),
    );
  }
}
