import 'package:flutter/material.dart';
import '../../../core/component/textField.dart';

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
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextFieldWidget(
                    label: 'Type',
                    hint: 'Comidy',
                    type: TextInputType.name,
                    prefIcon: Icons.type_specimen,
                  ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
