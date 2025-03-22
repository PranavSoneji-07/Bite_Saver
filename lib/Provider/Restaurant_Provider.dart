import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RestaurantsProvider extends ChangeNotifier {
  List<String> _restaurantImages = [];
  bool _isLoading = true;

  List<String> get restaurantImages => _restaurantImages;
  bool get isLoading => _isLoading;

  RestaurantsProvider() {
    fetchImages();
  }

  Future<void> fetchImages() async {
    final response = await http.get(
      Uri.parse("https://api.pexels.com/v1/search?query=restaurant"),
      headers: {
        "Authorization": "viD7QtzoH3bvBnklP2VQIZYycAJ9gfMKO5jF0SwMD9kYogRCg8jZdX5j",
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      _restaurantImages = (data['photos'] as List)
          .map<String>((photo) => (photo as Map<String, dynamic>)['src']['large'] as String)
          .toList();
    } else {
      _restaurantImages = [];
    }

    _isLoading = false;
    notifyListeners();
  }

}
