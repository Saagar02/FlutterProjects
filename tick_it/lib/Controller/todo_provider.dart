import 'dart:developer';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tick_it/Model/todo_model_class.dart';
import 'package:tick_it/View/bottom_sheet.dart';

class TodoProvider with ChangeNotifier {
  static Color? selectedColor = Colors.yellow.shade200;
  static bool isBVisible = true;
  static bool isImportant = false;
  static bool isCompleted = false;
  static SlidableController slidableController = SlidableController();
  String _listController = "All";
  String get listController => _listController;
  String _statusController = "Not Completed";
  String get statusController => _statusController;
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
      title: "Not Complete ToDo 3",
      description: "Not Complete ToDo 3 description",
      date: "Jan 1, 2024",
      time: "4:20 PM",
      category: "Home",
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
  List<ToDoModelClass> get todoList => _todoList;

  List<ToDoModelClass> _selectedList = [];
  List<ToDoModelClass> get selectedList => _selectedList;
  void _sortList() {
    if (_listController == "All") {
      _selectedList = _todoList
          .where((obj) => obj.todoStatus == _statusController)
          .toList();
    } else {
      _selectedList = _todoList
          .where((obj) =>
              obj.todoStatus == _statusController && obj.isImportant == true)
          .toList();
    }
  }

  void setListController(String newValue) {
    _listController = newValue;
    _sortList();
    notifyListeners();
  }

  void setStatusController(String newValue) {
    _statusController = newValue;
    _sortList();
    notifyListeners();
  }

  void initialize() {
    _selectedList =
        _todoList.where((obj) => obj.todoStatus == "Not Completed").toList();
  }

  void submitButton(bool isEdit, [ToDoModelClass? todoObj]) {
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
          todoStatus: "Not Completed",
        ));
        //sortList();
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
      //sortList();
    }
    clearController();
    _sortList();
    notifyListeners();
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
    _sortList();
    notifyListeners();
  }

  void updateImportance(ToDoModelClass toDoObj) {
    if (toDoObj.isCompleted == false) {
      toDoObj.isImportant == true
          ? toDoObj.isImportant = false
          : toDoObj.isImportant = true;
    }
    //sortList();
    notifyListeners();
  }

  void completeTodo(int index) {
    _todoList[index].isCompleted == false
        ? _todoList[index].isCompleted = true
        : _todoList[index].isCompleted = false;
    _todoList[index].todoStatus == "Not Completed"
        ? _todoList[index].todoStatus = "Completed"
        : _todoList[index].todoStatus = "Not Completed";
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
    _listController = state;
    //updateList(todoList, selectedTodo);
  }

  void editToDo(ToDoModelClass obj, BuildContext context) {
    titleController.text = obj.title;
    descriptionController.text = obj.description;
    dateController.text = obj.date;
    timeController.text = obj.time;
    selectedColor = obj.selectedColor;
    categoryController.text = obj.category;
    ShowSheet.showbottomSheet(true, context, todoList, obj);
    notifyListeners();
  }
}
