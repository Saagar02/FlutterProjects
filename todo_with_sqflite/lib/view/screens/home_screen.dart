import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo_with_sqflite/controller/llist_operations.dart';
import 'package:todo_with_sqflite/model/todo_model_class.dart';
import 'package:todo_with_sqflite/view/screens/widgets/bottom_sheet.dart';
import 'package:todo_with_sqflite/view/screens/widgets/list_viewbuilder.dart';
import 'package:todo_with_sqflite/view/screens/widgets/todo_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isBVisible = true;
  List<ToDoModelClass> todoList = [];
  List<ToDoModelClass> selectedTodo = [];

  @override
  void initState() {
    super.initState();
    todoList = ToDoModelClass.todoList;
    selectedTodo = ListOperations.sortList(todoList);
  }

  void isDeleted() {
    setState(() {
      ListOperations.sortList(todoList);
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.reverse ||
              notification.direction == ScrollDirection.forward) {
            setState(() {
              _isBVisible = false;
            });
          }
          if (notification.direction == ScrollDirection.idle) {
            setState(() {
              _isBVisible = true;
            });
          }
          return true;
        },
        child: Container(
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
                          setState(() {
                            ListOperations.listController = "All";
                            selectedTodo = ListOperations.sortList(todoList);
                          });
                        },
                        child: Text(
                          "All",
                          style: TextStyle(
                              decoration: ListOperations.listController == "All"
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
                          setState(() {
                            ListOperations.listController = "Important";
                            selectedTodo = ListOperations.sortList(todoList);
                          });
                        },
                        child: Text(
                          "Important",
                          style: TextStyle(
                              decoration:
                                  ListOperations.listController == "Important"
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
                        value: ListOperations.statusController,
                        elevation: 0,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ), //Color.fromARGB(255, 56, 81, 194),),
                        iconSize: 24,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              ListOperations.statusController = newValue;
                              selectedTodo = ListOperations.sortList(todoList);
                            });
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
                    child: selectedTodo.isEmpty
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
                        : ListView.builder(
                            itemBuilder: (context, index) {
                              return TodoCard(
                                index: index,
                                todoList: selectedTodo,
                              );
                            },
                            itemCount: selectedTodo.length,
                          ) //ListViewBuilder(selectedTodo: selectedTodo),
                    )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: _isBVisible,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              height: 53,
              width: 250,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(69, 106, 221, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    ListOperations.clearController();
                    ShowSheet.showbottomSheet(false, context, todoList);
                  });
                },
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
