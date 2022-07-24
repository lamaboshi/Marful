import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:marful/app/core/component/textField.dart';
import 'package:marful/app/core/values/app_colors.dart';
import 'package:q_overlay/q_overlay.dart';

import '../../../../sheard/auth_service.dart';
import '../controllers/profile_controller.dart';

class EditProfilePage extends GetResponsiveView<ProfileController> {
  @override
  Widget builder() {
      switch (controller.typeAuth.value) {
      case Auth.infulonser:
      return  Column(
          children: [
            viewPart(controller.infulencer.value.name!,controller.infulencer.value.description!),

          ],
      );
        case Auth.comapny:
      return  Column(
        children: [
            viewPart(controller.company.value.name!,controller.company.value.description!),
        ],
      );
        case Auth.user:
      return  Column(
        children: [
          viewPart(controller.user.value.name!,''),
        ],
      );
      default: 
      return Text('no Value');
      
    }
    return Column(
   children: [
      

   ],

    );
  }
   Widget viewPart(String name,String descraption){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
                    Center(
              child: Container(
                  height: 200,
                  width: 200,
                child: CircleAvatar(backgroundImage:AssetImage(  "assets/images/8.jpg")
               ,),
               ),
            ),
            Column(
            children: [
              Text('Update Name From'+name+'to'),
              TextFieldWidget(type: TextInputType.name , obscureText: false)
            ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:Row(
                children: [
                  Text('Update Your Description'),
                  SizedBox(width: 5,),
                  IconButton(onPressed: (){
                    QPanel(
                      alignment: Alignment.center,width: 200,height: 200,
                      child: Column(children: [
                        Text('Description :'),
                        TextFieldWidget(type: TextInputType.name,obscureText: false,),
                             ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.blue),
                        fixedSize: MaterialStateProperty.all(
                            const Size.fromWidth(150))),
                    onPressed: () {},
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),

                      ],)
                    ).show();
                  }, icon:
                   Icon(Icons.edit, size: 30, color: AppColors.orange), )
                ],
              )
            ),
            
      ],
    );
  }
  
  
  
  }