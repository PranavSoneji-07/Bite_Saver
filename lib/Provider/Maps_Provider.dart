import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapsProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _restaurants = [];
  List<Map<String, dynamic>> get restaurants => _restaurants;

  Set<Marker> _markers = {}; // Store markers for the map
  Set<Marker> get markers => _markers;

  Future<void> fetchNearbyRestaurants(LatLng userLocation) async {
    const apiKey = "YOUR_GOOGLE_MAPS_API_KEY"; // Replace with your API key
    final url = Uri.parse(
      "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
          "?location=${userLocation.latitude},${userLocation.longitude}"
          "&radius=3000"
          "&type=restaurant"
          "&key=$apiKey",
    );

    final response = await http.get(url);
    print("API Response: ${response.body}"); // Debugging

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data["status"] == "OK") {
        _restaurants = data["results"];

        // **Convert Restaurants to Markers**
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
