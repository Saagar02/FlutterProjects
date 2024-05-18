import 'package:flutter/material.dart';
import 'package:quizz_app/CreateQuestions/create_quizz_screen.dart';

class CelebrationScreen extends StatefulWidget{

  const CelebrationScreen({super.key});

  _CelebrationScreenState createState()=> _CelebrationScreenState();
}

class _CelebrationScreenState extends State<CelebrationScreen>{
  int correctAns = 3;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 10,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text( correctAns >= 4 ? "Excellent!":"Good Job!",style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold,color: Colors.black,),textAlign: TextAlign.center,)),
            SizedBox(height: 10,),
            Container(
              height: 300,
              width: 400,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 249, 174, 200),
                borderRadius: BorderRadius.circular(20) 
              ),

              child : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children : [
                  Image.asset("lib/Assets/Images/Gold Trophy.png",height: 150,),
                  SizedBox(height: 10,),
                  Text("You answered $correctAns/${Quizz_PageState.questionList.length} questions",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  ElevatedButton(onPressed: ()=>{},child: Text("Check Correct Answer",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(162, 255, 228, 237),foregroundColor: Colors.transparent,shadowColor: Colors.transparent,minimumSize: Size(60, 60))),
                ]
              )
            ),
            SizedBox(height: 30,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("CORRECT ANSWERS",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey),),
                              Text("$correctAns",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),)
                            ]
                      ),
                      SizedBox(height: 20,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("INCORRECT ANSWER",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey),),
                    Text("${Quizz_PageState.questionList.length - correctAns}",
                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black)
                          
                          ),
                        ]
                      )
                  ],
                ),
                SizedBox(width: 30,),
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("COMPLETION",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey),),
                        Text("${((correctAns * 100) / Quizz_PageState.questionList.length).toStringAsFixed(2).substring(0, 4)}%",
                        style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black)
                        ),
                      ]
                    ),
                    SizedBox(height: 20,),
                    Column(
                      children: [
                        Text("SKIPPED",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey),),
                        Text("${0}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),)
                      ]
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: ()=>{}, child: Text("Done",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 249, 174, 200),fixedSize: Size(100,50)),)
          ],
        ),
      ),
    );
  }
}