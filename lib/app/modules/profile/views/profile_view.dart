import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/websit_company/views/websit_company_page.dart';

import '../../../core/values/app_colors.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfilePage extends StatefulWidget {
   
  @override
  State<ProfilePage> createState() => _MenuPageState();
}
class _MenuPageState extends State<ProfilePage> {
 //final conroller = Get.find<ProfileController>();
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
                       Navigator.push(context, MaterialPageRoute(builder: (context) => WebsiteCompanyPage(),));
                       }, 
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
                      child: Row(children: [
                           SizedBox(width: width/4.3,),
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
                                    VerticalDivider(color: Colors.grey,thickness: 2,),
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Column(children: [
                            Text('789   ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                               Text('Following   ',style: TextStyle(fontSize: 18),),
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
                Wrap(
                  children: [
                  Container( width:width/5 ,
             child:  Card(
              color: Color.fromARGB(random.nextInt(256), random.nextInt(256),
               random.nextInt(256), random.nextInt(256)),
            elevation: 50, shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(15),
              ),
          child: Center(
            child: Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Align(alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('comidi',style: TextStyle(fontSize: 17),),
                )),
               
                     ],),
          ),
                ),
               ),
                       Container( width:width/5 ,
             child:  Card(
              color: Color.fromARGB(random.nextInt(256), random.nextInt(256),
               random.nextInt(256), random.nextInt(256)),
            elevation: 50, shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(15),
              ),
          child: Center(
            child: Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Align(alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Mack up',style: TextStyle(fontSize: 17),),
                )),
                
                     ],),
          ),
                ),
               ),          Container( width:width/5 ,
             child:  Card(
              color: Color.fromARGB(random.nextInt(256), random.nextInt(256),
               random.nextInt(256), random.nextInt(256)),
            elevation: 50, shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(15),
              ),
          child: Center(
            child: Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Align(alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Fashoin',style: TextStyle(fontSize: 17),),
                )),
                 
                     ],),
          ),
                ),
               ),
                       Container( width:width/5 ,
             child:  Card(
              color: Color.fromARGB(random.nextInt(256), random.nextInt(256),
               random.nextInt(256), random.nextInt(256)),
            elevation: 50, shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(15),
              ),
          child: Center(
            child: Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Align(alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Beuaty',style: TextStyle(fontSize: 17),),
                )),
                     ],),
          ),
                ),
               ),
                         Container( width:width/5 ,
             child:  Card(
              color: Color.fromARGB(random.nextInt(256), random.nextInt(256),
               random.nextInt(256), random.nextInt(256)),
            elevation: 50, shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(15),
              ),
          child: Center(
            child: Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Align(alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Beuaty',style: TextStyle(fontSize: 17),),
                )),
                     ],),
          ),
                ),
               ),
                ],),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        SizedBox(width: width/4,),
                    Tooltip(message: 'Photo',
                      child: IconButton( icon:Icon(Icons.photo,size: 30,
                           color: Colors.black54), onPressed: (){
                      kind=true;
                           },),
                    ) ,
                         SizedBox(width: width/4,),
                    Tooltip(message: 'Posts',
                              child: IconButton( icon:Icon(Icons.post_add,size: 30,
                         color: Colors.black54), onPressed: (){
                            kind=false;
                         },),
                            ) ,
                  ],),
                ),
              //       Container(
              //   child: Obx(
              // () => conroller.kind.value
              //     ? Wrap(
              //            children: [
              //         photo("assets/images/6.jpg",width,height), 
              //                photo("assets/images/1.jpg",width,height),
              //               photo("assets/images/2.jpg",width,height),
              //                 photo("assets/images/3.jpg",width,height),
              //               photo("assets/images/h.jpg",width,height),   
              //                   photo("assets/images/4.jpg",width,height),
              //                   photo("assets/images/5.jpg",width,height),
              //                    photo("assets/images/Castle.gif",width,height),
              //                     photo("assets/images/ghaith.jpg",width,height),    
              //       ],
              //     )
                 // : Wrap()
             //   ))
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
                      // posts(width, height, "assets/images/6.jpg", 'Hi  We will show product more in t'),
                      //   posts(width, height, "assets/images/9.jpg", 'The New product with the cost ..... '),
                      //    posts(width, height, "assets/images/11.jpg", 'This is the product i wish to be good '), 
                    ],
                  )
        ],),
  
     ),
     
    );
  }
  Widget card(String name,  ){
    return Container( 
 child:  Card(
  elevation: 50, shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
 ),
   child: Column(children: [
     IconButton(onPressed: (){}, icon: Icon(Icons.close,size: 7),),
     Text(name)
   ],),
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
        padding: const EdgeInsets.only(left: 10, right: 10,top: 5,bottom: 5),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(//radius: 30,
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                "assets/images/8.jpg" ,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'Asia Badnjki',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'The New Page WIth New Product For You',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.logo_dev)),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.link_off_rounded)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.logo_dev)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  // Widget posts(double width,double height,String url,String data){
  //   return Container( width: width/1,height: height/2,
  //   child: Card(
  //     elevation: 12,
  //     shadowColor: Colors.black54,
  //     child: Column(crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Row(children: [
  //        Padding(
  //         padding: const EdgeInsets.all(9.0),
  //         child: Container(
  //                    height:50,
  //                             width: 50,
  //                              decoration: BoxDecoration(
  //                           shape: BoxShape.circle,
  //                              image: DecorationImage(
  //                                 image: new AssetImage("assets/images/8.jpg" ),
  //                                    fit: BoxFit.cover
  //                              ),
  //                              )   ),  ),
  //                               Padding(
  //                                 padding: const EdgeInsets.all(8.0),
  //                                 child: Text('Asia  Badnjki',style: 
  //              TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),        
  //                                   ),
  //       ],),
         
  //        Container( width: width/1,height: height/5,
  //         child: Image.asset(url), ),
  //  Wrap(children: [
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Text(data ,style: TextStyle(fontSize: 17),),
  //             )
  //           ],) ,
  //         SizedBox(height: 20,),
  //      Align(alignment: Alignment.bottomCenter,
  //        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           IconButton(onPressed: (){}, icon: Icon(Icons.app_registration,
  //                        color: Colors.black,)),
  //                             IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios,size: 15,
  //                        color: Colors.black,)),
  //                             IconButton(onPressed: (){}, icon: Icon(Icons.add_comment_rounded,size: 15,
  //                        color: Colors.black,)),
  //         ],),
  //      ),
  //     ],
  //     ),
  //   ),
  //   );
  // }
  }