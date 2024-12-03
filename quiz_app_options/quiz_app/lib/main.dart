// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'view/home_screen/home_screen.dart';
import 'view/quiz_screen/quiz_screen.dart';


void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
       routes: {
        '/quiz': (context) => QuizScreen(),},

    );
      
    
  }
}
