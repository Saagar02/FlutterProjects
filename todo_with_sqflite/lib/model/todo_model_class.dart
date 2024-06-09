import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ToDoModelClass {
  String title;
  String description;
  String date;
  String time;
  String category;
  Color selectedColor;
  bool isImportant;
  bool isCompleted;
  String image;
  String todoStatus = "Not Completed";
  ToDoModelClass({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.selectedColor,
    required this.isImportant,
    required this.isCompleted,
    required this.image,
    required this.todoStatus,
    required this.category,
  });

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
}
