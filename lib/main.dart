import 'package:bite_saver/Provider/Maps_Provider.dart';
import 'package:bite_saver/Provider/Restaurant_Provider.dart';
import 'package:bite_saver/pages/Pop_Page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/Deals_Provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
void main() async{
  await dotenv.load(fileName: ".env");
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
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Pop(),
    );
  }
}
