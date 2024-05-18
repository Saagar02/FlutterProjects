import 'package:flutter/material.dart';
import 'Presentation/Screens/Homepage/UI/navigation_bar.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PortFolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        bottomNavigationBar: MyBottomNavBar(),
      )
      /*initialRoute: '/',
      onGenerateRoute: RouteGenerator().generateRoute,*/
    );
  }
}
