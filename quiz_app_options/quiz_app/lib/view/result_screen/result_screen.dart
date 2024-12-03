// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int totalQuestions;
  final int correctAnswers;

  ResultScreen({required this.totalQuestions, required this.correctAnswers});

  @override
  Widget build(BuildContext context) {
    int starsCount = 0;

    
    if (correctAnswers >= 8) {
      starsCount = 3; 
    } else if
     (correctAnswers >= 4) {
      starsCount = 2; 


    } else if (correctAnswers >= 1) {
      starsCount = 1; 


    }


    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Results"),
        backgroundColor: Colors.red,
      ),
      body: Center(
      
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You answered $correctAnswers out of $totalQuestions correctly!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Icon(
                    Icons.star,
                    size: 50,
                    color: index < starsCount ? Colors.yellow : Colors.grey,
                  );
                }),
              ),
              
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); 
                },
                child: Text("Back to Topics"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
