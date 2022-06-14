import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/search_page/controllers/search_controller.dart';
import 'package:marful/app/routes/app_pages.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> filter = [
      'Brands',
      'Influencers',
      'Company',
      'Users',
      'products'
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size(3, 80),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200]),
                  child: TextField(
                      onChanged: (Value) => controller.filter(Value),
                      decoration: InputDecoration(
                        fillColor: Colors.grey,
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: IconButton(
                          onPressed: () {
                            Get.rootDelegate.offAndToNamed(Routes.HOME);
                          },
                          icon: Icon(Icons.clear),
                        ),
                        hintText: "Search",
                        hintStyle: TextStyle(fontSize: 15),
                      )),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 30,
                  color: Colors.white,
                  child: ListView.separated(
                    itemCount: filter.length,
                    scrollDirection: Axis.horizontal,
                    padding:
                        const EdgeInsets.fromLTRB(0, 0, 0, 0), //15, 20, 15, 0
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 12,
                      );
                    },

                    itemBuilder: (BuildContext context, int index) {
                      return ElevatedButton(
                        onPressed: () {
                     
                      //    controller.filterbutun(filter[index]);
                        },
                        child: Text(filter[index]),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.grey[200]),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black)),
                      );
                    },
                  ),
                ),
                // SizedBox(height: 3,),
              ],
            ),
          ),
        ),
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: controller.find.value.length,
            itemBuilder: (BuildContext context, int index) => ListTile(
                  title: Text(controller.find.value[index]['name'].toString()),
                )),
      ),
    );
  }
}
