import 'package:flutter/material.dart';

class Pop_Up extends StatefulWidget {
  const Pop_Up({super.key});

  @override
  State<Pop_Up> createState() => _Pop_UpState();
}

class _Pop_UpState extends State<Pop_Up> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        padding: EdgeInsets.only(top:400),
        color: Colors.white,
      child: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text("Animation of scooter")
            ),
            Container(
              child: Text("Here the catchy lines will go"),
            ),
          ],
        ),
      ),
      )




    );
  }
}
