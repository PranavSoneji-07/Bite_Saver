import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MapsProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _restaurants = [];
  List<Map<String, dynamic>> get restaurants => _restaurants;

  Set<Marker> _markers = {};
  Set<Marker> get markers => _markers;

  Future<void> fetchNearbyRestaurants(LatLng userLocation) async {
    var apiKey = dotenv.env['KEY'];
    final url = Uri.parse(
          "${dotenv.env['MAPS']}?location=${userLocation.latitude},${userLocation.longitude}&radius=3000&type=restaurant&key=$apiKey",
    );

    final response = await http.get(url);
    print("API Response: ${response.body}");

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data["status"] == "OK") {
        _restaurants = data["results"];

        _markers.clear();
        for (var restaurant in _restaurants) {
          final lat = restaurant["geometry"]["location"]["lat"];
          final lng = restaurant["geometry"]["location"]["lng"];
          final name = restaurant["name"];

          _markers.add(
            Marker(
              markerId: MarkerId(name),
              position: LatLng(lat, lng),
              infoWindow: InfoWindow(title: name),
            ),
          );
        }

        notifyListeners();
      } else {
        print("API Error: ${data["status"]}");
      }
    } else {
      print("HTTP Error: ${response.statusCode}");
    }
  }
}
