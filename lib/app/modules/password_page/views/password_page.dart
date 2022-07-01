import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/password_page/controllers/password_controller.dart';

import '../../../core/values/app_colors.dart';
import '../../../routes/app_pages.dart';

class PasswordPageView  extends  GetView<PasswordController> {
  @override
  Widget build(BuildContext context) {
     var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                 Padding(
                   padding: const EdgeInsets.all(12.0),
                   child: Row(children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: IconButton(onPressed: (){
                         Get.rootDelegate.offNamed(Routes.SignIn);
                       }, 
                       icon:Icon(Icons.arrow_back,size: 30,
                      color: AppColors.blue), ), ),
                     
                     Padding(
                       padding: const EdgeInsets.fromLTRB(12,0,0,0),
                       child: Text('Forgot  Your  Passwod' ,style: TextStyle(fontSize: 22
                 , color: Colors.black), ),
                     ),
                   ],),
                 ),
                     Card(elevation: 10,child: Container( width: width/2,height:height/2.3,
          child: Image.asset('assets/images/Social ideas.gif'))),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text('Enter the registerd email address'
                   ,style: TextStyle(fontSize: 20,color: Colors.black54),),
                 ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text('we will email you a link to reset  ',style: TextStyle(fontSize: 18
                     ,color: Colors.black45),),
                   ),
                   Text(' your password',style: TextStyle(fontSize: 18,color: Colors.black45),),
                   SizedBox(height: 20,),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: TextField(
                          onChanged: (newText){
                         controller.email.value =newText;
                          },
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: AppColors.blue,
                            cursorHeight: 20,
                            autofocus: false,
                            decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.grey),
                                labelText: 'Email',
                                hintText: "hy@gmail.com",
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: AppColors.orange,
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.orange, width: 1.5),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.orange, width: 1.5),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.orange, width: 1.5),
                                )),
                          ),
                       ),
                   SizedBox(height: 20,),
                    ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(AppColors.blue),
                              fixedSize: MaterialStateProperty.all(
                                  const Size.fromWidth(150))),
                          onPressed: () {
                          controller.getEmail();
                          },
                          child: const Text(
                            "Send",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
            ]  
          ),
        ),
      ),
    );
  }
}
