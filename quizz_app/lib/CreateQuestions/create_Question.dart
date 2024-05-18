import 'package:flutter/material.dart';

class CreateQuestion extends StatefulWidget {
  final List<String> questionList;
  final List<List<String>> optionList;

  CreateQuestion({Key? key, required this.questionList, required this.optionList})
      : super(key: key);

  @override
  _CreateQuestionState createState() => _CreateQuestionState();
}

class _CreateQuestionState extends State<CreateQuestion> {
  String Question = '';
  String Option1 = '';
  String Option2 = '';
  String Option3 = '';
  String Option4 = '';

  @override
  Widget build(BuildContext context) {
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
                      label: const Padding(padding: EdgeInsets.only(left: 55),child: Icon(Icons.add , )),
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
                      label: const Padding(padding: EdgeInsets.only(left: 55),child: Icon(Icons.add , )),
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
                      Option2 = value;
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      label: const Padding(padding: EdgeInsets.only(left: 55),child: Icon(Icons.add , )),
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
                      label: const Padding(padding: EdgeInsets.only(left: 55),child: Icon(Icons.add , )),
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
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(106, 90, 224, 1),
                ),
                onPressed: () {
                  widget.questionList.add(Question);
                  widget.optionList.add([Option1, Option2, Option3, Option4]);
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
            )
          ],
        )
      ],
    );
  }
}
