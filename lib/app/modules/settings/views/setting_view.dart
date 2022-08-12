import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  State<SettingPage> createState() => _SettingPageState();
}
class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    const color1=const Color(0xffb74093);
return Scaffold(
  body: Column( crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column( crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [

                Padding(
                     padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                     child: IconButton(onPressed: (){}, 
                     icon:Icon(Icons.arrow_back_ios,size: 30,
                     color: Colors.black,) ),
                   ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Setting'.tr,style: TextStyle(fontSize: 30),),
          ),
          ],),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(elevation: 3,child:   Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
               Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: IconButton(onPressed: (){}, 
                       icon:Icon(Icons.person,size: 20,
                       color: Colors.black,) ),
                     ),
                     SizedBox(width: 10,),
                     Padding(
                       padding: const EdgeInsets.fromLTRB(8, 15, 8, 4),
                       child: Text('buildPostEditProfile'.tr,style: TextStyle(fontSize:18 ,color: color1),),
                     ),
                        SizedBox(width: 250,),
                       Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: IconButton(onPressed: (){}, 
                       icon:Icon(Icons.arrow_forward_ios,size: 15,
                       color: Colors.black,) ),
                     ),
            ],)
            ,
            ),
          ),
        
        

      ],)
      
    ],),
);

  }}