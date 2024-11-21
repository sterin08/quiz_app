
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/dummy_db.dart';
import 'package:quiz_app/utils/color_constants.dart';
import 'package:quiz_app/view/score_screen/score_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;

  int? selectedAnsIndex;
  int rightAnsCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.Black,
      appBar: AppBar(
        backgroundColor: ColorConstants.Black,
        actions: [Text("1/10")],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: ColorConstants.grey,
                    borderRadius: BorderRadius.circular(15)),
                height: 100,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    if(selectedAnsIndex==
                    DummyDb.questions[currentQuestionIndex]["answerIndex"])
                    Align(
                      alignment: Alignment.center,
                      child:
                       Lottie.asset(
                        "assets/animation/popper_animation.json")),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        DummyDb.questions[currentQuestionIndex]["question"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: ColorConstants.offWhite,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: List.generate(
                4,
                (optionIndex) => Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: InkWell(
                    onTap: () {
                      if (selectedAnsIndex == null) { 
                         selectedAnsIndex = optionIndex;
                        if(selectedAnsIndex = 
                        DummyDb.questions[currentQuestionIndex]
                        ["answerIndex"]) {
                          rightAnsCount++;
                          log(" right ans count = $rightAnsCount" as num);
                        }
                       setState(() {});
                     }
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: getColor(optionIndex)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                                DummyDb.questions[currentQuestionIndex]
                                    ["options"][optionIndex],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: ColorConstants.offWhite,
                                )),
                          ),
                          Icon(
                            Icons.circle_outlined,
                            color: ColorConstants.offWhite,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (selectedAnsIndex != null)
            InkWell(
              onTap: () {
                if (currentQuestionIndex < DummyDb.questions.length - 1) {
                  currentQuestionIndex++;
                  selectedAnsIndex = null;
                  setState(() {});
                } else {
                  // navigate to score screen
                  print("score screen");

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScoreScreen(
                          rightAnsCount: rightAnsCount),
                      ));
                }
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConstants.grey,
                  ),
                alignment: Alignment.center,
                child: Text("Next",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: ColorConstants.offWhite,
                    )),
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
  
// to set color for option selection based on selected ans
 Color getColor(int optionIndex) {
  //to check wnether an ans is selected or not
  if (selectedAnsIndex != null) {
    //to check wetheir the opyion is right or not
    if (DummyDb.questions[currentQuestionIndex]["answerIndex"] ==
    optionIndex) {
    return  ColorConstants.green;
    }
  }
  // to check wether to the selected is equal to builder index
  if(selectedAnsIndex == optionIndex) {
    //to check wether the selected ans iis right or not
    if(selectedAnsIndex ==
    DummyDb.questions[currentQuestionIndex]["answerIndex"]) {
      // if ans is correct [green]
      return ColorConstants.green;
    } else {
      // ans wrong [red]
    return ColorConstants.red;
  }
 } else {
  //default color
    return ColorConstants.grey;
  }
 }

}

