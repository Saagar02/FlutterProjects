import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_sqflite/controller/llist_operations.dart';
import 'package:todo_with_sqflite/model/todo_model_class.dart';

// ignore: must_be_immutable
class TodoCard extends StatefulWidget {
  final int? index;
  List<ToDoModelClass> todoList = [];
  TodoCard({super.key, required this.index});
  @override
  State<TodoCard> createState() => _TodoCardState(index: index);
}

class _TodoCardState extends State<TodoCard> {
  int? index;
  _TodoCardState({
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    log("To do card");
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
                          Provider.of<ListOperations>(context, listen: false)
                              .deletToDo(Provider.of<ListOperations>(context,
                                      listen: false)
                                  .selectedTodo[index!]);
                        });
                      },
                      child: const Icon(Icons.delete_outline,
                          size: 28,
                          color: Color.fromRGBO(
                              84, 84, 84, 1) //Color.fromRGBO(0, 139, 148, 1),
                          ),
                    ),
                    const Spacer(),
                    Provider.of<ListOperations>(context, listen: false)
                                .todoList[index!]
                                .todoStatus !=
                            "Deleted"
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                Provider.of<ListOperations>(context,
                                        listen: false)
                                    .completeTodo(index!);
                              });
                            },
                            child: Container(
                                height: 19,
                                width: 19,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          const Color.fromRGBO(84, 84, 84, 1),
                                      width: 2),
                                ),
                                child: Provider.of<ListOperations>(context,
                                                listen: false)
                                            .todoList[index!]
                                            .todoStatus ==
                                        "Completed"
                                    ? const Center(
                                        child: Icon(
                                        FontAwesomeIcons.check,
                                        size: 14,
                                        color: Color.fromRGBO(84, 84, 84, 1),
                                      ))
                                    : null))
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
                                        Provider.of<ListOperations>(context,
                                                listen: false)
                                            .todoList[index!]
                                            .title,
                                        maxLines: null,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Colors.white,
                                          decoration:
                                              Provider.of<ListOperations>(
                                                              context,
                                                              listen: false)
                                                          .todoList[index!]
                                                          .todoStatus ==
                                                      "Completed"
                                                  ? TextDecoration.lineThrough
                                                  : TextDecoration.none,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Provider.of<ListOperations>(context,
                                                  listen: false)
                                              .todoList[index!]
                                              .isImportant
                                          ? const Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            )
                                          : const SizedBox.shrink()
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Provider.of<ListOperations>(context,
                                                listen: false)
                                            .todoList[index!]
                                            .todoStatus !=
                                        "Completed"
                                    ? Provider.of<ListOperations>(context,
                                                    listen: false)
                                                .todoList[index!]
                                                .todoStatus !=
                                            "Deleted"
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                Provider.of<ListOperations>(
                                                        context,
                                                        listen: false)
                                                    .editToDo(Provider.of<
                                                                ListOperations>(
                                                            context,
                                                            listen: false)
                                                        .selectedTodo[index!]);
                                              });
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4),
                                              child: Text(
                                                "Edit",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        207,
                                                        232,
                                                        255,
                                                        1), //const Color.fromARGB(255, 121, 184, 165),
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                Provider.of<ListOperations>(
                                                        context,
                                                        listen: false)
                                                    .changeTodoList(index!);
                                              });
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4),
                                              child: Text(
                                                "Undo",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        207,
                                                        232,
                                                        255,
                                                        1), //const Color.fromARGB(255, 121, 184, 165),
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          )
                                    : const SizedBox.shrink(),
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
                                    Provider.of<ListOperations>(context,
                                            listen: false)
                                        .todoList[index!]
                                        .description,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(
                                          235, 231, 231, 1),
                                      decoration: Provider.of<ListOperations>(
                                                      context,
                                                      listen: false)
                                                  .todoList[index!]
                                                  .todoStatus ==
                                              "Completed"
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
                          Provider.of<ListOperations>(context, listen: false)
                              .todoList[index!]
                              .time,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          Provider.of<ListOperations>(context, listen: false)
                              .todoList[index!]
                              .date,
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
                          child: Image(
                              image: AssetImage(Provider.of<ListOperations>(
                                      context,
                                      listen: false)
                                  .todoList[index!]
                                  .image)),
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
}
