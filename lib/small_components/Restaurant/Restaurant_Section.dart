import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bite_saver/Provider/Restaurant_Provider.dart';
import 'Restaurant_Items.dart';

class RestaurantsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantsProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return RestaurantItem(index: index);
          },
        );
      },
    );
  }
}
