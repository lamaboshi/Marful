import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_overlay/q_overlay.dart';

import '../../../../sheard/auth_service.dart';
import '../../../core/component/textField.dart';
import '../../../core/values/app_colors.dart';
import '../controllers/profile_controller.dart';
import 'build_post.dart';

class EditProfilePage extends GetResponsiveView<ProfileController> {
  EditProfilePage({super.key});
 
  @override
  Widget builder() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          getType() ,SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.blue),
                  fixedSize:
                      MaterialStateProperty.all(const Size.fromWidth(150))),
              onPressed: () async {
                controller.UpdateDataforperson();
              },
              child: const Text(
                "Save ",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget getType() {
    controller.info==controller.infulencer;
    controller.comp==controller.company;
    controller.use==controller.user;
    //////////////////////infulonseer
    switch (controller.typeAuth.value) {
      case Auth.infulonser:
        return Column(
          children: [
            viewPart(controller.infulencer.value.name!,
                controller.infulencer.value.description!,1),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Content',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.orange,
                        ),
                      ),
                      SizedBox(
                          width: 100,
                          child: QExpander(
                            child: Icon(
                              Icons.add,
                              color: AppColors.orange,
                            ),
                            expandChild: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: controller.allContents
                                    .map(
                                      (element) => Padding(
                                          padding: EdgeInsets.all(6),
                                          child: 
                                          TextButton(
                                           onPressed: () { 
                                            if(!controller.contents.contains(element)){
                                              controller.contents.add(element);
                                            }
                                            contentPart();
                                            }, child: Text(  element.name!,
                                            style: TextStyle(fontSize: 16,color: Colors.black),),
                                          )
                                          ),
                                    )
                                    .toList()),
                          )),
                    ],
                  ),
                  SizedBox(
                      width: screen.width, height: 65, child: contentPart()),
                  Row(
                    children: [
                      Text(
                        'Post',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.orange,
                        ),
                      ),
                      IconButton(
                          onPressed: (
                          ) {
                            QPanel(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Add Post',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: AppColors.orange,
                                      ),
                                    ),
                                    SizedBox(
                                      width: screen.width - 50,
                                      child: TextFieldWidget(
                                        type: TextInputType.multiline,
                                        hint: 'Description',
                                        obscureText: false,
                                        prefIcon: Icons.description,
                                      ),
                                    ),
                                    SizedBox(
                                      width: screen.width - 34,
                                      height: screen.height / 3.74,
                                      child: InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.add_a_photo,
                                            color: AppColors.blue,
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    AppColors.blue),
                                            fixedSize:
                                                MaterialStateProperty.all(
                                                    const Size.fromWidth(150))),
                                        onPressed: () async {},
                                        child: const Text(
                                          "Save ",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ).show();
                          },
                          icon: Icon(
                            Icons.add,
                            color: AppColors.orange,
                          )),
                    ],
                  ),
                  Column(
                    children: controller.posts
                        .map((e) => BuildPost(
                              infoname: controller.infulencer.value.name!,
                              description: e.description!,
                              isEdit: true,
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        );
        /////////////company
      case Auth.comapny:
        return Column(
          children: [
            viewPart(controller.company.value.name!,
                controller.company.value.description!,2),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Content',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.orange,
                        ),
                      ),
                      SizedBox(
                          width: 100,
                          child: QExpander(
                            child: Icon(
                              Icons.add,
                              color: AppColors.orange,
                            ),
                            expandChild: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: controller.allContents
                                    .map(
                                      (element) => Padding(
                                          padding: EdgeInsets.all(6),
                                          child:
                                          TextButton(onPressed: () {
                                             if(!controller.contents.contains(element)){
                                              controller.contents.add(element);
                                            }
                                            contentPart();
                                          },
                                            child: 
                                            Text(
                                            element.name!,
                                            style: TextStyle(fontSize: 16),
                                          ) ,)
                                        
                                          ),
                                    )
                                    .toList()),
                          )),
                    ],
                  ),
                  SizedBox(
                      width: screen.width, height: 65, child: contentPart()),
                  Row(
                    children: [
                      Text(
                        'Post',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.orange,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            QPanel(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Add Post',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: AppColors.orange,
                                      ),
                                    ),
                                    SizedBox(
                                      width: screen.width - 50,
                                      child: TextFieldWidget(
                                        type: TextInputType.multiline,
                                        hint: 'Description',
                                        obscureText: false,
                                        prefIcon: Icons.description,
                                      ),
                                    ),
                                    SizedBox(
                                      width: screen.width - 34,
                                      height: screen.height / 3.74,
                                      child: InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.add_a_photo,
                                            color: AppColors.blue,
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    AppColors.blue),
                                            fixedSize:
                                                MaterialStateProperty.all(
                                                    const Size.fromWidth(150))),
                                        onPressed: () async {},
                                        child: const Text(
                                          "Save ",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ).show();
                          },
                          icon: Icon(
                            Icons.add,
                            color: AppColors.orange,
                          )),
                    ],
                  ),
                  Column(
                    children: controller.posts
                        .map((e) => BuildPost(
                              infoname: controller.infulencer.value.name!,
                              description: e.description!,
                              isEdit: true,
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        );
        ///////////////user
      case Auth.user:
        return Column(
          children: [
            viewPart(controller.user.value.name!, '',3),
          ],
        );
      default:
        return Text('no Value');
    }
  }

  Widget contentPart() {
    return Obx(() => ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: controller.contents
              .toList()
              .map<Widget>((e) => Container(
                    height: 55,
                    padding: const EdgeInsets.all(10),
                    child: Chip(
                      backgroundColor: Colors.white,
                      label: Text(e.name!),
                      avatar: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                            'assets/images/angryimg.png',
                          )),
                        ),
                      ),
                      elevation: 2,
                      deleteIcon: Icon(Icons.close, size: 20),
                      onDeleted: () {
                         controller.contents.remove(e);
                        
                      },
                    ),
                  ))
              .toList(),
        ));
  }

  Widget viewPart(String name, String descraption,int type) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Obx(() => Container(
                      height: 200,
                      width: 200,
                      child: controller.imagefile.value.path.isNotEmpty
                          ? CircleAvatar(
                              backgroundImage:
                                  FileImage(controller.imagefile.value),
                            )
                          : CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/8.jpg"),
                            ),
                    )),
                Positioned(
                    right: -10,
                    bottom: -10,
                    child: IconButton(
                        onPressed: () async {
                          await controller.pickImage();
                        },
                        icon: Icon(Icons.camera_enhance)))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('*', style: TextStyle(color: Colors.red)),
                    SizedBox(
                      width: screen.width - 50,
                      child: TextFieldWidget(
                        onChanged: (txt) {
                            if(txt!=null){
                            switch (type) {
                           case 1:
                           controller.info.value.name==txt;
                           break;
                           case 2 :
                           controller.comp.value.name==txt;
                           break;
                              default:
                              controller.use.value.name=txt;
                            }
                         }
                          },
                        type: TextInputType.multiline,
                        hint: 'Name',
                        obscureText: false,
                        prefIcon: Icons.person,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: screen.width - 50,
                  child: TextFieldWidget(
                       onChanged: (txt) {
                            if(txt!=null){
                            switch (type) {
                           case 1:
                           controller.info.value.phone==txt;
                           break;
                           case 2 :
                           controller.comp.value.phone==txt;
                           break;
                              default:
                              controller.use.value.phone=txt;
                            }
                         }
                          },
                    type: TextInputType.multiline,
                    hint: 'Phone',
                    obscureText: false,
                    prefIcon: Icons.phone,
                  ),
                ),
                Row(
                  children: [
                    const Text('*', style: TextStyle(color: Colors.red)),
                    SizedBox(
                      width: screen.width - 50,
                      child: TextFieldWidget(
                        type: TextInputType.multiline,
                        hint: 'Email',
                        obscureText: false,
                        prefIcon: Icons.email,
                          onChanged: (txt) {
                            if(txt!=null){
                            switch (type) {
                           case 1:
                           controller.info.value.email==txt;
                           break;
                           case 2 :
                           controller.comp.value.email==txt;
                           break;
                              default:
                              controller.use.value.email=txt;
                              }  }}
                      ),
                    ),
                  ],
                ),
                controller.typeAuth.value == Auth.comapny
                    ? SizedBox.shrink()
                    : Row(
                        children: [
                          const Text('*', style: TextStyle(color: Colors.red)),
                          SizedBox(
                            width: screen.width - 50,
                            child: TextFieldWidget(
                                onChanged: (txt) {
                            if(txt!=null){
                            switch (type) {
                           case 1:
                           controller.info.value.paypal==txt;
                           break;
                           case 2 :
                           //controller.comp.value.==txt;
                           break;
                              default:
                              controller.use.value.paypal=txt;
                            }}},
                              type: TextInputType.multiline,
                              hint: 'PayPal',
                              obscureText: false,
                              prefIcon: Icons.paypal,
                            ),
                          ),
                        ],
                      ),
                controller.typeAuth.value == Auth.user
                    ? SizedBox.shrink()
                    : SizedBox(
                        width: screen.width - 50,
                        child: TextFieldWidget(
                           onChanged: (txt) {
                            if(txt!=null){
                            switch (type) {
                           case 1:
                           controller.info.value.address==txt;
                           break;
                           case 2 :
                           controller.comp.value.address==txt;
                           break;
                              default:
                            
                              }  }},
                          type: TextInputType.multiline,
                          hint: 'Address',
                          obscureText: false,
                          prefIcon: Icons.location_on,
                        ),
                      ),
                controller.typeAuth.value == Auth.comapny
                    ? SizedBox.shrink()
                    : Row(
                        children: [
                          const Text('*', style: TextStyle(color: Colors.red)),
                          SizedBox(
                            width: screen.width - 50,
                            child: TextFieldWidget(
                               onChanged: (txt) {
                            if(txt!=null){
                            switch (type) {
                           case 1:
                           controller.info.value.userName==txt;
                           break;
                           case 2 :
                        //   controller.comp.value.userName==txt;
                           break;
                              default:
                              controller.use.value.userName=txt;
                              }  }},
                              type: TextInputType.multiline,
                              hint: 'Username',
                              obscureText: false,
                              prefIcon: Icons.person,
                            ),
                          ),
                        ],
                      ),
                controller.typeAuth.value != Auth.comapny
                    ? SizedBox.shrink()
                    : SizedBox(
                        width: screen.width - 50,
                        child: TextFieldWidget(
                            onChanged: (txt) {
                            if(txt!=null){
                            switch (type) {
                           case 1:
                        //   controller.info.value.==txt;
                           break;
                           case 2 :
                          controller.comp.value.telePhone==txt;
                           break;
                              default:
                             // controller.use.value.t=txt;
                              }  }},
                          type: TextInputType.multiline,
                          hint: 'TelePhone',
                          obscureText: false,
                          prefIcon: Icons.phone,
                        ),
                      ),
                controller.typeAuth.value == Auth.user
                    ? SizedBox.shrink()
                    : SizedBox(
                        width: screen.width - 50,
                        child: TextFieldWidget(
                            onChanged: (txt) {
                            if(txt!=null){
                            switch (type) {
                           case 1:
                           controller.info.value.description==txt;
                           break;
                           case 2 :
                           controller.comp.value.description==txt;
                           break;
                              default:
                            //  controller.use.value.descraption=txt;
                              }  }},
                          type: TextInputType.multiline,
                          hint: 'Description',
                          obscureText: false,
                          prefIcon: Icons.description,
                        ),
                      ),
                controller.typeAuth.value != Auth.user
                    ? SizedBox.shrink()
                    : SizedBox(
                        width: screen.width - 50,
                        child: TextFieldWidget(
                          onChanged: (txt) {
                            if(txt!=null){
                            switch (type) {
                           case 1:
                       //    controller.info.value.==txt;
                           break;
                           case 2 :
                         //  controller.comp.value.==txt;
                           break;
                              default:
                             controller.use.value.age==txt;
                              }  }},
                          type: TextInputType.multiline,
                          hint: 'Age',
                          obscureText: false,
                          prefIcon: Icons.description,
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
