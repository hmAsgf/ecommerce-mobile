import 'package:flutter/material.dart';
import 'package:ecommerce/pages/ItemPage.dart';
import 'package:ecommerce/pages/SplashScreen.dart';
import 'package:ecommerce/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => SplashScreen(),
        "homePage": (context) => HomePage(),
        // "itemPage": (context) => ItemPage(product: product),
      },
    );
  }
}
