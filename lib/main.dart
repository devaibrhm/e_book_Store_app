import 'package:e_book_app/screens/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Book App',
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    );
  }
}