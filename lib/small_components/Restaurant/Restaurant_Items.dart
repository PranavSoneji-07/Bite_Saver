import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RestaurantItem extends StatefulWidget {
  final int index;

  RestaurantItem({required this.index});

  @override
  _RestaurantItemState createState() => _RestaurantItemState();
}

class _RestaurantItemState extends State<RestaurantItem> {
  String imageUrl = "";

  @override
  void initState() {
    super.initState();
    fetchImage();
  }

  Future<void> fetchImage() async {
    final response = await http.get(
      Uri.parse(dotenv.env['PICSLINK']!),
      headers: {
        "Authorization": dotenv.env['PICS']!,
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        imageUrl = data['photos'][widget.index % data['photos'].length]['src']['large'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Full-Width Image
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            child: imageUrl.isNotEmpty
                ? SizedBox(
              width: double.infinity, // Full width
              height: 200, // Increased height for better visibility
              child: Image.network(imageUrl, fit: BoxFit.cover),
            )
                : Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey[300],
              child: Center(child: CircularProgressIndicator()),
            ),
          ),
          // Restaurant Details
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Restaurant ${widget.index + 1}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  'Cuisine Type - \$ Price Range',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
