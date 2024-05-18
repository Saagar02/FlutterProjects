import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // For FontAwesome Icons
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todolist/todo_model_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color? _selectedColor = Colors.yellow.shade200;
  bool _isBVisible = true;
  bool _isImportant = false;
  final bool _isCompleted = false;
  String _listController = "All";
  String _statusController = "Not Completed";
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

  static List<ToDoModelClass> todoList = [
    ToDoModelClass(
      title: "Not Complete ToDo 1",
      description: "Not Complete ToDo 1 description",
      date: "Feb 11, 2024",
      time: "12:30 AM",
      category: "Personal",
      selectedColor: Colors.yellow.shade200,
      isImportant: true,
      isCompleted: false,
      todoStatus: "Not Completed",
    ),
    ToDoModelClass(
      title: "Not Complete ToDo 2",
      description: "Not Complete ToDo 2 description",
      date: "Jan 17, 2024",
      time: "9:20 PM",
      category: "Work",
      selectedColor: Colors.green.shade200,
      isImportant: false,
      isCompleted: false,
      todoStatus: "Not Completed",
    ),
    ToDoModelClass(
      title: "Completed Todo 1",
      description: "Completed Todo 1 description",
      date: "Feb 14, 2024",
      time: "12:30 PM",
      category: "Home",
      selectedColor: Colors.red.shade200,
      isImportant: true,
      isCompleted: true,
      todoStatus: "Completed",
    ),
    ToDoModelClass(
      title: "Completed Todo 2",
      description: "Completed Todo 2 description ",
      date: "Jan 9, 2024",
      time: "9:20 AM",
      category: "Work",
      selectedColor: Colors.blue.shade200,
      isImportant: true,
      isCompleted: true,
      todoStatus: "Completed",
    ),
    ToDoModelClass(
      title: "Completed Todo 3",
      description: "Completed Todo 3 description",
      date: "Jan 7, 2024",
      time: "5:25 PM",
      category: "Personal",
      selectedColor: Colors.green.shade200,
      isImportant: false,
      isCompleted: true,
      todoStatus: "Completed",
    ),
    ToDoModelClass(
      title: "Deleted Todo 1",
      description: "Deleted Todo 1 description",
      date: "Dec 21, 2023",
      time: "1:30 AM",
      category: "Work",
      selectedColor: Colors.green.shade200,
      isImportant: true,
      isCompleted: false,
      todoStatus: "Deleted",
    ),
    ToDoModelClass(
      title: "Deleted Todo 2",
      description: "Deleted Todo 2 description",
      date: "Sept 10, 2023",
      time: "10:10 PM",
      category: "Home",
      selectedColor: Colors.blue.shade200,
      isImportant: false,
      isCompleted: true,
      todoStatus: "Deleted",
    ),
    ToDoModelClass(
      title: "Deleted Todo 3",
      description: "Deleted Todo 3 description ",
      date: "Oct 8, 2023",
      time: "6:30 AM",
      category: "Personal",
      selectedColor: Colors.yellow.shade200,
      isImportant: false,
      isCompleted: false,
      todoStatus: "Deleted",
    ),
  ];
  static List<ToDoModelClass> selectedTodo = [];

  @override
  void initState() {
    super.initState();
    selectedTodo = todoList.where((ToDoModelClass item) {
      return item.todoStatus == "Not Completed";
    }).toList();
  }

  Widget showDrawer() {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 200,
            width: 100,
            color: Colors.red,
          )
        ],
      ),
    );
  }

  bool isCompleted(ToDoModelClass toDoObj) {
    if (toDoObj.isCompleted == true) {
      return true;
    } else {
      return false;
    }
  }

  void updateList() {
    if (_listController == "All") {
      if (_statusController == "Not Completed") {
        setState(() {
          selectedTodo = todoList.where((ToDoModelClass item) {
            return item.todoStatus == "Not Completed";
          }).toList();
        });
      } else if (_statusController == "Completed") {
        setState(() {
          selectedTodo = todoList.where((ToDoModelClass item) {
            return item.todoStatus == "Completed";
          }).toList();
        });
      } else {
        selectedTodo = todoList.where((ToDoModelClass item) {
          return item.todoStatus == "Deleted";
        }).toList();
      }
    } else {
      if (_statusController == "Not Completed") {
        setState(() {
          selectedTodo = todoList.where((ToDoModelClass item) {
            return item.todoStatus == "Not Completed" &&
                item.isImportant == true;
          }).toList();
        });
      } else if (_statusController == "Completed") {
        setState(() {
          selectedTodo = todoList.where((ToDoModelClass item) {
            return item.todoStatus == "Completed" && item.isImportant == true;
          }).toList();
        });
      } else {
        selectedTodo = todoList.where((ToDoModelClass item) {
          return item.todoStatus == "Deleted" && item.isImportant == true;
        }).toList();
      }
    }
  }

  void submitButton(bool isEdit, [ToDoModelClass? todoObj]) {
    if (_titleController.text.trim().isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _dateController.text.isNotEmpty &&
        _timeController.text.isNotEmpty) {
      if (!isEdit) {
        setState(() {
          todoList.add(ToDoModelClass(
            title: _titleController.text.trim(),
            description: _descriptionController.text.trim(),
            date: _dateController.text.trim(),
            time: _timeController.text.trim(),
            category: _categoryController.text.trim(),
            selectedColor: _selectedColor!,
            isImportant: _isImportant,
            isCompleted: _isCompleted,
            todoStatus: "Not Completed",
          ));
          updateList();
        });
      } else {
        setState(() {
          todoObj!.title = _titleController.text.trim();
          todoObj.description = _descriptionController.text.trim();
          todoObj.date = _dateController.text.trim();
          todoObj.time = _timeController.text.trim();
          todoObj.category = _categoryController.text.trim();
          todoObj.selectedColor = _selectedColor!;
          todoObj.isImportant = _isImportant;
          todoObj.isCompleted = _isCompleted;
          updateList();
        });
      }
    }
    clearController();
  }

  void clearController() {
    _titleController.clear();
    _descriptionController.clear();
    _dateController.clear();
    _timeController.clear();
    _categoryController.clear();
    _isImportant = false;
  }

  void deletToDo(ToDoModelClass toDoObj) {
    setState(() {
      if (toDoObj.todoStatus == "Deleted") {
        todoList.remove(toDoObj);
      } else {
        toDoObj.todoStatus = "Deleted";
      }
      selectedTodo.remove(toDoObj);
    });
  }

  void isImportant(ToDoModelClass toDoObj) {
    setState(() {
      if (toDoObj.isCompleted == false) {
        toDoObj.isImportant == true
            ? toDoObj.isImportant = false
            : toDoObj.isImportant = true;
      }
    });
  }

  void completeTodo(ToDoModelClass toDoObj) {
    toDoObj.isCompleted == false
        ? toDoObj.isCompleted = true
        : toDoObj.isCompleted = false;
    toDoObj.todoStatus == "Not Completed"
        ? toDoObj.todoStatus = "Completed"
        : toDoObj.todoStatus = "Not Completed";
  }

  void changeTodoList(ToDoModelClass toDoObj) {
    toDoObj.isCompleted
        ? toDoObj.todoStatus = "Completed"
        : toDoObj.todoStatus = "Not Completed";
    toDoObj.isCompleted
        ? toDoObj.isCompleted = true
        : toDoObj.isCompleted = false;
  }

  void editToDo(ToDoModelClass todoObj) {
    _titleController.text = todoObj.title;
    _descriptionController.text = todoObj.description;
    _dateController.text = todoObj.date;
    _timeController.text = todoObj.time;
    _selectedColor = todoObj.selectedColor;
    _categoryController.text = todoObj.category;
    showbottomSheet(true, todoObj);
  }

  Widget buildCircle() {
    return Row(
      children: [
        const Spacer(),
        GestureDetector(
          onTap: () => setState(() {
            _selectedColor = Colors.red.shade200;
          }),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
                border: Border.all(color: Colors.black, width: 2)),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => setState(() {
            _selectedColor = Colors.blue.shade200;
          }),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                border: Border.all(color: Colors.black, width: 2)),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => setState(() {
            _selectedColor = Colors.yellow.shade200;
          }),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow,
                border: Border.all(color: Colors.black, width: 2)),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => setState(() {
            _selectedColor = Colors.green.shade200;
          }),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
                border: Border.all(color: Colors.black, width: 2)),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  void showbottomSheet(bool isEdit, [ToDoModelClass? todoObj]) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          side: BorderSide(color: Colors.white)),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                height: 480,
                width: 360,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(3, 25, 86, 1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Create Task",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      const Divider(
                        thickness: 2,
                        color: Colors.white,
                      ),
                      Column(
                        children: [
                          const Align(
                              alignment: Alignment.topLeft,
                              child: Text("Title",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight
                                          .w500))), //Color(0xFF02A7B1),))),
                          Container(
                            height: 40,
                            width: 330,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              controller: _titleController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(
                                          69, 106, 221, 1), //Color(0xFF02A7B1),
                                      width: 1,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(69, 106, 221, 1),
                                      width: 1,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Column(
                        children: [
                          const Align(
                              alignment: Alignment.topLeft,
                              child: Text("Description",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight
                                          .w500))), //Color(0xFF02A7B1),))),
                          Container(
                            height: 60,
                            width: 330,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: const Color.fromRGBO(69, 106, 221,
                                      1), //const Color(0xFF02A7B1)
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: TextField(
                              controller: _descriptionController,
                              maxLines: 5,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(children: [
                        const Spacer(),
                        const Text(
                          "Not Important",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isImportant = false;
                            });
                          },
                          child: Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(3, 25, 86, 1),
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(4)),
                            child: _isImportant == false
                                ? const Icon(
                                    FontAwesomeIcons.check,
                                    color: Colors.white,
                                    size: 15,
                                  )
                                : null,
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        const Text(
                          "Important",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isImportant = true;
                            });
                          },
                          child: Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(3, 25, 86, 1),
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(4)),
                            child: _isImportant
                                ? const Icon(
                                    FontAwesomeIcons.check,
                                    size: 15,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                        ),
                        const Spacer(),
                      ]),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Date",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight
                                              .w500))), //Color(0xFF02A7B1),))),
                              Container(
                                  height: 40,
                                  width: 155,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: const Color.fromRGBO(69, 106,
                                            221, 1), //const Color(0xFF02A7B1),
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextField(
                                      readOnly: true,
                                      controller: _dateController,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                      decoration: const InputDecoration(
                                          fillColor: Colors.white,
                                          contentPadding: EdgeInsets.all(4),
                                          hintText: "dd/mm/yy",
                                          suffixIcon: Icon(
                                            FontAwesomeIcons.calendarAlt,
                                            color: Colors.grey,
                                          ),
                                          border: InputBorder.none),
                                      onTap: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2100, 12, 31),
                                        );
                                        String formattedDate =
                                            DateFormat.yMMMd()
                                                .format(pickedDate!);
                                        setState(() {
                                          _dateController.text = formattedDate;
                                        });
                                      })),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Time",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight
                                              .w500))), //Color(0xFF02A7B1),))),
                              Container(
                                  height: 40,
                                  width: 155,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: const Color.fromRGBO(69, 106,
                                            221, 1), //const Color(0xFF02A7B1),
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextField(
                                      readOnly: true,
                                      controller: _timeController,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                      decoration: const InputDecoration(
                                          fillColor: Colors.white,
                                          contentPadding: EdgeInsets.all(5),
                                          hintText: "hh/mm a",
                                          suffixIcon: Icon(
                                            FontAwesomeIcons.clock,
                                            color: Colors.grey,
                                          ),
                                          border: InputBorder.none),
                                      onTap: () async {
                                        TimeOfDay? pickedTime =
                                            await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        );
                                        if (pickedTime != null) {
                                          final DateTime dateTimeWithTime =
                                              DateTime(
                                                  DateTime.now().year,
                                                  DateTime.now().month,
                                                  DateTime.now().day,
                                                  pickedTime.hour,
                                                  pickedTime.minute);
                                          final String formattedTime =
                                              DateFormat('hh:mm a')
                                                  .format(dateTimeWithTime);
                                          setState(() {
                                            _timeController.text =
                                                formattedTime;
                                          });
                                        }
                                      })),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Column(
                        children: [
                          const Align(
                              alignment: Alignment.topLeft,
                              child: Text("Category",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500))),
                          const SizedBox(
                            height: 2,
                          ),
                          Container(
                            height: 40,
                            width: 330,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: const Color.fromRGBO(69, 106, 221,
                                      1), //const Color(0xFF02A7B1)
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Row(
                              children: [
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      setState(() {
                                        _categoryController.text = "Personal";
                                      });
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.person_2_outlined,
                                          color: _categoryController.text ==
                                                  "Personal"
                                              ? const Color.fromRGBO(
                                                  69, 106, 221, 1)
                                              : Colors.grey),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        "Personal",
                                        style: TextStyle(
                                            color: _categoryController.text ==
                                                    "Personal"
                                                ? const Color.fromRGBO(
                                                    69, 106, 221, 1)
                                                : Colors.grey,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _categoryController.text = "Home";
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.house_outlined,
                                          color:
                                              _categoryController.text == "Home"
                                                  ? const Color.fromRGBO(
                                                      69, 106, 221, 1)
                                                  : Colors.grey),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        "Home",
                                        style: TextStyle(
                                            color: _categoryController.text ==
                                                    "Home"
                                                ? const Color.fromRGBO(
                                                    69, 106, 221, 1)
                                                : Colors.grey,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _categoryController.text = "Work";
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.work_history_outlined,
                                          color:
                                              _categoryController.text == "Work"
                                                  ? const Color.fromRGBO(
                                                      69, 106, 221, 1)
                                                  : Colors.grey),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        "Work",
                                        style: TextStyle(
                                            color: _categoryController.text ==
                                                    "Work"
                                                ? const Color.fromRGBO(
                                                    69, 106, 221, 1)
                                                : Colors.grey,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(69, 106, 221, 1),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: ElevatedButton(
                              onPressed: () => (setState(
                                () {
                                  clearController();
                                  Navigator.of(context).pop();
                                },
                              )),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors
                                    .transparent, //MaterialStateProperty.all<Color>(const Colors.transparent)//MaterialStateProperty.all<Color>(const Color(0xFF02A7B1))
                                foregroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(69, 106, 221, 1),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: ElevatedButton(
                              onPressed: () => (setState(
                                () {
                                  isEdit
                                      ? submitButton(isEdit, todoObj)
                                      : submitButton(isEdit);
                                  Navigator.of(context).pop();
                                },
                              )),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors
                                    .transparent, //MaterialStateProperty.all<Color>(const Colors.transparent)//MaterialStateProperty.all<Color>(const Color(0xFF02A7B1))
                                foregroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget todos(int index, List todo) {
    Image image;
    if (todo[index].category == 'Work') {
      image = Image.asset("images/work.png");
    } else if (todo[index].category == 'Home') {
      image = Image.asset("images/home.png");
    } else {
      image = Image.asset("images/personal.png");
    }
    return Slidable(
        actionPane: const SlidableDrawerActionPane(),
        actionExtentRatio: 0.15,
        secondaryActions: <Widget>[
          SlideAction(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 140,
                width: 390,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          deletToDo(todo[index]);
                          updateList();
                        });
                      },
                      child: const Icon(Icons.delete_outline,
                          size: 28,
                          color: Color.fromRGBO(
                              84, 84, 84, 1) //Color.fromRGBO(0, 139, 148, 1),
                          ),
                    ),
                    const Spacer(),
                    todo[index].todoStatus != "Deleted"
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                completeTodo(todo[index]);
                                updateList();
                              });
                            },
                            child: Container(
                              height: 19,
                              width: 19,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:const Color.fromRGBO(84, 84, 84, 1),
                                  width: 2
                                ),
                              ),
                              child: todo[index].todoStatus != "Completed"
                              ? const Center(child: Icon(FontAwesomeIcons.check,size: 14,color:Color.fromRGBO(84, 84, 84, 1) ,))
                              : const Center(child: Icon(FontAwesomeIcons.times,size: 15,color:Color.fromRGBO(84, 84, 84, 1) ,)),
                            )
                          )
                        : const SizedBox.shrink(),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            height: 140,
            width: 390,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(102, 133, 228, 1),
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 8, left: 8, top: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      /*Container(
                            height: 65,
                            width: 60,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: image
                          ),*/
                      const SizedBox(width: 5),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  height: 25,
                                  width: 250,
                                  child: Row(
                                    children: [
                                      Text(
                                        todo[index].title,
                                        maxLines: null,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Colors.white,
                                          decoration: todo[index].todoStatus ==
                                                  "Completed"
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      todo[index].isImportant
                                          ? const Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            )
                                          : const SizedBox.shrink()
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                todo[index].todoStatus != "Completed" 
                                  ?todo[index].todoStatus != "Deleted"
                                    ? GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            editToDo(todo[index]);
                                            updateList();
                                          });
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4),
                                          child: Text(
                                            "Edit",
                                            style: TextStyle(
                                                color: Color.fromRGBO(207,232,255,1), //const Color.fromARGB(255, 121, 184, 165),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            changeTodoList(todo[index]);
                                            updateList();
                                          });
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4),
                                          child: Text(
                                            "Undo",
                                            style: TextStyle(
                                                color: Color.fromRGBO(207,232,255,1), //const Color.fromARGB(255, 121, 184, 165),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ) : const SizedBox.shrink(),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 50,
                              color: Colors.transparent,
                              child: ListView(
                                children: [
                                  Text(
                                    todo[index].description,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(
                                          235, 231, 231, 1),
                                      decoration:
                                          todo[index].todoStatus == "Completed"
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 1.5,
                    height: 2,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 5, left: 10.0, right: 10.0),
                    child: Row(
                      children: [
                        Text(
                          todo[index].time,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          todo[index].date,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 34,
                          width: 34,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: image,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
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
              child: Image.asset("images/Prfile.png"),
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
                            _listController = "All";
                            updateList();
                          });
                        },
                        child: Text(
                          "All",
                          style: TextStyle(
                              decoration: _listController == "All"
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
                            _listController = "Important";
                            updateList();
                          });
                        },
                        child: Text(
                          "Important",
                          style: TextStyle(
                              decoration: _listController == "Important"
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
                        value: _statusController,
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
                              _statusController = newValue;
                              updateList();
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
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("images/Task Done png.png"),
                              const Text(
                                "All tasks completed",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        : ListView.builder(
                            itemBuilder: (context, index) {
                              return todos(index, selectedTodo);
                            },
                            itemCount: selectedTodo.length,
                          )),
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
                    clearController();
                    showbottomSheet(false);
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
