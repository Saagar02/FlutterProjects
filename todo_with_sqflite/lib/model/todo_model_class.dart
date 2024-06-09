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

  
}
