import 'package:bite_saver/small_components/Deals/Deals_Section.dart';
import 'package:bite_saver/small_components/Deals/Deals_Section_Title.dart';
import 'package:bite_saver/small_components/Restaurant/Restaurant_Section.dart';
import 'package:flutter/material.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Delivery'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to cart page
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for restaurants or dishes...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SectionTitle(title: 'Top Deals'),
            TopDealsSection(),
            SizedBox(height: 20),
            SectionTitle(title: 'Restaurants Near You'),
            RestaurantsSection(),
          ],
        ),
      ),
    );
  }
}
