import 'package:bite_saver/Provider/Maps_Provider.dart';
import 'package:bite_saver/Provider/Restaurant_Provider.dart';
import 'package:bite_saver/pages/Pop_Page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/Deals_Provider.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TopDealsProvider()),
        ChangeNotifierProvider(create: (context) => RestaurantsProvider()),
        ChangeNotifierProvider(create: (context) => MapsProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Pop(),
    );
  }
}
