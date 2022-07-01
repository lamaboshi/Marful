import 'package:flutter/material.dart';
import '../../../core/values/app_colors.dart';

class HomePostView extends StatelessWidget {
  const HomePostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        padding: const EdgeInsets.all(15),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Add new post",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Type",
                ),
                TextField(
                  // onChanged:(){},
                  keyboardType: TextInputType.name,
                  cursorColor: AppColors.blue,
                  cursorHeight: 20,
                  autofocus: false,
                  decoration: InputDecoration(
                      labelStyle: const TextStyle(color: Colors.black),
                      hintStyle: TextStyle(color: Colors.grey[350]),
                      labelText: 'Type',
                      //  hintText: hint,
                      // prefixIcon: Icon(
                      //   prefIcon,
                      //   color: AppColors.orange,
                      // ),
                      border: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.orange, width: 1.5),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.orange, width: 1.5),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.orange, width: 1.5),
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Post",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 180,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        // onChanged:(){},
                        keyboardType: TextInputType.name,
                        cursorColor: AppColors.blue,
                        cursorHeight: 20,
                        autofocus: false,
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(color: Colors.black),
                          labelText: 'Write post here',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                        ),
                      ),
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
    );
  }
}
