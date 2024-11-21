
import 'package:flutter/material.dart';
import 'package:quiz_app/view/quiz_screen/quiz_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
        home: QuizScreen(),
      );
  }
}

