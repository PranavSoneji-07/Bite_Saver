

import 'package:flutter/material.dart';


class Text_Field extends StatelessWidget {
  Text_Field(TextEditingController controller){
  TextField(
  controller: controller,
  decoration: InputDecoration(
  hintText: "controller",
  enabledBorder: OutlineInputBorder(
  borderSide: BorderSide(width: 3),
  borderRadius: BorderRadius.circular(5)
  ),
  focusedBorder: OutlineInputBorder(
  borderSide: BorderSide(width: 5),
  borderRadius: BorderRadius.circular(5)
  ),
  ),
  );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}


class HomeUI extends StatelessWidget {
   HomeUI({super.key});

  final username = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      width: double.infinity,
      height: double.infinity,

      child: Center(
        child: Column(

          children: [
            Text("Bite Saver"),
            Text("Fresh. Cheap. Fast. Like your ex, but better"),
            Text_Field(username),

            TextField(
              controller: password,
              decoration: InputDecoration(
                hintText: "Password",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3),
                    borderRadius: BorderRadius.circular(5)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 5),
                    borderRadius: BorderRadius.circular(5)
                ),
              ),
            ),


          ],
        ),
      ),
    ),

    );
  }
}