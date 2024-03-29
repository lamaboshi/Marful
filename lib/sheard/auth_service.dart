import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/api/storge/storge_service.dart';
import 'package:marful/app/data/model/company.dart';
import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/data/model/user_model.dart';
import 'package:marful/app/modules/permissions_page/data/company_type.dart';

import '../app/routes/app_pages.dart';

enum Auth { user, comapny, infulonser, none }

class AuthService {
  final _dio = Get.find<Dio>();
  final stroge = Get.find<StorageService>();

  bool isAuth() => stroge.containsKey('type');

  String personType() => jsonDecode(stroge.getData('type')!).toString();
  String companyType() => stroge.containsKey('CompanyType')
      ? jsonDecode(stroge.getData('CompanyType')!).toString()
      : '';
  Auth getTypeEnum() {
    switch (personType()) {
      case 'user':
        return Auth.user;
      case 'comapny':
        return Auth.comapny;
      case 'infulonser':
        return Auth.infulonser;
    }
    return Auth.none;
  }

  Object? getDataFromStorage() {
    if (stroge.containsKey('AuthData') && stroge.containsKey('type')) {
      var data = jsonDecode(stroge.getData('AuthData')!) as dynamic;
      switch (personType()) {
        case 'user':
          return UserModel.fromJson(data as Map<String, dynamic>);
        case 'comapny':
          return Company.fromJson(data as Map<String, dynamic>);
        case 'infulonser':
          return Infulonser.fromJson(data as Map<String, dynamic>);
      }
    }
    return null;
  }

  Future<CompanyTypeModel?> logInType(String type, String password) async {
    var result = await _dio.get(
        'https://localhost:7192/api/CompanyType/Existing',
        queryParameters: {"Type": type, "password": password});
    print(result.data);
    if (result.statusCode == 200) {
      var data = CompanyTypeModel.fromJson(result.data as Map<String, dynamic>);
      stroge.saveData('CompanyType', jsonEncode(data.type!));
      return data;
    }
    return null;
  }

  Future<Object?> logIn(String email, String password) async {
    var result = await _dio.get('https://localhost:7192/api/Auth/GetAuth',
        queryParameters: {"email": email, "password": password});
    print(result.data);
    if (result.statusCode == 200) {
      switch (result.data['type']) {
        case 'user':
          var data =
              UserModel.fromJson(result.data['data'] as Map<String, dynamic>);
          stroge.saveData('type', jsonEncode('user'));
          stroge.saveData('AuthData', jsonEncode(data.toJson()));
          return data;
        case 'comapny':
          var data =
              Company.fromJson(result.data['data'] as Map<String, dynamic>);
          stroge.saveData('type', jsonEncode('comapny'));
          stroge.saveData('AuthData', jsonEncode(data.toJson()));
          return data;
        case 'infulonser':
          var data =
              Infulonser.fromJson(result.data['data'] as Map<String, dynamic>);
          stroge.saveData('type', jsonEncode('infulonser'));
          stroge.saveData('AuthData', jsonEncode(data.toJson()));
          return data;
      }
    }
    return null;
  }
}

class AuthMiddlware extends GetMiddleware {
  var storge = Get.put(StorageService());
  @override
  RouteSettings? redirect(String? route) => !storge.containsKey('type')
      ? const RouteSettings(name: Routes.Intro)
      : null;
}
