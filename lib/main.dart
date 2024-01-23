import 'package:ecommerce/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/pages/SplashScreen.dart';

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
        "homePage": (context) => LoginPage(),
      },
    );
  }
}
