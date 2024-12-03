
// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter/material.dart';

import '../topic_screen/topic_screen.dart';



class QuizScreen extends StatelessWidget {
  final List<Map<String, dynamic>> topics = [

    {'title':'Java', 'color':Colors.black},
    {'title': 'Python', 'color': Colors.black},
    {'title': 'Ruby', 'color': Colors.black},
    {'title': 'C#', 'color': Colors.black},
    {'title': 'JavaScript', 'color': Colors.black},
    {'title': 'C++', 'color': Colors.black},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Topics',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        )),
        
      
        
        backgroundColor: Colors.red,
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: topics.length,
          itemBuilder: (context, index) {
            final topic = topics[index];
            return GestureDetector(
              onTap: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TopicScreen(topic: topic['title']),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: topic['color'],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    topic['title'],
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

                




