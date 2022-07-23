import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../sheard/auth_service.dart';
import '../controllers/profile_controller.dart';

class EditProfilePage extends GetResponsiveView<ProfileController> {
  @override
  Widget builder() {
      switch (controller.typeAuth.value) {
      case Auth.infulonser:
      return  Column(

      );
        case Auth.comapny:
      return  Column(
        children: [
        ],
      );
        case Auth.user:
      return  Column(
        children: [
      
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
            Center(
                child: Text(
             name==null?'':name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                descraption==null?'':descraption,
                style: TextStyle(fontSize: 16, color: Colors.grey),

              )),
            ),
            
      ],
    );
  }
  
  
  
  }