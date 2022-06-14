import 'package:get/get.dart';

class SearchController extends GetxController {
  final List<Map<String, String>> all = [
    {"name": "Ghaith Marwan", "sort": "influencer"},
    {"name": "Narin", "sort": "influencer"},
    {"name": "Nour Stars", "sort": "influencer"},
    {"name": "Huda buaty", "sort": "company"},
    {"name": "Zara", "sort": "company"},
    {"name": "haya Eid", "sort": "user"},
    {"name": "Channel", "sort": "brand"},
  ];
  //empty
  Rx<List<Map<String, String>>> find = Rx<List<Map<String, String>>>([]);
 
  @override
  void onInit() {
    super.onInit();
    find.value = all;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void filter(String name) {
    List<Map<String, String>> results = [];
    if (name.isEmpty) {
      results = all;
    } else {
      results = all
          .where((element) => element["name"]
              .toString()
              .toLowerCase()
              .contains(name.toLowerCase()))
          .toList();
      find.value = results;
    }
  }

 
}
