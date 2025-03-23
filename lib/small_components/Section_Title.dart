import 'package:flutter/material.dart';
class SectionTitle extends StatelessWidget {
  final String title;

  final Widget see;

  const SectionTitle({super.key, required this.title, required this.see});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => see));
            },
            child: Text('See All'),
          ),
        ],
      ),
    );
  }
}