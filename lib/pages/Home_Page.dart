import 'package:flutter/material.dart';
import 'package:bite_saver/small components/Deals_Section_Title.dart';

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



class TopDealsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Number of top deals
        itemBuilder: (context, index) {
          return TopDealItem(index: index);
        },
      ),
    );
  }
}

class TopDealItem extends StatelessWidget {
  final int index;

  const TopDealItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.local_offer, size: 50, color: Colors.orange),
            SizedBox(height: 10),
            Text('Deal ${index + 1}'),
          ],
        ),
      ),
    );
  }
}

class RestaurantsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10, // Number of restaurants
      itemBuilder: (context, index) {
        return RestaurantItem(index: index);
      },
    );
  }
}

class RestaurantItem extends StatelessWidget {
  final int index;

  RestaurantItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        leading: Icon(Icons.restaurant, size: 50, color: Colors.orange),
        title: Text('Restaurant ${index + 1}'),
        subtitle: Text('Cuisine Type - \$ Price Range'),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Navigate to restaurant details page
        },
      ),
    );
  }
}