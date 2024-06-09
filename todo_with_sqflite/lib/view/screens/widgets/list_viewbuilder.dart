import 'package:flutter/material.dart';
import 'package:todo_with_sqflite/model/todo_model_class.dart';
import 'package:todo_with_sqflite/view/screens/widgets/todo_card.dart';

class ListViewBuilder extends StatefulWidget {
  final List<ToDoModelClass> selectedTodo;

  const ListViewBuilder({super.key,required this.selectedTodo});

  @override
  State createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TodoCard(
          index: index,
          todoList: widget.selectedTodo,
        );
      },
      itemCount: widget.selectedTodo.length,
    );
  }
}
