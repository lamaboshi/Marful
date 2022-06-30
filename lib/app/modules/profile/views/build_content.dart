import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class Buildcontent extends GetResponsiveView<ProfileController> {
  @override
  Widget builder() {
     final random = Random();
    final List grid = List.generate(1000, (index) => null);
   return Wrap(
        children: [
        Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: controller.contents
                       .map(
                            (e) => card(e.name!,screen.width,screen.height,random),
                          )
                          .toList(),
              ),
            ),
               ],
             );
                   }
   Widget card(String name, double width, double height, var random) {
    return Container(
      width: width / 5,
      child: Card(
        color: Color.fromARGB(random.nextInt(256), random.nextInt(256),
            random.nextInt(256), random.nextInt(256)),
        elevation: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Wrap(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      name,
                      style: TextStyle(fontSize: 17),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
  
  }