
import 'package:flutter/material.dart';
import 'create_quizz_screen.dart';

class showQuizz extends StatefulWidget{
  showQuizz({super.key});
  _showQuizzState createState()=>_showQuizzState(0);
}
class _showQuizzState extends State<showQuizz> {
  int? Qindex;
  _showQuizzState(int Qindex){
    this.Qindex = Qindex;
  }
  @override
  Widget build (BuildContext context){
    return Scaffold( 
      body:
        Center(
            child: Column(
              children:[
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15 , right: 10),
                        child:Text(
                              Quizz_PageState.questionList[Qindex!],
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
                        buildOption(0, Quizz_PageState.optionList[Qindex!][0]),
                        buildOption(1, Quizz_PageState.optionList[Qindex!][1]),
                        buildOption(2, Quizz_PageState.optionList[Qindex!][2]),
                        buildOption(3, Quizz_PageState.optionList[Qindex!][3]),
                      ],
                    ),
                  ],
                ),
              ] 
            ),
        ),
      );
  }

  Widget buildOption(int index , String option) {
    return Padding(
      padding: const EdgeInsets.only(top: 15 , right: 15 ,left: 15),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
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
    );
  }
}