import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class Confirmpassword extends StatelessWidget{
  const Confirmpassword({super.key});
  @override
  Widget build (BuildContext context){

    return Scaffold(
    body: Center(child: Column(children: [
      Row(children: [
         Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: IconButton(onPressed: (){
                       Navigator.pop(context);
                     }, 
                     icon:Icon(Icons.arrow_back,size: 30,
                     color: Colors.purple[900],) ),
                   ),
          Padding(
                     padding: const EdgeInsets.fromLTRB(12,0,0,0),
                     child: Text('Reset  Your Password' ,style: TextStyle(fontSize: 22
                     ,color: Colors.purple[900],), ),
                   ),
      ],),
        Card(elevation: 10,child: Container( width: 180,
       
        child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6rpTLf6jrGAxcMuh5O3pmbO6cBmZlXkY4Cw&usqp=CAU'),)),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text('Enter your new password below',style: TextStyle(fontSize: 20),),
         )   ,
          Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container( width:400,
                     child: TextField( decoration: InputDecoration(border:OutlineInputBorder(),
                     hintText: 'Enter New Password' ,labelText: 'New Password'),),
                   ),
                 ),
                   Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container( width:400,
                     child: TextField( decoration: InputDecoration(border:OutlineInputBorder(),
                     hintText: 'Enter Your Confrim password' ,labelText: 'Confrim password'),),
                   ),
                 ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: ElevatedButton(
                     style:ElevatedButton.styleFrom(primary: Colors.pink,minimumSize: 
                     Size(405, 60),
                     shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5))
                     ),
                     onPressed: (){
                       Get.toNamed(Routes.websitecompany);
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => const secondpage(),));
                     }, child:Text('SUBMIT',style: TextStyle(fontSize: 20),) ),
                   ),
    ],)

    ),
    );

  }
}