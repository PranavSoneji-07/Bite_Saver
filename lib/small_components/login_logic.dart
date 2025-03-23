import 'package:bite_saver/pages/Home_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:bite_saver/pages/login_page.dart' as input_data;


class LoginLogic {
  final Map<String, String> _credentials = {};
  bool Checked = false;


  Future<void> fetchCredentials() async {
    try {
      String data = await rootBundle.loadString('assets/credentials.txt');
      for (String line in data.split('\n')) {
        List<String> parts = line.split(':');
        if (parts.length == 2) {
          _credentials[parts[0].trim()] = parts[1].trim();
        }
      }
      debugPrint("Fetch done");
    }
    catch (e) {
      debugPrint("$e");
    }
  }

  Future<void> checker(BuildContext context) async {
    await fetchCredentials();
    String username = input_data.username.text.trim();
    String password = input_data.password.text.trim();


    if (_credentials.containsKey(username) && _credentials[username] == password) {
      debugPrint("Ho gaya");
      Checked = true;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeUI()));
    }
    else {
      debugPrint("Ye to galat baat hai");
      Text("Incorrect username or password", style: TextStyle(color: Colors.red),);
      debugPrint("username = $username, password = $password");
      debugPrint("From file = $_credentials");
    }
  }


}