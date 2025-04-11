import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class TopDealsProvider extends ChangeNotifier {
  List<String> _dealImages = [];
  bool _isLoading = true;

  List<String> get dealImages => _dealImages;
  bool get isLoading => _isLoading;

  TopDealsProvider() {
    fetchImages();
  }

  Future<void> fetchImages() async {
    final response = await http.get(
      Uri.parse(dotenv.env['FOODLINK']!),
      headers: {
        "Authorization": dotenv.env['PICS']!,
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      debugPrint("$data");

      _dealImages = (data['photos'] as List)
          .map<String>((photo) => (photo as Map<String, dynamic>)['src']['large'] as String)
          .toList();
    } else {
      _dealImages = [];
    }

    _isLoading = false;
    notifyListeners();
  }

}
