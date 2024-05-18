// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, unused_import, unnecessary_import, camel_case_types

import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:quizz_app/CreateQuestions/show_Quizz.dart';
import 'addQuestions.dart';

class Create_QuizzScreen extends StatefulWidget{
  const Create_QuizzScreen({super.key});
  @override
  Quizz_PageState createState()=> Quizz_PageState();
}

class Quizz_PageState extends State< Create_QuizzScreen>{
  
    static List <String> questionList = ["How many types of widgets are there in Flutter?",
      "What element is used as an identifier for components when programming in Flutter?",
      "What language is Flutter's rendering engine primarily written in?",
      "What command would you use to compile your Flutter app in release mode?",
      "Which component allows us to specify the distance between widgets on the screen?"];
    static List <List<String>> optionList =[["2","4","6","8+"],
      ["Widget","Keys","Elements","Serial"],
      ["Kotlin","C++","Dart","Java"],
      ["Flutter --release","Flutter build --release","Flutter run --release","Flutter run #release"],
      ["SafeArea","SizedBox","table"," AppBar"]];
    static List <int> rightAnsList = [0,1,1,2,1];
    late Widget? _quizzWidget = questionList.length>0? show_Quizz(0): add_Quizz(0);
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(106,90,224,1),
        title: const Align(alignment: Alignment.center,child: Text("Create Quiz" , textAlign: TextAlign.center,style: TextStyle(color: Colors.white , fontSize: 25 , fontWeight: FontWeight.w500),)),
        leading: IconButton(
          onPressed: () => (),
          icon: const Icon(Icons.arrow_back , size: 30,color: Colors.white,),
          color: Colors.white,
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(onPressed: ()=>(), icon: const Icon(Icons.more_horiz , size: 30,color: Colors.white,))
            )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromRGBO(106,90,224,1),
        child: Center(
          child: Container(
              height: 660,
              width: 340,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)
              ),
              child:Padding(
                padding: const EdgeInsets.only(left: 10 , right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                      width: 20,
                    ),
                    
                    Container(
                      height: 50,
                      width: double.infinity,
                      color: Colors.transparent,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return Align(
                              alignment: Alignment.topCenter,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.grey,
                                  backgroundColor: Colors.transparent,
                                  surfaceTintColor: Colors.transparent,
                                  shadowColor: Colors.transparent
                                ),
                                onPressed: () => {
                                  setState(() {
                                    questionList.length >= index+1 ? _quizzWidget = show_Quizz(index) : _quizzWidget= add_Quizz(index);
                                  }),
                                },
                                child: Text('${index + 1}'),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    _quizzWidget!

                  ],
                ),
              )
          ),
        )
      )
    );
  }

  Widget add_Quizz(index){
    String Question = '';
    String rightAns = '';
    String Option1 = '';
    String Option2 = '';
    String Option3 = '';
    String Option4 = '';
    return Column(
      children: [
        const Text(
          'Add Question',
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter your question',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                contentPadding: const EdgeInsets.symmetric(vertical:10 , horizontal: 10),
              ),
              onChanged: (value) {
                setState(() {
                  Question = value;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            
            Row(
              children:[ 
                Container(
                  height: 100,
                  width: 150,
                  child: TextField(
                    onChanged: (value) {
                      Option1 = value;
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      label: const Padding(padding: EdgeInsets.only(left: 15),child: Text("Option No : 1")),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(211, 207, 249, 1),
                      contentPadding: const EdgeInsets.symmetric(vertical:50 , horizontal: 5)
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                Container(
                  height: 100,
                  width: 150,
                  child: TextField(
                    onChanged: (value) {
                      Option2 = value;
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      label: const Padding(padding: EdgeInsets.only(left: 15),child: Text("Option No : 2")),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(211, 207, 249, 1),
                      contentPadding: const EdgeInsets.symmetric(vertical:50 , horizontal: 5)
                    ),
                  ),
                ),
              ]
            ),
            const SizedBox(height: 20,),
            Row(
              children:[ 
                Container(
                  height: 100,
                  width: 150,
                  child: TextField(
                    onChanged: (value) {
                      Option3 = value;
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      label: const Padding(padding: EdgeInsets.only(left: 15),child: Text("Option No : 3")),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(211, 207, 249, 1),
                      contentPadding: const EdgeInsets.symmetric(vertical:50 , horizontal: 5)
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                Container(
                  height: 100,
                  width: 150,
                  child: TextField(
                    onChanged: (value) {
                      Option4 = value;
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      label: const Padding(padding: EdgeInsets.only(left: 15),child: Text("Option No : 4")),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(211, 207, 249, 1),
                      contentPadding: const EdgeInsets.symmetric(vertical:50 , horizontal: 5)
                    ),
                  ),
                ),
              ]
            ),
            const SizedBox(height: 20,),

            const SizedBox(
              height: 20,
            ),

            Row(
              children:[ 
                Text("Select right answer :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                SizedBox(width: 10,),
                DropdownButton<int>(
                  value: rightAnsList[0],
                  onChanged: (int? value) {
                    setState(() {
                      rightAnsList[index] = value!;
                    });
                  },
                  items:List.generate(
                    4,
                    (index) => DropdownMenuItem<int>(
                      value: index + 1, // Assuming you want to start from 1
                      child: Text('Option ${index + 1}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
              ]
            ),

            SizedBox(height: 20),
            
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(106, 90, 224, 1),
                ),
                onPressed: () {
                  questionList.add(Question);
                  optionList.add([Option1, Option2, Option3, Option4]);
                    Question = '';
                    rightAns = '';
                    Option1 = '';
                    Option2 = '';
                    Option3 = '';
                    Option4 = '';
                },
                child: const Text(
                  "Add",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget show_Quizz(int index){
    return 
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
                          Quizz_PageState.questionList[index],
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
                    buildOption(0, Quizz_PageState.optionList[index][0]),
                    buildOption(1, Quizz_PageState.optionList[index][1]),
                    buildOption(2, Quizz_PageState.optionList[index][2]),
                    buildOption(3, Quizz_PageState.optionList[index][3]),
                  ],
                ),
              ],
            ),
          ] 
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
