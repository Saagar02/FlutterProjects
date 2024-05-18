import 'package:flutter/material.dart';
import 'package:quizz_app/CreateQuestions/show_Quizz.dart';
import 'package:quizz_app/main2.dart';
import 'CreateQuestions/create_quizz_screen.dart';
import 'CelebrationScreen.dart';
import 'quizz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizz App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
            //const CelebrationScreen()
            //Create_QuizzScreen(),
            //MainApp()
            //showQuizz()
            //MyHorizontalButtonList()
            //QuizScreen()
            //QuizScreen1()
    );
  }
}


