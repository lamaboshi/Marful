import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/values/app_colors.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _MenuPageState();
}
class _MenuPageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
     var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
     body: SingleChildScrollView(child: 
      Column(crossAxisAlignment:  CrossAxisAlignment.start,
            children: [
              Padding(
                       padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                       child: IconButton(onPressed: (){}, 
                       icon:Icon(Icons.arrow_back_ios,size: 15,
                       color: Colors.black,) ),
                     ),
                    Center(
                      child: Container(
                   height: height/3,
                            width: width/3,
                             decoration: BoxDecoration(
                          shape: BoxShape.circle,
                             image: DecorationImage(
                                image: new AssetImage("assets/images/8.jpg" ),
                                   fit: BoxFit.cover
                             ),
                             )   ),
                    ), 
               Center(child: Text('Asia  Badnjki',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text('Dont Stop ....Continue',style:
                   TextStyle(fontSize: 16,color: Colors.grey),)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    SizedBox(width: width/6),
                       ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(AppColors.blue),
                              fixedSize: MaterialStateProperty.all(
                                  const Size.fromWidth(150))),
                          onPressed: () {
                          },
                          child: const Text(
                            "Follow",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 18,),
                           ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:   MaterialStateProperty.all(Colors.white) ,
                              fixedSize: MaterialStateProperty.all(
                                  const Size.fromWidth(150))),
                          onPressed: () {
                          },
                          child: const Text(
                            "Message",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                  ],),
                )
        ],),
  
     ),
     
    );
  }
  }