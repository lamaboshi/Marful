import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:marful/app/data/model/brand.dart';
import 'package:marful/app/data/model/Content.dart';

import 'adapter/brand_adapter.dart';

class BrandRepository extends IBrandRepository {
  final _dio = Get.find<Dio>();

  @override
  Future<bool> AddBrand(Brand brand) {
    // TODO: implement AddBrand
    throw UnimplementedError();
  }

  @override
  Future<bool> DelBrand(Brand brand) {
    // TODO: implement DelBrand
    throw UnimplementedError();
  }

  @override
  Future<List<Content>> GetBrand() {
    // TODO: implement GetBrand
    throw UnimplementedError();
  }
  // @override
  //  Future<List<Content>> GetBrand() async {
  //   var result = await _dio.get( 'https://localhost:7192/api/Brand');
  //   print(result);
  //   var list = <Brand>[];
  //   for (var item in result.data) {
  //     list.add(Brand.fromJson(item));
  //   }
  //   return list;
  // }
  //  Future<bool> DelBrand(Brand brand) async {
  //   var result = await _dio.delete(  'https://localhost:7192/api/Brand',
  //       data: {"brand " : brand});
  //   return result.statusCode == 200;
  // }
  //   Future<bool> AddBrand(Brand brand) async {
  //   var result = await _dio.post(  'https://localhost:7192/api/Brand',
  //       data: {"brand " :brand});
  //   return result.statusCode == 200;
  // }
  }
