import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:marful/app/data/model/infulonser.dart';

import 'adapter/influencer_adapter.dart';

class InfluencerRepository extends IInfluencerRepository {
  final _dio = Get.find<Dio>();
  @override
  Future<bool> regierterInfluencer(Infulonser object) async {
    var data = await _dio.post(
      'https://localhost:7192/api/Infulonser/AddInfulonser',
      data: jsonEncode(object.toJson()),
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
    );
    if (data.statusCode == 200) {
      return true;
    } else {
      print(data.statusMessage);
    }
    return false;
  }
}
