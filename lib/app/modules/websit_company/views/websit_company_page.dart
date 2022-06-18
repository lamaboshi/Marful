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

class WebsiteCompanyPage extends StatefulWidget {
  @override
  State<WebsiteCompanyPage> createState() => _WebsiteCompanyPageState();
}

class _WebsiteCompanyPageState extends State<WebsiteCompanyPage> {
  final conroller = Get.find<WebsitcompanyController>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
                      child: Text(
                        conroller.allcompanys[0].name.toString(),
                        style: TextStyle(fontSize: 40, color: Colors.pink[300]),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 8, 8, 8),
                      child: Container(
                          width: width / 1.8,
                          child: Text(
                            conroller.allcompanys[0].Description.toString(),
                            style: TextStyle(fontSize: 20),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  width: width / 5.5,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 70, 8, 8),
                  child: Container(
                      child: Image.network(conroller.allcompanys[0].image.toString()
                             )),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
               Container(
                child: Obx(
              () => conroller.loading.value
                  ? const Center(child: CircularProgressIndicator())
                  :   Card(
              color: Colors.grey[100],
              elevation: 10,
              child: Row( mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width / 5.0,
                  ),
            //       Row(mainAxisSize: MainAxisSize.max,
            // crossAxisAlignment: CrossAxisAlignment.center,
            // children: conroller.  .map(
            //                 (element) => photo(
            //                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqb4dUl9phz_ak5GUzb3ZzeGM7FUzsJabpkA&usqp=CAU',
            //                     height,
            //                     width,
            //                     element),
            //               )
            //               .toList(),

            //       )

                  // textbtn('Accessories',width,height),
                  // textbtn('BodyCare',width,height),
                  // textbtn('Eyes',width,height),
                  // textbtn('Nails',width,height),
                  // textbtn('Face',width,height),
                  // textbtn('JuicyBrowse',width,height),
                  // textbtn('Lips',width,height),
                ],
              ),
            ),
                    
            )),
          
            SizedBox(
              height: 20,
            ),
            Container(
                child: Obx(
              () => conroller.loading.value
                  ? const Center(child: CircularProgressIndicator())
                  : Wrap(
                      children: conroller.allProducts
                          .map(
                            (element) => photo(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqb4dUl9phz_ak5GUzb3ZzeGM7FUzsJabpkA&usqp=CAU',
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
                    .show();
                      },
                      icon: Icon(
                        Icons.add_shopping_cart,
                        color: AppColors.orange,
                        size: 60,
                      ))),
            ),
          ],
        ),
      ),
    );
  }
  Widget photo(String url, double height, double width, Product product) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          Get.dialog(Center(
            child: Container(
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
                          width: width/2,
                            height: height / 4,
                            child: Image.network(url,fit: BoxFit.cover,)),
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
                            child: Text(
                              'The price of One is :',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black87),
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
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
                            child: Text(
                              'Total Count You Need ',
                              style: TextStyle(fontSize: 16),
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
                )))),
          ));
        },
        child: Container(
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
        ),
      ),
    );
  }
  Widget panel( String name, int price, String url,double width,double height){
 return Padding(
   padding: const EdgeInsets.all(5.0),
   child: Container( width: width/3,height: height/5,
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
                         )   ),
        ),
                       SizedBox(width: 15,),
                       Text(name),
      ],),
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

   ),),
 );
  }
  Widget textbtn(String name,double width,double height) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        hint: Text(name),
        items: <String>['A', 'B', 'C', 'D'].map((String value) {
         return DropdownMenuItem<String>(
           value: value,
           child: Text(value),
         );
  }).toList(),
  onChanged: (_) {},
),
    );
    
  }

  }

