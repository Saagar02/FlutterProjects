import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Controller/todo_provider.dart';
import '../Controller/todo_provider.dart';
import 'bottom_sheet.dart';
import 'todo_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var _isBVisible = true;
    return Scaffold(
      appBar: AppBar(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Icon(
            Icons.menu,
            color: Colors.white,
            size: 28,
          ),
          const Text(
            "To Do",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 22),
          ),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset("assets/images/Profile.png"),
            ),
          ),
        ]),
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: Color.fromRGBO(4, 36, 124, 1)),
        ),
      ),
      body:
          // NotificationListener<UserScrollNotification>(
          //   onNotification: (notification) {
          //     if (notification.direction == ScrollDirection.reverse ||
          //         notification.direction == ScrollDirection.forward) {
          //       setState(() {
          //         _isBVisible = false;
          //       });
          //     }
          //     if (notification.direction == ScrollDirection.idle) {
          //       setState(() {
          //         _isBVisible = true;
          //       });
          //     }
          //     return true;
          //   },
          //   child:
          Container(
        color: const Color.fromRGBO(4, 36, 124, 1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Container(
                height: 40,
                color: Colors.transparent,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        TodoProvider.listController = "All";
                        // Provider.of<TodoProvider>(context, listen: false)
                        //     .showAll();
                      },
                      child: Text(
                        "All",
                        style: TextStyle(
                            decoration: TodoProvider.listController == "All"
                                ? TextDecoration.underline
                                : null,
                            decorationColor: Colors
                                .white, //const Color.fromRGBO(121, 184, 165, 100),
                            decorationThickness: 2,
                            color: Colors
                                .white, //const Color.fromARGB(255, 121, 184, 165),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 20,
                      width: 2,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        TodoProvider.listController = "Important";
                        // Provider.of<TodoProvider>(context, listen: false)
                        //     .sortList();
                      },
                      child: Text(
                        "Important",
                        style: TextStyle(
                            decoration:
                                TodoProvider.listController == "Important"
                                    ? TextDecoration.underline
                                    : null,
                            decorationColor: Colors
                                .white, //const Color.fromARGB(255, 56, 81, 194),
                            decorationThickness: 2,
                            color: Colors
                                .white, //const Color.fromARGB(255, 56, 81, 194),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Spacer(),
                    DropdownButton<String>(
                      value: TodoProvider.statusController,
                      elevation: 0,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ), //Color.fromARGB(255, 56, 81, 194),),
                      iconSize: 24,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          TodoProvider.statusController = newValue;
                        }
                      },
                      items: ["Not Completed", "Completed", "Deleted"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                                color: Colors
                                    .white, //Color.fromARGB(255, 56, 81, 194),
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        );
                      }).toList(),
                      dropdownColor: const Color.fromRGBO(69, 106, 221, 1),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Provider.of<TodoProvider>(context, listen: false)
                        .todoList
                        .isEmpty
                    ? SizedBox(
                        height: 500,
                        width: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/TaskDone.png",
                              fit: BoxFit.contain,
                            ),
                            const Text(
                              "All tasks completed",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      )
                    : Consumer<TodoProvider>(
                        builder: (context, todoProvider, child) {
                          return ListView.builder(
                              itemBuilder: (context, index) {
                                return TodoCard(
                                  index: index,
                                );
                              },
                              itemCount: Provider.of<TodoProvider>(context,
                                      listen: false)
                                  .todoList
                                  .length);
                        },
                      ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: _isBVisible,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: GestureDetector(
              onTap: () {
                TodoProvider.clearController();
                ShowSheet.showbottomSheet(false, context,
                    Provider.of<TodoProvider>(context, listen: false).todoList);
              },
              child: Container(
                height: 53,
                width: 250,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(69, 106, 221, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                    child: Text(
                  "Create Task",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                )),
              ),
            )),
      ),
    );
  }
}
