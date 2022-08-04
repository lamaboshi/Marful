import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/core/component/textField.dart';
import '../../../core/values/app_colors.dart';
import '../controllers/content_controller.dart';

class ContentView extends GetView<ContentController> {
  const ContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<String> content = [
    //   'Comidy',
    //   'Fashion',
    //   'Drama',
    //   'Comidy',
    //   'Fashion',
    //   'Drama',
    //   'Comidy',
    // ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        title: const Text('Content'),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppColors.orange,
          onPressed: () {
            Get.bottomSheet(
                exitBottomSheetDuration: const Duration(milliseconds: 400),
                enterBottomSheetDuration: const Duration(milliseconds: 500),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                backgroundColor: Colors.white,
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Add new content',
                        style: TextStyle(fontSize: 17),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFieldWidget(
                        onChanged: ((String txt) {
                          controller.addcontent=txt;
                          
                        }),
                        type: TextInputType.name,
                        obscureText: false,
                        prefIcon: Icons.input,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.addcontentelement(controller.addcontent);
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(AppColors.orange),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          child: const Center(child: Text('Add')),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // Align(
                      //   alignment: Alignment.topRight,
                      //   child: FloatingActionButton.extended(
                      //   //  heroTag: 'uniqueTag',
                      //     backgroundColor: AppColors.orange,
                      //     label: Row(
                      //       children: const [Icon(Icons.close), Text('close')],
                      //     ),
                      //     //      const Icon(Icons.close),
                      //     onPressed: () {
                      //       Get.back();
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                ));
          },
          label: Row(
            children: const [Icon(Icons.add), Text('Add')],
          )),
<<<<<<< HEAD
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
            itemBuilder: ((context, index) => ListTile(
                  title: Text(controller.content[index]),
                  trailing: IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        controller.delcontentelement(content[index]);
                      },
                      icon: const Icon(Icons.close)),
                )),
            separatorBuilder: ((context, index) => const Divider(
                  endIndent: 8,
                  indent: 8,
                  thickness: 1,
                )),
            itemCount: controller.contents.length),

        // Expanded(
        //   child: GridView.count(
        //     mainAxisSpacing: 10,
        //     crossAxisSpacing: 10,
        //     childAspectRatio: 2.5,
        //     crossAxisCount: 4,
        //     children: List.generate(controller.type.length, (index) {
        //       return AnimatedContainer(
        //           duration: const Duration(milliseconds: 130),
        //           padding: const EdgeInsets.symmetric(
        //               horizontal: 6, vertical: 6),
        //           decoration: BoxDecoration(
        //               color: AppColors.orange,
        //               borderRadius: BorderRadius.circular(25)),
        //           child: Center(
        //             child: Text(
        //               controller.type[index],
        //               style: TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 13,
        //               ),
        //             ),
        //           ));
        //     }),
        //   ),
        // ),
        // const SizedBox(height: 20),
        // ExpansionTile(
        //   title: const Text('All content'),
        //   leading: const Icon(Icons.menu),
        //   tilePadding: const EdgeInsets.all(0),
        //   expandedAlignment: Alignment.topLeft,
        //   childrenPadding: const EdgeInsets.only(bottom: 20),
        //   children: [
        //     for (var item in content)
        //       Padding(
        //         padding: const EdgeInsets.only(left: 5),
        //         child: Row(
        //           children: [
        //             Text(item),
        //             const Spacer(),
        // IconButton(
        //     padding: const EdgeInsets.all(0),
        //     onPressed: () {},
        //     icon: const Icon(Icons.close)),
        //             const SizedBox(
        //               height: 10,
        //             ),
        //           ],
        //         ),
        //       ),
        //   ],
        // ),
        // const SizedBox(
        //   height: 20,
        // ),
        // Column(
        //   children: [
        // const Align(
        //     alignment: Alignment.topLeft,
        //     child: Text(
        //       'Add new content',
        //       textAlign: TextAlign.start,
        //       style: TextStyle(fontSize: 16),
        //     )),
        //     const SizedBox(
        //       height: 10,
        //     ),
        //     TextFieldWidget(
        //       type: TextInputType.name,
        //       obscureText: false,
        //     ),
        //     const SizedBox(
        //       height: 10,
        //     ),
        // Align(
        //   alignment: Alignment.topRight,
        //   child: ElevatedButton(
        //     onPressed: () {},
        //     style: ButtonStyle(
        //         backgroundColor:
        //             MaterialStateProperty.all(AppColors.orange),
        //         foregroundColor:
        //             MaterialStateProperty.all(Colors.white)),
        //     child: const Text('Add'),
        //   ),
        //     ),
        //   ],
        // ),
      ),
=======
      body: ListView.separated( padding: const EdgeInsets.all(15),physics:const BouncingScrollPhysics(),
          itemBuilder: ((context, index) => ListTile(
                title: Text(content[index]),
                trailing: IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {},
                    icon: const Icon(Icons.close)),
              )),
          separatorBuilder: ((context, index) => const Divider(
                endIndent: 8,
                indent: 8,
                thickness: 1,
              )),
          itemCount: content.length),
>>>>>>> b7ce7c37fe646778cb97984ce972878ad8496866
    );
  }
}
