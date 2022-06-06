import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class PasswordPage extends StatefulWidget {
  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                  child: Text(
                    'Forgot  Your  Passwod',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.purple[900],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 10,
            child: Container(
              width: 180,
              child: Image.network(
                  'data:image/jpeg;base64,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'),
              //Image.network('data:image/jpeg;base64,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'),
              // Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoxoUnFh7yobiJqBKZeuFy0cJFKii8Mebw5g&usqp=CAU'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Enter the registerd email address',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'we will email you a link to reset  ',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
          Text(
            ' your password',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 400,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Your Password',
                    labelText: 'Email'),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(405, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5))),
              onPressed: () {
                Get.toNamed(Routes.ConfirmPassword);
                //    Navigator.push(context, MaterialPageRoute(builder: (context) => const secondpage(),));
              },
              child: Text(
                'Send',
                style: TextStyle(fontSize: 20),
              )),
        ]),
      ),
    );
  }
}
