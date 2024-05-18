import 'package:flutter/material.dart';

  List <String> questionList = [];
  class AddQuestions extends StatefulWidget {
    const AddQuestions({super.key});
    _addQuetionsState createState()=> _addQuetionsState();
  }
  
  class _addQuetionsState extends State<AddQuestions> {
    @override
    Widget build(BuildContext context) {
      return Column(
        children: [
          Align(alignment: Alignment.topLeft,child: Text('AddQuestion',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),textAlign:TextAlign.left,)),
          SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(
              labelText: 'Enter your question',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              contentPadding: EdgeInsets.symmetric(vertical:10 , horizontal: 10),
            ),
            onChanged: (value) {
              
            },
          ),
          SizedBox(
            height: 20,
          ),
          
          Row(
            children:[ 
              Container(
                height: 100,
                width: 150,
                child: TextField(
                  decoration: InputDecoration(
                    label: Padding(padding: EdgeInsets.only(left: 55),child: Icon(Icons.add , )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(211, 207, 249, 1),
                    contentPadding: EdgeInsets.symmetric(vertical:50 , horizontal: 5)
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Container(
                height: 100,
                width: 150,
                child: TextField(
                  decoration: InputDecoration(
                    label: Padding(padding: EdgeInsets.only(left: 55),child: Icon(Icons.add , )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(211, 207, 249, 1),
                    contentPadding: EdgeInsets.symmetric(vertical:50 , horizontal: 5)
                  ),
                ),
              ),
            ]
          ),
          SizedBox(height: 20,),
          Row(
            children:[ 
              Container(
                height: 100,
                width: 150,
                child: TextField(
                  decoration: InputDecoration(
                    label: Padding(padding: EdgeInsets.only(left: 55),child: Icon(Icons.add , )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(211, 207, 249, 1),
                    contentPadding: EdgeInsets.symmetric(vertical:50 , horizontal: 5)
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Container(
                height: 100,
                width: 150,
                child: TextField(
                  decoration: InputDecoration(
                    label: Padding(padding: EdgeInsets.only(left: 55),child: Icon(Icons.add , )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(211, 207, 249, 1),
                    contentPadding: EdgeInsets.symmetric(vertical:50 , horizontal: 5)
                  ),
                ),
              ),
            ]
          ),
          SizedBox(height: 30,),
          Container(
            width: 200,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:  Color.fromRGBO(106,90,224,1),
              
              ),
              onPressed: ()=>(), 
              child: Text(
                "Add" , textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              )
            ),
          )
        ]
      );
    
    }
  }
  