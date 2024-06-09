import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_with_sqflite/model/todo_model_class.dart';

class ListOperations {
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

  //static List<ToDoModelClass> todoList = [];

  static List<ToDoModelClass> sortList(List<ToDoModelClass> todoList) {
    List<ToDoModelClass> selectedTodo = [];
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
        selectedTodo = todoList
            .where((todo) => todo.todoStatus == "Not Completed")
            .toList();
      }
      if (statusController == "Completed") {
        log("In completed");
        selectedTodo =
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
    return selectedTodo;
  }

  static List<ToDoModelClass> submitButton(
      bool isEdit, List<ToDoModelClass> todoList,
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
        sortList(todoList);
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
      sortList(todoList);
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

  static List deletToDo(
      ToDoModelClass? toDoObj, List<ToDoModelClass> todoList) {
    if (toDoObj!.todoStatus == "Deleted") {
      todoList.remove(toDoObj);
    } else {
      toDoObj.todoStatus = "Deleted";
    }
    return sortList(todoList);
  }

  static void updateImportance(ToDoModelClass toDoObj) {
    if (toDoObj.isCompleted == false) {
      toDoObj.isImportant == true
          ? toDoObj.isImportant = false
          : toDoObj.isImportant = true;
    }
  }

  static void completeTodo(ToDoModelClass toDoObj) {
    toDoObj.isCompleted == false
        ? toDoObj.isCompleted = true
        : toDoObj.isCompleted = false;
    toDoObj.todoStatus == "Not Completed"
        ? toDoObj.todoStatus = "Completed"
        : toDoObj.todoStatus = "Not Completed";
  }

  static void changeTodoList(ToDoModelClass toDoObj) {
    toDoObj.isCompleted
        ? toDoObj.todoStatus = "Completed"
        : toDoObj.todoStatus = "Not Completed";
    toDoObj.isCompleted
        ? toDoObj.isCompleted = true
        : toDoObj.isCompleted = false;
  }

  static void changeListSection(String state) {
    listController = state;
    //updateList(todoList, selectedTodo);
  }

  static void editToDo(ToDoModelClass todoObj) {
    titleController.text = todoObj.title;
    descriptionController.text = todoObj.description;
    dateController.text = todoObj.date;
    timeController.text = todoObj.time;
    selectedColor = todoObj.selectedColor;
    categoryController.text = todoObj.category;
  }
}
