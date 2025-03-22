

import 'package:bite_saver/pages/login_page.dart';
import 'package:bite_saver/small_components/PopUp.dart';
import 'package:flutter/material.dart';


class Pop extends StatefulWidget {
  const Pop({super.key});

  @override
  State<Pop> createState() => _PopState();
}

class _PopState extends State<Pop> {

  @override
  void initState(){
    super.initState();
    Pop_Up();
    Future.delayed(Duration(seconds:5 ), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Log_In()),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Pop_Up();
  }
}



