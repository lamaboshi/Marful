import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/menu/views/menu_view.dart';
import 'package:marful/app/modules/password_page/views/password_page.dart';
import 'package:marful/app/modules/profile/views/profile_view.dart';
import 'package:marful/app/modules/websit_company/controllers/websit_company_controller.dart';
import 'package:marful/app/modules/websit_company/data/model/Product.dart';
import 'package:marful/app/routes/app_pages.dart';
import 'package:q_overlay/q_overlay.dart';

import '../../../core/values/app_colors.dart';
import '../../password_page/views/confirm_password.dart';
class WebsiteCompanyPage extends GetResponsiveView<WebsitcompanyController> {
  final conroller = Get.find<WebsitcompanyController>();
  @override
  Widget builder() {
    var width = screen.width;
    var height = screen.height;
    bool edit = false;
    bool delet = true;
    String description =
        ' Juicy Beauty was first founded in 2012 in Syria, Damascus. Juicy Beauty was first introduced in Lebanon in 2018.';
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(210, 30, 10, 0),
                      child: Text('JucuBeuty',
                        style: TextStyle(fontSize: 40, color: Colors.pink[300]),
                      ),
                    ),
                   
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 8, 8, 8),
                      child: Container(
                          width: width / 1.8,
                          child: Text(description,
                            style: TextStyle(fontSize: 20),
                          )),
                    ),
                  ],
                ),
                Spacer(),
                if (screen.isPhone) Container(height: height/3,
                  width: width/6,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0,50, 20, 0),
                    child: Card(child: Image.network(
                                                    'data:image/png;base64,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'
                               ),),
                  )) else Padding(
                  padding: const EdgeInsets.fromLTRB(5, 70, 8, 8),
                  child: Container(
                      child: Image.network(
                                                  'data:image/png;base64,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'
                             )
                             ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
               Card(      color: Colors.grey[100],
              elevation: 10,
              child: Row( mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  screen.isPhone?
                  SizedBox(
                    width: width / 13,
                  ):SizedBox(      width: width / 5.0,),
                     textbtn('Accessories',width,height),
                  textbtn('BodyCare',width,height),
                  textbtn('Eyes',width,height),
                  textbtn('Nails',width,height),
                  textbtn('Face',width,height),
                  textbtn('JuicyBrowse',width,height),
                  textbtn('Lips',width,height),
                    SizedBox(
              height: 20,
            ),])),
            Container(
                child: Obx(
              () => conroller.loading.value
                  ? const Center(child: CircularProgressIndicator())
                  : Wrap(
                      children: conroller.allProducts
                          .map(
                            (element) => photo(
                               'assets/images/3.jpg',
                                height,
                                width,
                                element),
                          )
                          .toList()),
            )),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 30, 30),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                      onPressed: () {
                       screen.isDesktop?
                         QPanel(
                  color: Colors.grey[100],
                   width: width/3,
                height: height,
                        child: 
                        SingleChildScrollView(child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(child: Text('The Products ',style: TextStyle(fontSize: 20,
                                  color: Colors.black54),)),
                                ),
                                   panel('Consiler', 9000,"assets/images/1.jpg" , width, height),
                                 panel('Foundation', 70099, "assets/images/3.jpg", width, height),
                                  panel('Rog', 30030, "assets/images/4.jpg", width, height),
                                 panel('Hilitere', 3289,"assets/images/5.jpg", width, height),
                                   panel('Blusher', 39089,"assets/images/2.jpg", width, height),
                                    panel('Maskara', 33389, "assets/images/5.jpg", width, height),
                                     panel('Iliner', 09889, "assets/images/4.jpg", width, height),     
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
                          "Total",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),             
                          ],),
                        )),
                        alignment: Alignment.topRight)
                    .show():QPanel(
                       color: Colors.grey[100],
                   width: width/1.4,
                height: height,
                        child: 
                        SingleChildScrollView(child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(child: Text('The Products ',style: TextStyle(fontSize: 20,
                                  color: Colors.black54),)),
                                ),
                                   panel('Consiler', 9000,"assets/images/1.jpg" , width, height),
                                 panel('Foundation', 70099, "assets/images/3.jpg", width, height),
                                  panel('Rog', 30030, "assets/images/4.jpg", width, height),
                                 panel('Hilitere', 3289,"assets/images/5.jpg", width, height),
                                   panel('Blusher', 39089,"assets/images/2.jpg", width, height),
                                    panel('Maskara', 33389, "assets/images/5.jpg", width, height),
                                     panel('Iliner', 09889, "assets/images/4.jpg", width, height),     
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
                          "Total",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                                     
                          ],),
                        )),
                        alignment: Alignment.topRight
                    ).show();
                      },
                      icon: Icon(
                        Icons.add_shopping_cart,
                        color: AppColors.orange,
                        size: 60,
                      ))),
            ),
          ],
        ),
    ));
    
  }
  Widget photo(String url, double height, double width, Product product) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          Get.dialog(Center(
            child:screen.isDesktop?
             Container(
                width: width / 3.8,
                height: height/1.5,
                child: Card(
                    child: SingleChildScrollView(
                        child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: SizedBox(
                           width: width,
                            child: Center(child: Image.network(url,fit: BoxFit.cover,))),
                       ),
                    Center(
                        child: Text(
                      product.name!,
                      style: TextStyle(fontSize: 30, color: Colors.black54),
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        children: [
                          Text(
                            product.description!,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 3),
                            child: Center(
                              child: Text(
                                'The price of One is :',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black87),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            product.price.toString() + '\$',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                'Total Count You Need ',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
                            child: Container(
                                width: width / 17,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 8, 2),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 1, 2),
                            child: Column(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.add,
                                      color: AppColors.blue,
                                      size: 20,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.remove,
                                      color: AppColors.blue,
                                      size: 20,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_shopping_cart,
                                color:AppColors.orange,
                                size: 35,
                              ))),
                    ),
                  ],
                )))
                ):  Container(
                width: width / 1.5,
                height: height/1.3,
                child: Card(
                    child: SingleChildScrollView(
                        child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: SizedBox(
                           width: width,
                            child: Center(child: Image.network(url,fit: BoxFit.cover,))),
                       ),
                    Center(
                        child: Text(
                      product.name!,
                      style: TextStyle(fontSize: 30, color: Colors.black54),
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        children: [
                          Text(
                            product.description!,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 3),
                            child: Center(
                              child: Text(
                                'The price of One is :',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black87),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            product.price.toString() + '\$',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                'Total Count You Need ',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
                            child: Container(
                                width: width / 17,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 8, 2),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 1, 2),
                            child: Column(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.add,
                                      color: AppColors.blue,
                                      size: 20,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.remove,
                                      color: AppColors.blue,
                                      size: 20,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_shopping_cart,
                                color:AppColors.orange,
                                size: 35,
                              ))),
                    ),
                  ],
                )))
                )
          ));
        }, 
        child:screen.isDesktop?
         Container(
          width: width / 5.2,
          height: height / 2,
          child: Card(
            elevation: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height / 2.4,
                  width: width / 0.2,
                  child: Image.network(url),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.name!,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    SizedBox(width: width / 14),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(product.price.toString(),
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ):Container(  width: width / 2.1,
          height: height / 2,
          child: Card(
            elevation: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height / 2.4,
                  width: width / 0.2,
                  child: Image.network(url),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.name!,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    SizedBox(width: width / 14),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(product.price.toString(),
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                    ),
                  ],
                ),
              ],
            ),
          ),

        )
        ,
      ),
    );
  }
  Widget panel( String name, int price, String url,double width,double height){
 return Padding(
   padding: const EdgeInsets.all(5.0),
   child: screen.isDesktop?
    Container(
     width: width/3,height: height/5,
    child: Card( shadowColor: Colors.grey,
     child: Column(crossAxisAlignment:  CrossAxisAlignment.start,
      children: [
      Row(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
          child: Container(
                 height: 60.0,
                        width: 60.0,
                         decoration: BoxDecoration(
                      shape: BoxShape.circle,
                         image: DecorationImage(
                            image: new AssetImage(url),
                               fit: BoxFit.cover
                         ),
                         )   ),  ),
                       SizedBox(width: 15,),
                       Text(name),     ],),
                  Row(children: [
                     SizedBox(width: 80,),
                        Text('price :'),
                 Text(price.toString()+'\$',style: TextStyle(fontWeight: FontWeight.bold),),
                   SizedBox(width: 25,),
                 Text('count: 3'),
                   SizedBox(width: 30,),
                   Row(children: [
                   IconButton(onPressed: (){}, icon:Icon(Icons.add,size: 20,color: Colors.grey,), ),
                       IconButton(onPressed: (){}, icon:Icon(Icons.remove,size: 20,color: Colors.grey,), ),
                   ],),
             
                  IconButton(onPressed: (){}, icon:Icon(Icons.delete,size: 20,color: Colors.red,), ),
                   ],),
     ],)
   ),
   ):    Container(
     width: width,height: height/5,
    child: Card( shadowColor: Colors.grey,
     child: Column(crossAxisAlignment:  CrossAxisAlignment.start,
      children: [
      Row(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
          child: Container(
                 height: 60.0,
                        width: width/10,
                         decoration: BoxDecoration(
                      shape: BoxShape.circle,
                         image: DecorationImage(
                            image: new AssetImage(url),
                               fit: BoxFit.cover
                         ),
                         )   ),  ),
                       SizedBox(width: 4,),
                       Text(name),     ],),
                  Row(children: [
                     SizedBox(width: 20,),
                        Text('price :'),
                 Text(price.toString()+'\$',style: TextStyle(fontWeight: FontWeight.bold),),
                   SizedBox(width: 2,),
                 Text('count: 3'),
                   SizedBox(width: 2,),
                   Row(children: [
                   IconButton(onPressed: (){}, icon:Icon(Icons.add,size: 10,color: Colors.grey,), ),
                       IconButton(onPressed: (){}, icon:Icon(Icons.remove,size: 10,color: Colors.grey,), ),
                   ],),
             
                  IconButton(onPressed: (){}, icon:Icon(Icons.delete,size: 10,color: Colors.red,), ),
                   ],),
     ],)
   ),
   )
 );
  }
  Widget textbtn(String name,double width,double height) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: QExpander(child: Text(name),expandChild:Column(children: <String>['A','B','C'].map((e) => Text(e)).toList() ,)
    ));
  }
  }

