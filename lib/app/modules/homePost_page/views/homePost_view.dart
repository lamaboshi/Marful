import 'package:flutter/material.dart';
import 'package:marful/app/core/component/textField.dart';

import '../../../core/values/app_colors.dart';

class HomePostView extends StatelessWidget {
  const HomePostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          padding: const EdgeInsets.all(15),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Add new post",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Type",
                  ),
TextFieldWidget(type:TextInputType.name ,  obscureText: false,),

 
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Post",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 21),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 300,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child:  Padding(
                        padding:const EdgeInsets.all(10),
                        child: TextFieldWidget(type:TextInputType.name ,  obscureText: false ),

                     
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Publish'),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.blue),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
