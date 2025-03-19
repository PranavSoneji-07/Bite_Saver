import 'package:bite_saver/pages/Home_Page.dart';
import 'package:bite_saver/small%20components/login_logic.dart';
import 'package:flutter/material.dart';

final username = TextEditingController();
final password = TextEditingController();

class Text_Field extends StatelessWidget {
  final TextEditingController Control;
  final text;
  const Text_Field(this.Control, this.text, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return

    TextField(
      controller: Control,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 20, bottom: 20),
      label: Align(
        alignment: Alignment.center,
        child: Text("$text"),
      ),
      labelStyle: TextStyle(fontSize: 20),

      enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20)
      ),
      focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5)
      ),
      ),
    );
    }
  }



class LogIn extends StatelessWidget {
   LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      
      padding: EdgeInsets.only(top: 350),

      child: Center(
        child: Column(
          children: [
            Container(margin: EdgeInsets.all(5),
              child: Text("Bite Saver", style: TextStyle(fontSize: 30),)),
            Text("Fresh. Cheap. Fast. Like your ex, but better", style: TextStyle(fontSize: 20
            ),),
            Container(
              margin: EdgeInsets.only(left: 50, right: 50, bottom: 20,top: 100),
                height: 80,
                child: Text_Field(username, "Username")),
            Container(
                margin: EdgeInsets.only(left: 50, right: 50, bottom: 20),
                height: 80,
                child: Text_Field(password, "Password")),

            Container(
              width: 800,
              padding: EdgeInsets.only(left: 100, right: 100, top: 15, bottom: 15),
              child: ElevatedButton(onPressed: () async {
                LoginLogic().fetchCredentials();
                LoginLogic().checker();
                if(LoginLogic().Checked == true){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeUI()));
              }
              }, child: Text("Log In", style: TextStyle(fontSize: 20),)),
            ),
            

          ],
        ),
      ),
    ),

    );
  }
}