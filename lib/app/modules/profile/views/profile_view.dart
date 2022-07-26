import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/home/views/home_view.dart';
import 'package:marful/app/modules/profile/views/edit_profile.dart';
import 'package:marful/app/modules/websit_company/views/websit_company_page.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/my_flutter_app_icons.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';
import 'main_profile.dart';

class ProfilePage extends GetResponsiveView<ProfileController> {
  @override
  Widget builder() {
    bool kind = false;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainProfile(),
         
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       SizedBox(
            //         width: screen.width / 4,
            //       ),
            //       Tooltip(
            //         message: 'Photo',
            //         child: IconButton(
            //           icon: Icon(Icons.photo, size: 30, color: Colors.black54),
            //           onPressed: () {},
            //         ),
            //       ),
            //       SizedBox(
            //         width: screen.width/ 4,
            //       ),
            //       Tooltip(
            //         message: 'Posts',
            //         child: IconButton(
            //           icon:
            //               Icon(Icons.post_add, size: 30, color: Colors.black54),
            //           onPressed: () {},
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Obx(() => Container(
            //     child: controller.kind.value
            //         ? 
            //         Wrap(
            //             children: [
            //               photo("assets/images/6.jpg", screen.width, screen.height),
            //               photo("assets/images/1.jpg", screen.width, screen.height),
            //               photo("assets/images/2.jpg", screen.width,screen.height),
            //               photo("assets/images/3.jpg", screen.width,screen.height),
            //               photo("assets/images/h.jpg", screen.width, screen.height),
            //               photo("assets/images/4.jpg", screen.width, screen.height),
            //               photo("assets/images/5.jpg", screen.width, screen.height),
            //               photo("assets/images/Castle.gif", screen.width,screen.height),
            //               photo("assets/images/ghaith.jpg", screen.width, screen.height),
            //             ],
            //           )
            //         : Column(
            //             children: [
            //               // buildpost(1),
            //               // buildpost(1),
            //               // buildpost(1),
            //               // buildpost(1),
            //             ],
            //           ))),
        //     kind == true
        //         ? Wrap(
        //             children: [
        //               photo("assets/images/6.jpg", screen.width, screen.height),
        //               photo("assets/images/1.jpg",screen.width, screen.height),
        //               photo("assets/images/2.jpg",screen.width,screen.height),
        //               photo("assets/images/3.jpg",screen.width,screen.height),
        //               photo("assets/images/h.jpg", screen.width, screen.height),
        //               photo("assets/images/4.jpg", screen.width, screen.height),
        //               photo("assets/images/5.jpg",screen.width, screen.height),
        //               photo("assets/images/Castle.gif", screen.width, screen.height),
        //               photo("assets/images/ghaith.jpg", screen.width, screen.height),
        //             ],
        //           )
        //         : Column(
        //             children: [
        //               buildpost(1),
        //               buildpost(1),
        //               buildpost(1),
        //               buildpost(1),
        //             ],
        //           )
        //   ],
        // ),
        ]  ),
     ) );
  }

 

  Widget photo(String url, double width, double height) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
        width: width / 5,
        height: height / 5,
        child: Image.asset(url),
      ),
    );
  }

  // Widget buildpost(int index) => Padding(
  //       padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
  //       child: Card(
  //         elevation: 2,
  //         child: Padding(
  //           padding: const EdgeInsets.all(15),
  //           child: Column(
  //             children: [
  //               Row(
  //                 children: [
  //                   ClipRRect(
  //                     borderRadius: BorderRadius.circular(40),
  //                     child: Image.asset(
  //                       "assets/images/8.jpg",
  //                       height: 60,
  //                       width: 60,
  //                       fit: BoxFit.cover,
  //                     ),
  //                   ),
  //                   const SizedBox(
  //                     width: 20,
  //                   ),
  //                   const Text(
  //                     'Asia Badnjki',
  //                     style:
  //                         TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
  //                   ),
  //                 ],
  //               ),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               Image.asset(
  //                 'assets/images/6.jpg',
  //                 height: 220,
  //                 width: 380,
  //                 fit: BoxFit.cover,
  //               ),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               const Text(
  //                 'Helllo In New Markating For Shopping From Diffirent Country Hello With You',
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.only(top: 15),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   children: [
  //                     IconButton(
  //                       onPressed: () {},
  //                       icon: const Icon(
  //                         AppIcons.basket,
  //                         color: AppColors.orange,
  //                       ),
  //                     ),
  //                     IconButton(
  //                       onPressed: () {},
  //                       icon: const Icon(
  //                         AppIcons.thumbs_down,
  //                         color: Colors.black,
  //                       ),
  //                     ),
  //                     IconButton(
  //                         onPressed: () {},
  //                         icon: Icon(
  //                           AppIcons.favorite,
  //                           color: Colors.red,
  //                         )),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     );
}
