import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marful/app/core/values/app_colors.dart';

class MenuPage extends StatefulWidget {
  @override
  State<MenuPage> createState() => _MenuPageState();
}
class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(title: Text('skdkckds')),
      body: const Center(
        child: Text('My Page!'), 
    ),
    ////menu
     drawer: Drawer(
        child: ListView(
            padding: EdgeInsets.zero,
          children: [
                DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.blue,
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Container(
             height: 60.0,
                    width: 60.0,
                     decoration: BoxDecoration(
                  shape: BoxShape.circle,
                     image: DecorationImage(
                        image: new AssetImage("assets/images/Castle.gif"),
                           fit: BoxFit.cover
                     ),
                     )   ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text('Asia  Badnjki',style: TextStyle(fontSize: 16),),
           ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('+1 93426 4566',style: TextStyle(fontSize: 16),),
                    ),
              ]),
            ),
                ListTile(
              title: Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 0, 8, 8),
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.person)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Profile',style: TextStyle(fontSize: 18),),
                  )
              ],),
              onTap: () {
                Navigator.pop(context);
              },
            ),
                  ListTile(
              title: Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 0, 8, 8),
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.settings)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Setting',style: TextStyle(fontSize: 18),),
                  )
              ],),
              onTap: () {
                Navigator.pop(context);
              },
            ),
                     ListTile(
              title: Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 0, 8, 8),
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('EditProfile',style: TextStyle(fontSize: 18),),
                  )
              ],),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ]
        )
     )
    
    
     );
  }}