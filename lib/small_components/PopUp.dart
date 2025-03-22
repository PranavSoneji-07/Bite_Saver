import 'package:bite_saver/small_components/Lines_Picker.dart';
import 'package:flutter/material.dart';

class Pop_Up extends StatefulWidget {
  const Pop_Up({super.key});

  @override
  State<Pop_Up> createState() => _Pop_UpState();
}

class _Pop_UpState extends State<Pop_Up> {
  String line = "Loading..."; // Default text

  void updateLine(String newLine) {
    setState(() {
      line = newLine; // Update line when received from LinesPicker
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 400),
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              LinesPicker(onLineChanged: updateLine), // Pass callback
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: Image.asset('assets/download.gif', height: 200),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Text(line, style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
