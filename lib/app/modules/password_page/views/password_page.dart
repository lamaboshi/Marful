import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../routes/app_pages.dart';



class PasswordPage extends StatefulWidget {

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
     var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
               Padding(
                 padding: const EdgeInsets.all(12.0),
                 child: Row(children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: IconButton(onPressed: (){}, 
                     icon:Icon(Icons.arrow_back,size: 30,
                    color: AppColors.blue), ), ),
                   
                   Padding(
                     padding: const EdgeInsets.fromLTRB(12,0,0,0),
                     child: Text('Forgot  Your  Passwod' ,style: TextStyle(fontSize: 22
               , color: AppColors.blue), ),
                   ),
                 ],),
               ),
                   Card(elevation: 10,child: Container( width: width/2,height:height/2.3,
        child: Image.asset('assets/images/forget.gif'))),
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
                     const TextField(
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
               
                 SizedBox(height: 20,),
                  ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.blue),
                            fixedSize: MaterialStateProperty.all(
                                const Size.fromWidth(150))),
                        onPressed: () {
                         Get.toNamed(Routes.ConfirmPassword);
                        },
                        child: const Text(
                          "Send",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                //  ElevatedButton(
                //    style:ElevatedButton.styleFrom(primary:AppColors.blue,minimumSize: 
                //    Size(405, 60),
                //    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5))
                //    ),
                //    onPressed: (){
                //      Get.toNamed(Routes.ConfirmPassword);
                //  //    Navigator.push(context, MaterialPageRoute(builder: (context) => const secondpage(),));
                //    }, child:Text('Send',style: TextStyle(fontSize: 20),) ),
                 
               
          ]
           
          
        ),
      ),
    );
  }
}
