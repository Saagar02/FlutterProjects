import 'package:flutter/material.dart';
//import 'package:quiz_app1/ListviewBuilder.dart';
//import 'DispInt.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
// Variable Decleared Here

  int _counter = 0;
  int selectedIndex = -1;
  bool questionScrren = true;

  // List of Questions And Options And Answers

  List<Map> questionList = [
    {
      "Questions": " Who is Founder of Microsoft ?",
      "Option": ["Larray Page ", "steve Jobs", "bill gates", "Jeff bezoz"],
      "answer": 2,
    },
    {
      "Questions": "Who is Founder of Apple ?",
      "Option": ["Elon musk", "Bill Gates", "Mark Z", "Steve Jobs"],
      "answer": 3,
    },
    {
      "Questions": "Who Founder of tesla ? ",
      "Option": ["Pranav Dumbre", "Steve Jobs", "Elon musk", "Harshad anbhule"],
      "answer": 2,
    },
    {
      "Questions": "Who is Founder of Meta  ?",
      "Option": ["Mark Z", "Elon Musk", "Bill gates", "Larray page"],
      "answer": 0,
    },
    {
      "Questions": "What is Harshad Anbhule's Pointer ?",
      "Option": ["6.5", "7.0", "EFT Back", "9.7"],
      "answer": 2,
    }
  ];

  // red zcolour returning

  Color retWrong() {
    selectedIndex = questionList[_counter]["answer"];
    return Colors.red;
  }

  // Method That Returns Scaffold for Question And Celebration

  Scaffold screenScaffold() {
    if (questionScrren == true) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "QuizApp",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 239, 145, 3),
                letterSpacing: 5),
          ),
          backgroundColor: const Color.fromARGB(255, 188, 225, 242),
          centerTitle: true,
        ),

        // Body of Questions And options

        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Question  : ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                Text(
                  "${_counter + 1} / ${questionList.length}",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 350,
              height: 60,
              child: Text(
                questionList[_counter]["Questions"],
                style:
                    const TextStyle(fontSize: 23, fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(selectedIndex >= 0
                          ? 0 == questionList[_counter]["answer"]
                              ? Colors.green
                              : selectedIndex == 0
                                  ? retWrong()
                                  : Colors.lightBlue
                          : Colors.lightBlue),
                ),

                // First Option of Question

                child: Text(
                  "A. ${questionList[_counter]["Option"][0]}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                // Elevated Button for 1st Option
                onPressed: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(selectedIndex >= 1
                          ? 1 == questionList[_counter]["answer"]
                              ? Colors.green
                              : selectedIndex == 1
                                  ? retWrong()
                                  : Colors.lightBlue
                          : Colors.lightBlue),
                ),
                child: Text(
                  "B. ${questionList[_counter]["Option"][1]}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(selectedIndex >= 2
                          ? 2 == questionList[_counter]["answer"]
                              ? Colors.green
                              : selectedIndex == 2
                                  ? retWrong()
                                  : Colors.lightBlue
                          : Colors.lightBlue),
                ),
                child: Text(
                  "C. ${questionList[_counter]["Option"][2]}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedIndex = 3;
                  });
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(selectedIndex >= 3
                          ? 3 == questionList[_counter]["answer"]
                              ? Colors.green
                              : selectedIndex == 3
                                  ? retWrong()
                                  : Colors.lightBlue
                          : Colors.lightBlue),
                ),
                child: Text(
                  "D. ${questionList[_counter]["Option"][3]}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (_counter != questionList.length - 1) {
                _counter++;
              } else {
                _counter = 0;
              }
              selectedIndex = -1;
            });
          },
          child: const Icon(Icons.arrow_forward),
        ),
      );
    } else {
      return Scaffold();
    }
  }

  @override
  Widget build(BuildContext context) {
    return screenScaffold();
  }
}
