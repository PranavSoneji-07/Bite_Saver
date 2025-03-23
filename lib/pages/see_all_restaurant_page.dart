import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bite_saver/Provider/Restaurant_Provider.dart';
class SeeAllRestaurantsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final restaurantsProvider = Provider.of<RestaurantsProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("All Restaurants")),
      body: restaurantsProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: restaurantsProvider.restaurantImages.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Image.network(
                restaurantsProvider.restaurantImages[index],
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
              title: Text('Restaurant ${index + 1}'),
              subtitle: Text('Cuisine Type - \$ Price Range'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      ),
    );
  }
}
