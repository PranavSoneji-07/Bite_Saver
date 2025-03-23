import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bite_saver/Provider/Restaurant_Provider.dart';
import 'package:bite_saver/small_components/Restaurant/Restaurant_Items.dart';
class RestaurantsSection extends StatelessWidget {
  const RestaurantsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantsProvider = Provider.of<RestaurantsProvider>(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          ],
        ),
        restaurantsProvider.isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: restaurantsProvider.restaurantImages.length,
          itemBuilder: (context, index) {
            return RestaurantItem(index: index);
          },
        ),
      ],
    );
  }
}
