import 'package:elif/Pages/ItemPage.dart';
import 'package:flutter/material.dart';
import 'Pages/CartPage.dart';
import 'Pages/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF5F5F3),
      ),
      routes: {
        "/": (context) => HomePage(),
        "cartPage": (context) => CartPage(),
        "itemPage": (context) => ItemPage(),
      },
    );
  }
}