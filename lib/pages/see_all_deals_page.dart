import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bite_saver/Provider/Deals_Provider.dart';
class SeeAllDealsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dealsProvider = Provider.of<TopDealsProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Top Deals")),
      body: dealsProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: dealsProvider.dealImages.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 2,
        ),
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Image.network(
                  dealsProvider.dealImages[index],
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 5),
                Text('Deal ${index + 1}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
