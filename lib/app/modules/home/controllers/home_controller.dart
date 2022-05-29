import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marful/api/socket/hub_listen.dart';
import 'package:marful/api/socket/managment_hub.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final ManagementHub hub;
  final HubListenController listener;
  HomeController({required this.hub}) : listener = HubListenController(hub);
  final count = 0.obs;
  final imagefile = File('').obs;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      imagefile.value = imageTemp;
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
