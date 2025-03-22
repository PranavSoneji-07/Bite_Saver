import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bite_saver/Provider/Deals_Provider.dart';
import 'package:bite_saver/small_components/Deals/Deals_Iteams.dart';
class TopDealsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TopDealsProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return TopDealItem(index: index);
            },
          ),
        );
      },
    );
  }
}
