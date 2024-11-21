
import 'package:flutter/material.dart';
import 'package:quiz_app/dummy_db.dart';
import 'package:quiz_app/utils/color_constants.dart';
import 'package:quiz_app/view/quiz_screen/quiz_screen.dart';

class ScoreScreen extends StatefulWidget {


  const ScoreScreen({super.key, required this.rightAnsCount});
  final int rightAnsCount ;

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
   int starCount =0;
   void initState(){
    calculatePercentage();
    super.initState();

   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(
              3,
              (index) => Padding(
                padding: EdgeInsets.only(
                    right: 15, left: 15, bottom: index == 1 ? 30 : 0),
                child: Icon(
                  Icons.star,
                  color: starCount > index ?Colors.yellow: Colors.black,
                  size: index == 1 ? 70 : 40,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "congratulations",
            style: TextStyle(
              color:Colors.yellow,
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),

          ),
          SizedBox(height: 10),
          Text("your score",
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 10),
          Text("1/10",
          style: TextStyle(
            color: Colors.yellow,
            fontSize: 10
          ),),
          
          //restart button
          SizedBox(height: 40),

          Row(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizScreen(),
                      ));
                },
                child: Container(
                  width: 200,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorConstants.red,
                  ),
                  alignment: Alignment.center,
                  child: Text("Restart",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: ColorConstants.offWhite,
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

   calculatePercentage(){
    num percentage = (widget.rightAnsCount/DummyDb.questions.length) * 100;
    if (percentage >=90){
      starCount =3;
    }
    else if(starCount >=50){
      starCount =2;
    }
    else if(starCount >= 30){
      starCount =1;
    }
setState(() {
  
});
   
  }
}



