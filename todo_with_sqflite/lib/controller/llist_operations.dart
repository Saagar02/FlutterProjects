import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_with_sqflite/model/todo_model_class.dart';

class ListOperations with ChangeNotifier {
  static Color? selectedColor = Colors.yellow.shade200;
  static bool isBVisible = true;
  static bool isImportant = false;
  static bool isCompleted = false;
  static String listController = "All";
  static String statusController = "Not Completed";
  static final TextEditingController titleController = TextEditingController();
  static final TextEditingController descriptionController =
      TextEditingController();
  static final TextEditingController dateController = TextEditingController();
  static final TextEditingController timeController = TextEditingController();
  static final TextEditingController categoryController =
      TextEditingController();

  final List<ToDoModelClass> _todoList = [
    ToDoModelClass(
      title: "Not Complete ToDo 1",
      description: "Not Complete ToDo 1 description",
      date: "Feb 11, 2024",
      time: "12:30 AM",
      category: "Personal",
      selectedColor: Colors.yellow.shade200,
      isImportant: true,
      isCompleted: false,
      image: "assets/images/Personal.png",
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
      image: "assets/images/Work.png",
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
      image: "assets/images/Home.png",
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
      image: "assets/images/Work.png",
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
      image: "assets/images/Personal.png",
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
      image: "assets/images/Work.png",
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
      image: "assets/images/Home.png",
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
      image: "assets/images/Personal.png",
      todoStatus: "Deleted",
    ),
  ];
  List<ToDoModelClass> _selectedTodo = [];

  List<ToDoModelClass> get todoList => _todoList;
  List<ToDoModelClass> get selectedTodo => _selectedTodo;

  void sortList() {
    // if (listController == "All") {
    //   log("In all");
    //   if (statusController == "Not Completed") {
    //     log("status = $statusController");
    //     selectedTodo = todoList.where((var item) {
    //       return item.todoStatus == "Not Completed";
    //     }).toList();
    //   } else if (statusController == "Completed") {
    //     log("status = $statusController");
    //     selectedTodo =
    //         todoList.where((todo) => todo.todoStatus == "Completed").toList();
    //   } else {
    //     log("status = $statusController");
    //     selectedTodo =
    //         todoList.where((todo) => todo.todoStatus == "Deleted").toList();
    //   }
    // } else {
    //   if (statusController == "Not Completed") {
    //     log("status = $statusController");
    //     selectedTodo = todoList.where((var item) {
    //       return item.todoStatus == "Not Completed" && item.isImportant == true;
    //     }).toList();
    //   } else if (statusController == "Completed") {
    //     selectedTodo = todoList.where((var item) {
    //       return item.todoStatus == "Completed" && item.isImportant == true;
    //     }).toList();
    //   } else {
    //     selectedTodo = todoList.where((var item) {
    //       return item.todoStatus == "Deleted" && item.isImportant == true;
    //     }).toList();
    //   }
    //   return selectedTodo;
    // }

    if (listController == "All") {
      log("In all");
      if (statusController == "Not Completed") {
        log("In Not completed");
        _selectedTodo = todoList
            .where((todo) => todo.todoStatus == "Not Completed")
            .toList();
      }
      if (statusController == "Completed") {
        log("In completed");
        _selectedTodo =
            todoList.where((todo) => todo.todoStatus == "Completed").toList();
      }
    }
    // if (listController == "All") {
    //   selectedTodo = todoList.where((var item) {
    //     //log(statusController);
    //     //log(listController);
    //     return item.todoStatus == statusController;
    //   }).toList();
    // } else {
    //   selectedTodo = todoList.where((var item) {
    //     //log(statusController);
    //     //log(listController);
    //     return item.todoStatus == statusController && item.isImportant == true;
    //   }).toList();
    // }
    notifyListeners();
  }

  List<ToDoModelClass> submitButton(bool isEdit, List<ToDoModelClass> todoList,
      [ToDoModelClass? todoObj]) {
    if (titleController.text.trim().isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        dateController.text.isNotEmpty &&
        timeController.text.isNotEmpty) {
      if (!isEdit) {
        todoList.add(ToDoModelClass(
          title: titleController.text.trim(),
          description: descriptionController.text.trim(),
          date: dateController.text.trim(),
          time: timeController.text.trim(),
          category: categoryController.text.trim(),
          selectedColor: selectedColor!,
          isImportant: isImportant,
          isCompleted: isCompleted,
          image: "hello",
          todoStatus: "Not Completed",
        ));
        sortList();
      }
    } else {
      todoObj!.title = titleController.text.trim();
      todoObj.description = descriptionController.text.trim();
      todoObj.date = dateController.text.trim();
      todoObj.time = timeController.text.trim();
      todoObj.category = categoryController.text.trim();
      todoObj.selectedColor = selectedColor!;
      todoObj.isImportant = isImportant;
      todoObj.isCompleted = isCompleted;
      sortList();
    }
    clearController();
    return todoList;
  }

  static void clearController() {
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
    timeController.clear();
    categoryController.clear();
    isImportant = false;
  }

  void deletToDo(ToDoModelClass obj) {
    if (obj.todoStatus == "Deleted") {
      todoList.remove(obj);
    } else {
      obj.todoStatus = "Deleted";
    }
    sortList();
    notifyListeners();
  }

  void updateImportance(ToDoModelClass toDoObj) {
    if (toDoObj.isCompleted == false) {
      toDoObj.isImportant == true
          ? toDoObj.isImportant = false
          : toDoObj.isImportant = true;
    }
    sortList();
    notifyListeners();
  }

  void completeTodo(int index) {
    _selectedTodo[index].isCompleted == false
        ? _selectedTodo[index].isCompleted = true
        : _selectedTodo[index].isCompleted = false;
    _selectedTodo[index].todoStatus == "Not Completed"
        ? _selectedTodo[index].todoStatus = "Completed"
        : _selectedTodo[index].todoStatus = "Not Completed";
    notifyListeners();
  }

  void changeTodoList(int index) {
    todoList[index].isCompleted
        ? todoList[index].todoStatus = "Completed"
        : todoList[index].todoStatus = "Not Completed";
    todoList[index].isCompleted
        ? todoList[index].isCompleted = true
        : todoList[index].isCompleted = false;
  }

  void changeListSection(String state) {
    listController = state;
    //updateList(todoList, selectedTodo);
  }

  void editToDo(ToDoModelClass obj) {
    titleController.text = obj.title;
    descriptionController.text = obj.description;
    dateController.text = obj.date;
    timeController.text = obj.time;
    selectedColor = obj.selectedColor;
    categoryController.text = obj.category;
    notifyListeners();
  }

  void showAll() {
    _selectedTodo =
        todoList.where((obj) => obj.todoStatus != "Deleted").toList();
    notifyListeners();
  }
}
