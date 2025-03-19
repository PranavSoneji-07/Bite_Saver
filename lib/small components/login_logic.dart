import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:bite_saver/pages/login_page.dart' as input_data;


class LoginLogic {
  Map<String, String> _credentials = {};
  bool Checked = false;


  Future<void> fetchCredentials() async {
    try {
      String data = await rootBundle.loadString('assets/usernames_password.txt');
      Map<String, String> credentials = {};
      for (String line in data.split('\n')) {
        List<String> parts = line.split(':');
        if (parts.length == 2) {
          credentials[parts[0].trim()] = parts[1].trim();
        }
      }
    }
    catch (e) {
      debugPrint("Could not fetch");
    }
  }

  Future<void> checker() async {
    String username = input_data.username.text.trim();
    String password = input_data.password.text.trim();


    if (_credentials.containsKey(username) && _credentials[username] == password) {
      debugPrint("Ho gaya");
      Checked = true;
    }
    else {
      debugPrint("Ye to galat bata hai");
    }
  }


}