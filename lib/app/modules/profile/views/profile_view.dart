import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/websit_company/views/websit_company_page.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/my_flutter_app_icons.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';


class ProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    bool kind=false;
    final random=Random();
    final List grid=List.generate(1000, (index) => null);
     var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
     body: SingleChildScrollView(child: 
      Column(crossAxisAlignment:  CrossAxisAlignment.start,
            children: [
              Padding(
                       padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                       child: IconButton(onPressed: (){
                       Navigator.push(context, 
                       MaterialPageRoute(builder: (context) => WebsiteCompanyPage(),));
                       }, 
                       icon:Icon(Icons.arrow_back_ios,size: 15,
                       color: Colors.black,) ),
                     ),
                    Center(
                      child: Container(
                   height: height/4,
                            width: width/3,
                             decoration: BoxDecoration(
                          shape: BoxShape.circle,
                             image: DecorationImage(
                                image: new AssetImage("assets/images/8.jpg" ),
                                   fit: BoxFit.cover
                             ),
                             )   ),
                    ), 
               Center(child: Text('Asia  Badnjki',style: 
               TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
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
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                  child: IntrinsicHeight(
                    child: Center(
                      child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                           SizedBox(width: width/3.4,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Text('291',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                               Text( 'Posts',style: TextStyle(fontSize: 18),),
                            ],),
                          ),
               VerticalDivider(color: Colors.grey,thickness: 2,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                              Text('6,200 ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                               Text('Followors ',style: TextStyle(fontSize: 18),),
                          ],),
                            ),          
                      ],),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Text(' About Me',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(' i belevie that no one should choose between acareer we love and prove our livers .',
                 style: TextStyle(fontSize: 16,color: Colors.black54),),
               ),
              Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Text(' Contents',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    children: [
           card('comidi', width, height, random),
           card('fashion', width, height, random),
           card('sport', width, height, random),
           card('akkk', width, height, random),
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        SizedBox(width: width/4,),
                    Tooltip(message: 'Photo',
                      child: IconButton( icon:Icon(Icons.photo,size: 30,
                           color: Colors.black54), onPressed: (){
                           },),
                    ) ,
                         SizedBox(width: width/4,),
                    Tooltip(message: 'Posts',
                              child: IconButton( icon:Icon(Icons.post_add,size: 30,
                         color: Colors.black54), onPressed: (){
                         },),
                            ) ,
                  ],),
                ),
                  Obx(
              () =>  Container(
                child:  controller.kind.value
                  ? Wrap(
                         children: [
                      photo("assets/images/6.jpg",width,height), 
                             photo("assets/images/1.jpg",width,height),
                            photo("assets/images/2.jpg",width,height),
                              photo("assets/images/3.jpg",width,height),
                            photo("assets/images/h.jpg",width,height),   
                                photo("assets/images/4.jpg",width,height),
                                photo("assets/images/5.jpg",width,height),
                                 photo("assets/images/Castle.gif",width,height),
                                  photo("assets/images/ghaith.jpg",width,height),    
                    ],
                  )
                 : Column(
                    children: [
                      buildpost(1),
                      buildpost(1),
                        buildpost(1),
                         buildpost(1),    
                    ],
                  )
               )),
                  kind==true ?Wrap(
                    children: [
                      photo("assets/images/6.jpg",width,height), 
                             photo("assets/images/1.jpg",width,height),
                            photo("assets/images/2.jpg",width,height),
                              photo("assets/images/3.jpg",width,height),
                            photo("assets/images/h.jpg",width,height),   
                                photo("assets/images/4.jpg",width,height),
                                photo("assets/images/5.jpg",width,height),
                                 photo("assets/images/Castle.gif",width,height),
                                  photo("assets/images/ghaith.jpg",width,height),    
                    ],
                  ):Column(
                    children: [
                      buildpost(1),
                      buildpost(1),
                        buildpost(1),
                         buildpost(1),   
                    ],
                  )
        ],),
     ),
    );
  }
  Widget card(String name, double width,double height,var random ){
   return Container( width:width/5 ,
             child:  Card(
              color: Color.fromARGB(random.nextInt(256), random.nextInt(256),
               random.nextInt(256), random.nextInt(256)),
            elevation: 50, shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(15),
              ),
          child: Center(
            child: Wrap(
              children: [
              Align(alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(name,style: TextStyle(fontSize: 17),),
                )),
                     ],),
          ),
                ),
               );
  }
  Widget photo(String url,double width,double height){
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
        width:width/5 ,
        height: height/5,
        child:Image.asset(url) ,
      ),
    );
  }
   Widget buildpost(int index) => Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                       "assets/images/8.jpg" ,
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      'Asia Badnjki',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/6.jpg',
                  height: 220,
                  width: 380,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Helllo In New Markating For Shopping From Diffirent Country Hello With You',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    IconButton(
                        onPressed: () {},
                        icon:const Icon(AppIcons.basket,color:AppColors.orange,),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon:const Icon(AppIcons.thumbs_down,color: Colors.black,),
                      ),
                      IconButton(
                          onPressed: () {}, icon:  Icon(AppIcons.favorite,color: Colors.red,)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  }