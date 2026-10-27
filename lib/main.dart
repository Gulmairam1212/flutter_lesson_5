import 'package:flutter/material.dart';
import 'package:flutter_lesson_5/marketApp.dart';
import 'package:flutter_lesson_5/navigatorApp.dart';
import 'package:flutter_lesson_5/order_success_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget { 
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MarketApp()
    );
  }

}