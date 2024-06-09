import 'package:expense_manager/screens/category_screen.dart';
import 'package:expense_manager/screens/home_screen.dart';
import 'package:expense_manager/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoryScreen(),//SplashScreen(),
    );
  }
}
