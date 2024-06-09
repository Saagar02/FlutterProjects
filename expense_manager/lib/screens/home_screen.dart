import 'package:expense_manager/screens/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State createState() => _HomeScreen();
}

class _HomeScreen extends State {
  //String menubarItem = "Transaction" ;
  List transactionList = [
    {
      "category": "Medicine",
      "description": "Lorem Ipsum is simply dummy text of the",
      "date": "3 June | 11:50 AM",
      "amount": "900",
    },
    {
      "category": "Medicine",
      "description": "Lorem Ipsum is simply dummy text of the",
      "date": "3 June | 11:50 AM",
      "amount": "900",
    },
    {
      "category": "Medicine",
      "description": "Lorem Ipsum is simply dummy text of the",
      "date": "3 June | 11:50 AM",
      "amount": "900",
    },
    {
      "category": "Medicine",
      "description": "Lorem Ipsum is simply dummy text of the",
      "date": "3 June | 11:50 AM",
      "amount": "900",
    },
    {
      "category": "Medicine",
      "description": "Lorem Ipsum is simply dummy text of the",
      "date": "3 June | 11:50 AM",
      "amount": "900",
    }
  ];

  void showBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        context: context,
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height * 0.7,
          maxHeight: MediaQuery.of(context).size.height * 07,
        ),
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setstate) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SizedBox(
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 22,
                    right: 23,
                  ),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 34,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Date",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Container(
                            height: 36,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(191, 189, 189,1),
                                      width: 1,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(3, 3, 3, 1),
                                      width: 1,
                                    )),
                              ),
                              onTap: () async{
                                DateTime ? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(), 
                                  firstDate: DateTime.now(), 
                                  lastDate: DateTime(3000),
                                );
                                String formattedDate = DateFormat.yMMMd().format(pickedDate!);
                              },
                            ),
                            
                          ),
                          const SizedBox(
                            height: 19,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Amount",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Container(
                            height: 36,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(191, 189, 189,
                                          1), //Color(0xFF02A7B1),
                                      width: 1,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(3, 3, 3, 1),
                                      width: 1,
                                    )),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 19,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Category",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Container(
                            height: 36,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(191, 189, 189,1),
                                      width: 1,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(3, 3, 3, 1),
                                      width: 1,
                                    )),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 19,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Description",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Container(
                            height: 36,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(191, 189, 189,1),
                                      width: 1,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(3, 3, 3, 1),
                                      width: 1,
                                    )),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 40,
                                width: 123,
                                decoration: const BoxDecoration(
                                    color: Color.fromRGBO(14, 161, 125, 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(67))),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Add",
                                    style: GoogleFonts.poppins(
                                      color:const Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                  ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "June 2022",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.all(10),
            child: const Icon(Icons.search),
          ),
        ],
      ),
      drawer: const Sidebar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: transactionList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(0),
              child: SizedBox(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.only(right: 15),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(0, 174, 91, 0.7),
                            shape: BoxShape.circle,
                          ),
                          child:
                              SvgPicture.asset('./assets/images/medicine.svg'),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transactionList[index]["category"],
                              style: GoogleFonts.poppins(fontSize: 15),
                            ),
                            Text(
                              transactionList[index]["description"],
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.remove_circle_rounded,
                          color: Color.fromRGBO(246, 113, 49, 1),
                        ),
                        Text(
                          transactionList[index]['amount'],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Text(
                          transactionList[index]["date"],
                          style: GoogleFonts.poppins(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            showBottomSheet();
          });
        },
        label: const Text('Add Taransaction'),
        icon: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromRGBO(14, 161, 125, 1),
          ),
          child: const Icon(
            Icons.add_rounded,
            size: 35,
            weight: 100,
            color: Colors.white,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(70),
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
