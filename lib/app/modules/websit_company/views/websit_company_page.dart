import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/settings/views/setting_view.dart';
import 'package:q_overlay/q_overlay.dart';

import '../../../routes/app_pages.dart';

class WebsiteCompanyPage extends StatefulWidget {
  @override
  State<WebsiteCompanyPage> createState() => _WebsiteCompanyPageState();
}

class _WebsiteCompanyPageState extends State<WebsiteCompanyPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool edit = false;
    bool delet = true;
    String description =
        ' Juicy Beauty was first founded in 2012 in Syria, Damascus. Juicy Beauty was first introduced in Lebanon in 2018.Juicy Beauty is an example of innovation in form due to its display with the largest makeup color made of vibrant and pure pigments and in substancethanks to the exclusive formulas and the revolutionary texture of its makeup products.Behind each product is the excellent research of an expert scientific team that develops new technologies and original formulas.High quality and extreme safety in addition to creativity, taste, and a focus on detail.That’s how JUICY ensures the finest standards of excellence through products that are both gentle and highly effective: Makeup formulas are produced in Europe. The range is subjected to accurate and in-depth safety evaluation.Juicy Beauty is the definition of having fun with makeup, trying new things,and feeling free! Not sure where to start? Why not visit our branches that are all over lebanon and test our products!';
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
                        'JUICY BEAUTY',
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
                            description,
                            style: TextStyle(fontSize: 16),
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
                      child: Image.network(
                          'data:image/png;base64,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')),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              color: Colors.grey[100],
              elevation: 10,
              child: Row(
                children: [
                  SizedBox(
                    width: width / 4.0,
                  ),
                  // textbtn('Accessories'),
                  // textbtn('BodyCare'),
                  // textbtn('Eyes'),
                  // textbtn('Nails'),
                  // textbtn('Face'),
                  // textbtn('JuicyBrowse'),
                  // textbtn('Lips'),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Wrap(
                children: [
                  photo(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqb4dUl9phz_ak5GUzb3ZzeGM7FUzsJabpkA&usqp=CAU',
                      height,
                      width,
                      'Foundation',
                      '370'),
                  photo(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1YrNUJI0NwfXs_u7A-iv7BlJcaeQ2I2srbA&usqp=CAU',
                      height,
                      width,
                      'CareKream',
                      '290'),
                  photo(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2raCIs34o3IqrJ0SeAI5bzT26LPktzocdCA&usqp=CAU',
                      height,
                      width,
                      'CareSun',
                      '400'),
                  photo(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTigwaTrxus-otRu8NuS0px6ZfBkY6Ci-ORDQ&usqp=CAU',
                      height,
                      width,
                      'Plasher',
                      '250'),
                  photo(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPK985zgWcdJDSVEfY_WLopJf5ilbWC0Y_Xg&usqp=CAU',
                      height,
                      width,
                      'parphan',
                      '600'),
                  photo(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzaTQ3VKsvKUMLTRnaW5KUfx6rTeIUtvbW3Q&usqp=CAU',
                      height,
                      width,
                      'Oclador',
                      '178'),
                  photo(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnc9JiWdgca1njVozBR4QJ5tC0S3We3zJrRA&usqp=CAU',
                      height,
                      width,
                      'Mascara',
                      '1300'),
                  photo(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwoOxC5J6MZhQfrdRUg0hcmnhyQMQ1qsulMQ&usqp=CAU',
                      height,
                      width,
                      'Tant',
                      '700')
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
                        color: Colors.pink,
                        size: 50,
                      ))),
            ),
            IconButton(icon: Icon(Icons.abc), onPressed: () { 
              Get.dialog(Text('assd'));
             },)
          ],
        ),
      ),
    );
  }

////////////////////////////////////////////////////
  Widget photo(
      String url, double height, double width, String name, String price) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          Get.dialog(Center(
            child: Container(
                width: width / 3.8,
                height: 440,
                child: Card(
                    child: SingleChildScrollView(
                        child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: width,
                          height: height / 4,
                          child: Image.network(url)),
                    ),
                    Center(
                        child: Text(
                      name,
                      style: TextStyle(fontSize: 30, color: Colors.black54),
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        children: [
                          Text(
                            'This help you  to save in safe body and save hands  \n addation to previuos  who take care for dray face.',
                            style: TextStyle(
                              fontSize: 15,
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
                                  fontSize: 15, color: Colors.black87),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            price + '\$',
                            style: TextStyle(fontSize: 20),
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
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
                            child: Container(
                                width: width / 14,
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
                                      color: Colors.pink,
                                      size: 20,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.pink,
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
                                color: Colors.pink,
                                size: 30,
                              ))),
                    ),
                  ],
                )))),
          ));
        },
        child: Container(
          width: width / 4.2,
          height: height / 1.7,
          child: Card(
            elevation: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height / 2.4,
                  width: width / 5,
                  child: Image.network(url),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        name,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    SizedBox(width: width / 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(price,
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

  // Widget textbtn(String name) {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: TextButton(
  //         style: TextButton.styleFrom(primary: Colors.pink),
  //         onPressed: () async {
  //           // await QPanel(
  //           //     alignment: Alignment.center,
  //           //     width: 200,
  //           //     color: Colors.red,
  //           //     height: 100,
  //           //     child: Column(
  //           //       children: [
  //           //         Text('DDDDDDDDDD'),
  //           //         Text('DDDDDDDDDD'),
  //           //         Text('DDDDDDDDDD'),
  //           //         Text('DDDDDDDDDD'),
  //           //         Text('DDDDDDDDDD'),
  //           //       ],
  //           //     )).show();
  //         },
  //         child: Text(
  //           name,
  //           style: TextStyle(fontSize: 16),
  //         )),
  //   );
  // }

  InkWell Daliog(bool e, bool d) {
    return InkWell(
      child: Text('hwwwww'),
    );
    // return Get.dialog(
    // Center(
    //   child: Container(
    //     child: Card(child: Column(children: [
    //        Row(children: [
    //           Text('Kram Care :',style: TextStyle(fontSize: 16),),
    //           e==false?
    //             Text(' 400',style: TextStyle(fontSize: 20),)
    //            : Row(children: [],),
    //            IconButton(onPressed: (){
    //             e=true;
    //            }, icon: Icon(Icons.edit,size: 15,)) ,
    //            IconButton(onPressed: (){
    //              d=true;
    //            }, icon: Icon(Icons.delete_rounded,size: 15,color: Colors.red,))
    //        ],)
    //     ],)),
    //   ),
    // )

    // );
  }
}
