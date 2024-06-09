import 'dart:js';

import 'package:flutter/material.dart';
import 'package:todo_with_sqflite/view/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const TickIt());
}

class TickIt extends StatelessWidget {
  const TickIt({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context){
      return ;
    });
  }
}
