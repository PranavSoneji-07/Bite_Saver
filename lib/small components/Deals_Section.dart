import 'package:bite_saver/pages/Home_Page.dart';
import 'package:flutter/cupertino.dart';

class TopDealsSection extends StatelessWidget {
  const TopDealsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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