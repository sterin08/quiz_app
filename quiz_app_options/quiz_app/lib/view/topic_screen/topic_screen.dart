import 'package:flutter/material.dart';
import 'dart:async';
import '../dummy_db.dart';
import '../result_screen/result_screen.dart';

class TopicScreen extends StatefulWidget {
  final String topic;

  TopicScreen({required this.topic});

  @override
  _TopicScreenState createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  List<Map<String, dynamic>> questions = [];
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  int? selectedOptionIndex;
  bool isAnswered = false;
  Timer? timer;
  int remainingTime = 120; 
  int batchSize = 10; 

  @override
  void initState() {
    super.initState();
    questions = DummyDB.getQuestions(widget.topic.toLowerCase());
    startBatchTimer();
  }

  void startBatchTimer() {
    timer?.cancel(); 
    remainingTime = 105; 
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        timer.cancel();
        navigateToResultScreen();
      }
    });
  }

  void navigateToResultScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          totalQuestions: questions.length,
          correctAnswers: correctAnswers,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text("Quiz")),
        body: Center(child: Text("No questions available for this topic.")),
      );
    }

    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topic.toUpperCase()),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
            ),
            SizedBox(height: 10),
            Text(
              'Time Remaining: $remainingTime seconds',
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
            SizedBox(height: 20),
            Text(
              currentQuestion['question'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ...List.generate(currentQuestion['options'].length, (index) {
              final option = currentQuestion['options'][index];
              final isCorrect = currentQuestion['answer'] == option;

              Color optionColor() {
                if (!isAnswered) return Colors.grey[850]!;
                if (index == selectedOptionIndex) {
                  return isCorrect ? Colors.green : Colors.red;
                }
                if (isCorrect) return Colors.green;
                return Colors.grey[850]!;
              }

              return GestureDetector(
                onTap: isAnswered
                    ? null
                    : () {
                        setState(() {
                          selectedOptionIndex = index;
                          isAnswered = true;
                          if (isCorrect) correctAnswers++;
                        });
                      },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: optionColor(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    option,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            }),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                if (!isAnswered) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please select an option!")),
                  );
                  return;
                }

                if (currentQuestionIndex < questions.length - 1) {
                  setState(() {
                    currentQuestionIndex++;
                    selectedOptionIndex = null;
                    isAnswered = false;
                  
                    if (currentQuestionIndex % batchSize == 0) {
                      startBatchTimer();
                    }
                  });
                } else {
                  navigateToResultScreen();
                }
              },
              child: Text(currentQuestionIndex < questions.length - 1
                  ? "Next"
                  : "Finish"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
