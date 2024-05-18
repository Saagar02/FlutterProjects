// ignore_for_file: unused_element, non_constant_identifier_names, prefer_const_constructors, sort_child_properties_last, unnecessary_brace_in_string_interps, prefer_final_fields, library_private_types_in_public_api, annotate_overrides, avoid_print

import 'package:flutter/material.dart';
import 'CreateQuestions/create_quizz_screen.dart';


class MainScreen extends StatefulWidget{

  const MainScreen({super.key});

  _QuizzPage createState() => _QuizzPage();
}

class _QuizzPage extends State<MainScreen>{

  int ? selectedOption = -1;
  int _rightOption = 3;
  int currentQuestion = 0;
  int totalQuestions = 10;
  bool _showAns = false;
  int correctAns = 0;
  int skipAns = 0;

  late Widget Question = QuizzQuestions();

    void navigateToCelebrationScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CelebrationScreen()),
      );
    }
  @override
  Widget build (BuildContext context){

    return Scaffold( 
      body: Container(
        
        color: Color.fromRGBO(106,90,224,1),
        child: Column(
          children:[
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 40 , bottom: 20 , right: 5 , left: 5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(53, 246, 245, 245)
                  ),
                  child: Image.asset("lib/Assets/Images/The Riddle 2.png",height: 100,),
                )
              ),
            ),

            Container(
              height: 620,
              width: 340,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10 , bottom: 10),
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Color(0xFFF8BBD0),
                        borderRadius: BorderRadius.circular(80)
                      ),
                    ),
                  ),
                  
                  QuizzQuestions(),
                  
                  Padding(
                    padding: EdgeInsets.only(top: 15 , bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (currentQuestion != Quizz_PageState.questionList.length-1) {
                                currentQuestion++;
                                selectedOption = -1;
                                Question = QuizzQuestions();
                              } else {
                                setState(() {
                                  navigateToCelebrationScreen();
                                });
                              }
                            });
                          },
                          child: Text(currentQuestion == (Quizz_PageState.questionList.length-1) ? "Finish" : "Next",style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(100,40)
                          ),
                        ),
                        SizedBox(width: 50,),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              skipAns++; 
                              if (currentQuestion != Quizz_PageState.questionList.length-1) {
                                
                                currentQuestion++;
                                selectedOption = -1;
                                Question = QuizzQuestions();
                              } else if(currentQuestion == Quizz_PageState.optionList.length-1) {
                                setState(() {
                                  navigateToCelebrationScreen();
                                });
                              }
                            });
                          },
                          child: Text('Skip',style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(100,40)
                          ),
                        ),
                      ]
                    )
                  ),
                  _showAns
                ? selectedOption == _rightOption
                    ? _buildFeedback(true)
                    : _buildFeedback(false)
                : const SizedBox.shrink(),
                ],
              ),
            )
          ] 
        ),
      ),
    );
  }

  Widget buildOption(int index , String option) {
    return Padding(
      padding: const EdgeInsets.only(top: 15 , right: 15 ,left: 15),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedOption = index;
            if(Quizz_PageState.rightAnsList[currentQuestion] == selectedOption){
              correctAns++;
              print(correctAns);
            }
          });
        },
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(
            color: ansColor(index),
            //color: selectedOption == index ? Color.fromRGBO(211, 207, 249, 1) : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color.fromRGBO(211, 207, 249, 1),
              width: 2,
              style: BorderStyle.solid
            ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                textAlign : TextAlign.center,
                option,
                style: TextStyle(fontSize: 18.0, color: Colors.black , fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color ansColor (int index){
  return selectedOption != -1
  ? selectedOption == index ? 
      Quizz_PageState.rightAnsList[currentQuestion] == selectedOption ? Colors.green : Colors.red 
    : Colors.white 
  : Colors.white;
  //return  Quizz_PageState.rightAnsList[currentQuestion] == selectedOption ? Colors.green : Colors.red; 
}

  void _checkAns() {
    setState(() {
      _showAns = true;
    });
  }

  Widget _buildFeedback(bool isCorrect) {
    if(isCorrect == false){
      _showAns = false;
    }
    return Column(
      children: [
        Icon(
          isCorrect ? Icons.check_circle : Icons.cancel,
          color: isCorrect ? Colors.green : Colors.red,
          size: 30.0,
        ),
        const SizedBox(height: 10.0),
        Text(
          isCorrect ? 'Correct!' : 'Wrong!',
          style: TextStyle(
            color: isCorrect ? Colors.green : Colors.red,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget QuizzQuestions(){
    return  Column(
      children :[
              Align(
                      alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10 , bottom: 10 , left: 15),
                          child: Text(
                            'QUESTION ${currentQuestion+1} OF ${Quizz_PageState.questionList.length}',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15 ,
                              fontWeight: FontWeight.bold
                            )
                          ),
                        ),
                      ),

              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 15 , right: 10),
                  child:Text(
                        Quizz_PageState.questionList[currentQuestion],
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20 ,
                          fontWeight: FontWeight.w500
                        )
                  ),
                ),
              ),

              Column(
                children: [
                  buildOption(0, Quizz_PageState.optionList[currentQuestion][0]),
                  buildOption(1, Quizz_PageState.optionList[currentQuestion][1]),
                  buildOption(2, Quizz_PageState.optionList[currentQuestion][2]),
                  buildOption(3, Quizz_PageState.optionList[currentQuestion][3]),
                ],
              ),
      ]
    );
  }

  Widget CelebrationScreen(){
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
                  Text("You answered ${Quizz_PageState.questionList.length-skipAns}/${Quizz_PageState.questionList.length} questions",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
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
                    Text("${Quizz_PageState.questionList.length - correctAns-skipAns}",
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
                        Text("${(((Quizz_PageState.questionList.length-skipAns) * 100) / Quizz_PageState.questionList.length).toStringAsFixed(2).substring(0, 4)}%",
                        style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black)
                        ),
                      ]
                    ),
                    SizedBox(height: 20,),
                    Column(
                      children: [
                        Text("SKIPPED",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey),),
                        Text("${skipAns}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),)
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