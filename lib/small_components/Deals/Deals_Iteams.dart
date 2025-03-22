import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bite_saver/Provider/Deals_Provider.dart';

class TopDealItem extends StatelessWidget {
  final int index;

  TopDealItem({required this.index});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TopDealsProvider>(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
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
              width: 150,
              height: 100,
              color: Colors.grey[300],
              child: Center(child: CircularProgressIndicator()),
            )
                : Image.network(
              provider.dealImages.isNotEmpty
                  ? provider.dealImages[index % provider.dealImages.length]
                  : "https://via.placeholder.com/150",
              width: 150,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          // Deal Name
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Deal ${index + 1}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
