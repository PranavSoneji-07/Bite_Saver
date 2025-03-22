import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bite_saver/Provider/Restaurant_Provider.dart';
class RestaurantItem extends StatelessWidget {
  final int index;

  RestaurantItem({required this.index});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RestaurantsProvider>(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display Image
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
            child: provider.isLoading
                ? Container(
              width: double.infinity,
              height: 200, // Increased size
              color: Colors.grey[300],
              child: Center(child: CircularProgressIndicator()),
            )
                : Image.network(
              provider.restaurantImages.isNotEmpty
                  ? provider.restaurantImages[index % provider.restaurantImages.length]
                  : "https://via.placeholder.com/400",
              width: double.infinity,
              height: 200, // Increased size
              fit: BoxFit.cover,
            ),
          ),
          // Restaurant Name
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Restaurant ${index + 1}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // Cuisine and Price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Cuisine Type - \$ Price Range',
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }
}
