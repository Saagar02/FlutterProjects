import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:todo_with_sqflite/controller/llist_operations.dart';
import 'package:todo_with_sqflite/model/todo_model_class.dart';

class ShowSheet {
  static void showbottomSheet(
      bool isEdit, BuildContext context, List<ToDoModelClass> todoList,
      [ToDoModelClass? todoObj]) {
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
                              controller: ListOperations.titleController,
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
                              controller: ListOperations.descriptionController,
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
                              ListOperations.isImportant = false;
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
                            child: ListOperations.isImportant == false
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
                              ListOperations.isImportant = true;
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
                            child: ListOperations.isImportant
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
                                      controller: ListOperations.dateController,
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
                                          ListOperations.dateController.text =
                                              formattedDate;
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
                                      controller: ListOperations.timeController,
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
                                            ListOperations.timeController.text =
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
                                        ListOperations.categoryController.text =
                                            "Personal";
                                      });
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.person_2_outlined,
                                          color: ListOperations
                                                      .categoryController
                                                      .text ==
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
                                            color: ListOperations
                                                        .categoryController
                                                        .text ==
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
                                      ListOperations.categoryController.text =
                                          "Home";
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.house_outlined,
                                          color: ListOperations
                                                      .categoryController
                                                      .text ==
                                                  "Home"
                                              ? const Color.fromRGBO(
                                                  69, 106, 221, 1)
                                              : Colors.grey),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        "Home",
                                        style: TextStyle(
                                            color: ListOperations
                                                        .categoryController
                                                        .text ==
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
                                      ListOperations.categoryController.text =
                                          "Work";
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.work_history_outlined,
                                          color: ListOperations
                                                      .categoryController
                                                      .text ==
                                                  "Work"
                                              ? const Color.fromRGBO(
                                                  69, 106, 221, 1)
                                              : Colors.grey),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        "Work",
                                        style: TextStyle(
                                            color: ListOperations
                                                        .categoryController
                                                        .text ==
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
                                  ListOperations.clearController();
                                  Navigator.of(context).pop();
                                },
                              )),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
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
                                      ? ListOperations.submitButton(
                                          isEdit,
                                          todoList,
                                          todoObj,
                                        )
                                      : ListOperations.submitButton(
                                          isEdit, todoList);
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
}
