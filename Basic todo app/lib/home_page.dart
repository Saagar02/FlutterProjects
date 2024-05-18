import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // For FontAwesome Icons
import 'package:todolist/todo_model_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Color? _selectedColor = Colors.yellow.shade200;
  bool _isBVisible = true;
  final bool _isImportant = false;
  final bool _isCompleted = false;
  String _listController = "All";
  String _statusController = "Not Completed";
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

  static List<ToDoModelClass> todoList =[
    ToDoModelClass(
      title: "Not Complete ToDo 1",
      description: "Take notes of every app you write ",
      date: "10 July 2023",
      time: "12:30",
      category: "Personal",
      selectedColor: Colors.yellow.shade200,
      isImportant : true,
      isCompleted: false,
      todoStatus: "Not Completed",
    ),

  ToDoModelClass(
    title: "Not Complete ToDo 2",
    description: "Meet the backend team ",
    date: "10 July 2023",
    time: "12:30",
    category: "Work",
    selectedColor: Colors.green.shade200,
    isImportant: false,
    isCompleted: false,
    todoStatus: "Not Completed",
  ),
  ToDoModelClass(
    title: "Completed Todo 1",
    description: "Take notes of every app you write ",
    date: "10 July 2023",
    time: "12:30",
    category: "Personal",
    selectedColor: Colors.red.shade200,
    isImportant : true,
    isCompleted: true,
    todoStatus: "Completed",
  ),

  ToDoModelClass(
    title: "Completed Todo 2",
    description: "Meet the backend team ",
    date: "10 July 2023",
    time: "12:30",
    category: "Work",
    selectedColor: Colors.blue.shade200,
    isImportant: false,
    isCompleted: true,
    todoStatus: "Completed",
  ),
  ToDoModelClass(
    title: "Deleted Todo 1",
    description: "Take notes of every app you write ",
    date: "10 July 2023",
    time: "12:30",
    category: "Personal",
    selectedColor: Colors.green.shade200,
    isImportant : true,
    isCompleted: true,
    todoStatus: "Deleted",
  ),

  ToDoModelClass(
    title: "Deleted Todo 2",
    description: "Meet the backend team ",
    date: "10 July 2023",
    time: "12:30",
    category: "Work",
    selectedColor: Colors.blue.shade200,
    isImportant: false,
    isCompleted: true,
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
  void updateList(){
    
    if(_listController == "All"){
      
      if(_statusController == "Not Completed"){
        setState(() {
          selectedTodo  = todoList.where((ToDoModelClass item) {
            return item.todoStatus == "Not Completed";
          }).toList();
        });
      }else if(_statusController == "Completed"){
        setState(() {
          selectedTodo  = todoList.where((ToDoModelClass item) {
            return item.todoStatus == "Completed";
          }).toList();
        });
      }else{
        selectedTodo  = todoList.where((ToDoModelClass item) {
            return item.todoStatus == "Deleted" ;
          }).toList();
      }
    }else{
      if(_statusController == "Not Completed"){
        setState(() {
          selectedTodo  = todoList.where((ToDoModelClass item) {
            return item.todoStatus == "Not Completed" && item.isImportant == true;
          }).toList();
        });
      }else if(_statusController == "Completed"){
        setState(() {
          selectedTodo  = todoList.where((ToDoModelClass item) {
            return item.todoStatus == "Completed" && item.isImportant == true;
          }).toList();
        });
      }else{
        selectedTodo  = todoList.where((ToDoModelClass item) {
            return item.todoStatus == "Deleted" && item.isImportant == true;
          }).toList();
      }
    }
  }

  void submitButton(bool isEdit , [ToDoModelClass? todoObj]){
    if(_titleController.text.trim().isNotEmpty && _descriptionController.text.isNotEmpty && _dateController.text.isNotEmpty && _timeController.text.isNotEmpty){
      if(!isEdit){
        setState(() {
          todoList.add(
            ToDoModelClass(
              title: _titleController.text.trim(), 
              description: _descriptionController.text.trim(), 
              date: _dateController.text.trim(),
              time : _timeController.text.trim(),
              category: _categoryController.text.trim(),
              selectedColor: _selectedColor!,
              isImportant: _isImportant,
              isCompleted: _isCompleted,
              todoStatus: "Not Completed",   
            )
          );
        });
      }else{
        setState(() {
          todoObj!.title = _titleController.text.trim();
          todoObj.description = _descriptionController.text.trim();
          todoObj.date = _dateController.text.trim();
          todoObj.time = _timeController.text.trim();
          todoObj.category = _categoryController.text.trim();
          todoObj.selectedColor = _selectedColor!;
          todoObj.isImportant = _isImportant;
          todoObj.isCompleted = _isCompleted;
        });
      }
    }
    clearController();
  }

  void clearController(){
    _titleController.clear();
    _descriptionController.clear();
    _dateController.clear();
    _timeController.clear();
    _categoryController.clear();
  }
  
  void deletToDo(ToDoModelClass toDoObj){
    setState(() {
      if(toDoObj.todoStatus == "Deleted"){
        todoList.remove(toDoObj);
      }else{
        toDoObj.todoStatus = "Deleted";
      }
      selectedTodo.remove(toDoObj);
    });
  }

  void isImportant(ToDoModelClass toDoObj){
    setState(() {
      if(toDoObj.isCompleted == false){
        toDoObj.isImportant == true ? toDoObj.isImportant = false : toDoObj.isImportant = true ;
        /*if(toDoObj.isImportant == true){
          if(toDoObj.todoStatus == "Not Completed"){
            notCompletodoList.add(toDoObj);
          }else if(toDoObj.todoStatus == "Completed"){
            completedTodoList.add(toDoObj);
          }else{
            deletedTodoList.add(toDoObj);
          }
        }else{
          if(toDoObj.todoStatus == "Not Completed"){
            notCompletodoList.remove(toDoObj);
          }else if(toDoObj.todoStatus == "Completed"){
            completedTodoList.remove(toDoObj);
          }else{
            deletedTodoList.remove(toDoObj);
          }
        }*/
      }  
    });
  }

  void completeTodo(ToDoModelClass toDoObj){

    /*if(toDoObj.todoStatus == "Not Completed"){
      completedTodoList.add(toDoObj);
      notCompletodoList.remove(toDoObj);
    }else{
      completedTodoList.remove(toDoObj);
      notCompletodoList.add(toDoObj);
    }*/
    toDoObj.isCompleted == false ? toDoObj.isCompleted = true : toDoObj.isCompleted =    false; 
    toDoObj.todoStatus == "Not Completed"? toDoObj.todoStatus = "Completed" : toDoObj.todoStatus = "Not Completed";
    
  }

  void changeTodoList(ToDoModelClass toDoObj){
    //toDoObj.isCompleted ? completedTodoList.add(toDoObj) : notCompletodoList.add(toDoObj);
    toDoObj.isCompleted ? toDoObj.todoStatus = "Completed" : toDoObj.todoStatus = "Not Completed";
    toDoObj.isCompleted ? toDoObj.isCompleted = true : toDoObj.isCompleted = false;
    //deletedTodoList.remove(toDoObj);
  }
  
  void editToDo(ToDoModelClass todoObj){
    _titleController.text = todoObj.title;
    _descriptionController.text = todoObj.description;
    _dateController.text = todoObj.date;
    _timeController.text = todoObj.time;
    _selectedColor = todoObj.selectedColor;
    _categoryController.text = todoObj.category;
    showbottomSheet(true,todoObj);
  }
  
  Widget buildCircle() {
    return Row(
      children: [
        const Spacer(),
        GestureDetector(
          onTap: () => setState(() {
            _selectedColor =Colors.red.shade200;
          }),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
              border: Border.all(color: Colors.black,width: 2)
            ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => setState(() {
            _selectedColor =Colors.blue.shade200;
          }),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
              border: Border.all(color: Colors.black,width: 2)
            ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => setState(() {
            _selectedColor =Colors.yellow.shade200;
          }),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.yellow,
              border: Border.all(color: Colors.black,width: 2)
            ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => setState(() {
            _selectedColor =Colors.green.shade200;
          }),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
              border: Border.all(color: Colors.black,width: 2)
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
  
  void showbottomSheet(bool isEdit , [ToDoModelClass? todoObj]){
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      shape:const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  height: 500,
                  width: 360,  
                  decoration:const  BoxDecoration(
                    color:Colors.white ,
                    borderRadius:BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                    )
                  ),
                  child:Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 10,),
                        const Text("Create Task",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 56, 81, 194),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                        Column(
                          children: [
                            const Align(alignment: Alignment.topLeft,child: Text("Title",style: TextStyle(color: Color(0xFF667EEA),fontWeight: FontWeight.w500))),//Color(0xFF02A7B1),))),
                            Container(
                              height: 40,
                              width: 330,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: TextField(
                                controller: _titleController,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color(0xFF667EEA),//Color(0xFF02A7B1),
                                      width: 1,
                                    )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color(0xFF667EEA),
                                      width: 1,
                                    )
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8,),
                        Column(
                          children: [
                            const Align(alignment: Alignment.topLeft,child: Text("Description",style: TextStyle(color: Color(0xFF667EEA),fontWeight: FontWeight.w500))),//Color(0xFF02A7B1),))),
                            Container(
                              height: 60,
                              width: 330,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFF667EEA),//const Color(0xFF02A7B1)
                                ),
                                borderRadius:const  BorderRadius.all(Radius.circular(10))
                              ),
                              child: TextField(
                                controller: _descriptionController,
                                maxLines: 5,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                  focusedBorder: InputBorder.none,
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        /* const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 10,),
                              const Text("Not Important",
                                style: TextStyle(
                                  color: Color(0xFF667EEA),
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              const SizedBox(width: 5,),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isImportant = !_isImportant;
                                  });
                                },
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: _isImportant ? Colors.blue : Colors.grey),
                                  ),
                                  child: _isImportant
                                      ? const Icon(Icons.check, size: 20, color: Colors.red)
                                      : null,
                                ),
                              ),
                              const SizedBox(width: 50,),
                              const Text("Important",
                                style: TextStyle(
                                  color: Color(0xFF667EEA),
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              const SizedBox(width: 5,),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isImportant = !_isImportant;
                                  });
                                },
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: _isImportant ? Colors.blue : Colors.grey),
                                  ),
                                  child: _isImportant
                                      ? null
                                      : const Icon(Icons.check, size: 20, color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        */
                        const SizedBox(height: 8,),
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Align(alignment: Alignment.topLeft,child: Text("Date",style: TextStyle(color: Color(0xFF667EEA),fontWeight: FontWeight.w500))),//Color(0xFF02A7B1),))),
                                Container(
                                  height: 40,
                                  width: 155,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xFF667EEA),//const Color(0xFF02A7B1),
                                    ),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: TextField(
                                    readOnly: true,
                                    controller: _dateController,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 14.0,fontWeight: FontWeight.w500,color: Colors.black),
                                    decoration:const InputDecoration(
                                      contentPadding: EdgeInsets.all(4),
                                      hintText: "dd/mm/yy",
                                      suffixIcon: Icon(FontAwesomeIcons.calendarAlt,color: Colors.grey,),
                                      border: InputBorder.none
                                    ),
                                    onTap:()async {
                                      DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2100,12,31),
                                      );
                                      String formattedDate = DateFormat.yMMMd().format(pickedDate!);
                                      setState(() {
                                        _dateController.text = formattedDate;
                                      });
                                    }
                                  )
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Align(alignment: Alignment.topLeft,child: Text("Time",style: TextStyle(color: Color(0xFF667EEA),fontWeight: FontWeight.w500))),//Color(0xFF02A7B1),))),
                                Container(
                                  height: 40,
                                  width: 155,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xFF667EEA),//const Color(0xFF02A7B1),
                                    ),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: TextField(
                                    readOnly: true,
                                    controller: _timeController,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500,color: Colors.black),
                                    decoration:const InputDecoration(
                                      contentPadding:EdgeInsets.all(5),
                                      hintText: "hh/mm",
                                      suffixIcon:Icon(FontAwesomeIcons.clock,color: Colors.grey,),
                                      border: InputBorder.none
                                    ),
                                    onTap:()async {
                                      TimeOfDay? pickedTime = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      );
                                      String formattedTime = "${pickedTime!.hour}:${pickedTime.minute}";
                                      setState(() {
                                        _timeController.text = formattedTime;
                                      });
                                    }
                                  )
                                ),
                              ],
                            ),
                            
                          ],
                        ),
                        const SizedBox(height: 8,),
                        Column(
                          children: [
                            const Align(alignment: Alignment.topLeft,child: Text("Category",style: TextStyle(color: Color(0xFF667EEA),fontWeight: FontWeight.w500))),
                            const SizedBox(height: 2,),
                            Container(
                              height: 40,
                              width: 330,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFF667EEA),//const Color(0xFF02A7B1)
                                ),
                                borderRadius:const  BorderRadius.all(Radius.circular(10))
                              ),
                              child:Row(
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
                                    child:Row(
                                      children: [
                                        Icon(Icons.person_2_outlined , color : _categoryController.text == "Personal" 
                                          ? const Color(0xFF667EEA) : Colors.grey),
                                        const SizedBox(width: 2,),
                                        Text("Personal",style: TextStyle(color: _categoryController.text == "Personal" 
                                          ? const Color(0xFF667EEA) : Colors.grey, fontWeight: FontWeight.w500),
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
                                    child:Row(
                                      children: [
                                        Icon(Icons.house_outlined,color : _categoryController.text == "Home" 
                                          ? const Color(0xFF667EEA) : Colors.grey),
                                        const SizedBox(width: 2,),
                                        Text("Home",style: TextStyle(color: _categoryController.text == "Home" 
                                          ? const Color(0xFF667EEA) : Colors.grey,fontWeight: FontWeight.w500),
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
                                    child:Row(
                                      children: [
                                        Icon(Icons.work_history_outlined ,
                                          color : _categoryController.text == "Work" 
                                          ? const Color(0xFF667EEA) : Colors.grey),
                                        const SizedBox(width: 2,),
                                        Text("Work",style: TextStyle(color: _categoryController.text == "Work" 
                                          ? const Color(0xFF667EEA) : Colors.grey,fontWeight: FontWeight.w500),
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
                        const SizedBox(height: 8,),
                        Column(
                          children: [
                            const Align(alignment: Alignment.topLeft,child: Text("Color",style: TextStyle(color: Color(0xFF667EEA),fontWeight: FontWeight.w500))),//Color(0xFF02A7B1),))),
                            Container(
                              height: 40,
                              width: 330,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFF667EEA),//const Color(0xFF02A7B1)
                                ),
                                borderRadius:const  BorderRadius.all(Radius.circular(10))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: buildCircle()
                              )
                            )
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 150,
                              decoration:BoxDecoration(
                                gradient:const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                  Color(0xFF667EEA), 
                                  Color(0xFF794BCB),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: ElevatedButton(
                                onPressed: ()=>(
                                  setState(() {
                                    clearController();
                                    Navigator.of(context).pop();
                                  },)
                                ), 
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,//MaterialStateProperty.all<Color>(const Colors.transparent)//MaterialStateProperty.all<Color>(const Color(0xFF02A7B1))
                                  foregroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),
                                child: const Text("Cancel",
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
                              decoration:BoxDecoration(
                                gradient:const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                  Color(0xFF667EEA), 
                                  Color(0xFF794BCB),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: ElevatedButton(
                                onPressed: ()=>(
                                  setState(() {
                                    isEdit ? submitButton(isEdit,todoObj) : submitButton(isEdit);
                                    Navigator.of(context).pop();
                                  },)
                                ), 
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,//MaterialStateProperty.all<Color>(const Colors.transparent)//MaterialStateProperty.all<Color>(const Color(0xFF02A7B1))
                                  foregroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),
                                child: const Text("Submit",
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
      /*builder: (BuildContext context){
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: 500,
            width: 360,  
            decoration:const  BoxDecoration(
              color:Colors.white ,
              borderRadius:BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)
              )
            ),
            child:Padding(
              padding:const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10,),
                  const Text("Create Task",
                          style: TextStyle(
                            color: Color.fromARGB(255, 56, 81, 194),
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                  Column(
                    children: [
                      const Align(alignment: Alignment.topLeft,child: Text("Title",style: TextStyle(color: Color(0xFF667EEA),fontWeight: FontWeight.w500))),//Color(0xFF02A7B1),))),
                      Container(
                        height: 40,
                        width: 330,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xFF667EEA),//Color(0xFF02A7B1),
                                width: 1,
                              )
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xFF667EEA),
                                width: 1,
                              )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Column(
                    children: [
                      const Align(alignment: Alignment.topLeft,child: Text("Description",style: TextStyle(color: Color(0xFF667EEA),fontWeight: FontWeight.w500))),//Color(0xFF02A7B1),))),
                      Container(
                        height: 60,
                        width: 330,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF667EEA),//const Color(0xFF02A7B1)
                          ),
                          borderRadius:const  BorderRadius.all(Radius.circular(10))
                        ),
                        child: TextField(
                          controller: _descriptionController,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  /* const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 10,),
                        const Text("Not Important",
                          style: TextStyle(
                            color: Color(0xFF667EEA),
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(width: 5,),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isImportant = !_isImportant;
                            });
                          },
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: _isImportant ? Colors.blue : Colors.grey),
                            ),
                            child: _isImportant
                                ? const Icon(Icons.check, size: 20, color: Colors.red)
                                : null,
                          ),
                        ),
                        const SizedBox(width: 50,),
                        const Text("Important",
                          style: TextStyle(
                            color: Color(0xFF667EEA),
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(width: 5,),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isImportant = !_isImportant;
                            });
                          },
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: _isImportant ? Colors.blue : Colors.grey),
                            ),
                            child: _isImportant
                                ? null
                                : const Icon(Icons.check, size: 20, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  */
                  const SizedBox(height: 8,),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Align(alignment: Alignment.topLeft,child: Text("Date",style: TextStyle(color: Color(0xFF667EEA),fontWeight: FontWeight.w500))),//Color(0xFF02A7B1),))),
                          Container(
                            height: 40,
                            width: 155,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFF667EEA),//const Color(0xFF02A7B1),
                              ),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: TextField(
                              readOnly: true,
                              controller: _dateController,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 14.0,fontWeight: FontWeight.w500,color: Colors.black),
                              decoration:const InputDecoration(
                                contentPadding: EdgeInsets.all(4),
                                hintText: "dd/mm/yy",
                                suffixIcon: Icon(FontAwesomeIcons.calendarAlt,color: Colors.grey,),
                                border: InputBorder.none
                              ),
                              onTap:()async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2100,12,31),
                                );
                                String formattedDate = DateFormat.yMMMd().format(pickedDate!);
                                setState(() {
                                  _dateController.text = formattedDate;
                                });
                              }
                            )
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Align(alignment: Alignment.topLeft,child: Text("Time",style: TextStyle(color: Color(0xFF667EEA),fontWeight: FontWeight.w500))),//Color(0xFF02A7B1),))),
                          Container(
                            height: 40,
                            width: 155,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFF667EEA),//const Color(0xFF02A7B1),
                              ),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: TextField(
                              readOnly: true,
                              controller: _timeController,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500,color: Colors.black),
                              decoration:const InputDecoration(
                                contentPadding:EdgeInsets.all(5),
                                hintText: "hh/mm",
                                suffixIcon:Icon(FontAwesomeIcons.clock,color: Colors.grey,),
                                border: InputBorder.none
                              ),
                              onTap:()async {
                                TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                String formattedTime = "${pickedTime!.hour}:${pickedTime.minute}";
                                setState(() {
                                  _timeController.text = formattedTime;
                                });
                              }
                            )
                          ),
                        ],
                      ),
                      
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Column(
                    children: [
                      const Align(alignment: Alignment.topLeft,child: Text("Category",style: TextStyle(color: Color(0xFF667EEA),fontWeight: FontWeight.w500))),
                      const SizedBox(height: 2,),
                      Container(
                        height: 40,
                        width: 330,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF667EEA),//const Color(0xFF02A7B1)
                          ),
                          borderRadius:const  BorderRadius.all(Radius.circular(10))
                        ),
                        child:Row(
                          children: [
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                _categoryController.text = "Personal";
                              },
                              child:Row(
                                children: [
                                  Icon(Icons.person_2_outlined , color : _categoryController.text == "Personal" 
                                    ? const Color(0xFF667EEA) : Colors.grey),
                                  const SizedBox(width: 2,),
                                  Text("Personal",style: TextStyle(color: _categoryController.text == "Personal" 
                                    ? const Color(0xFF667EEA) : Colors.grey, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                _categoryController.text = "Home";
                              },
                              child:Row(
                                children: [
                                  Icon(Icons.house_outlined,color : _categoryController.text == "Home" 
                                    ? const Color(0xFF667EEA) : Colors.grey),
                                  const SizedBox(width: 2,),
                                  Text("Home",style: TextStyle(color: _categoryController.text == "Home" 
                                    ? const Color(0xFF667EEA) : Colors.grey,fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                _categoryController.text = "Work";
                              },
                              child:Row(
                                children: [
                                  Icon(Icons.work_history_outlined ,
                                    color : _categoryController.text == "Work" 
                                    ? const Color(0xFF667EEA) : Colors.grey),
                                  const SizedBox(width: 2,),
                                  Text("Work",style: TextStyle(color: _categoryController.text == "Work" 
                                    ? const Color(0xFF667EEA) : Colors.grey,fontWeight: FontWeight.w500),
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
                  const SizedBox(height: 8,),
                  Column(
                    children: [
                      const Align(alignment: Alignment.topLeft,child: Text("Color",style: TextStyle(color: Color(0xFF667EEA),fontWeight: FontWeight.w500))),//Color(0xFF02A7B1),))),
                      Container(
                        height: 40,
                        width: 330,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF667EEA),//const Color(0xFF02A7B1)
                          ),
                          borderRadius:const  BorderRadius.all(Radius.circular(10))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: buildCircle()
                        )
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 150,
                        decoration:BoxDecoration(
                          gradient:const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                            Color(0xFF667EEA), 
                            Color(0xFF794BCB),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ElevatedButton(
                          onPressed: ()=>(
                            setState(() {
                              clearController();
                              Navigator.of(context).pop();
                            },)
                          ), 
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,//MaterialStateProperty.all<Color>(const Colors.transparent)//MaterialStateProperty.all<Color>(const Color(0xFF02A7B1))
                            foregroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          child: const Text("Cancel",
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
                        decoration:BoxDecoration(
                          gradient:const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                            Color(0xFF667EEA), 
                            Color(0xFF794BCB),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ElevatedButton(
                          onPressed: ()=>(
                            setState(() {
                              isEdit ? submitButton(isEdit,todoObj) : submitButton(isEdit);
                              Navigator.of(context).pop();
                            },)
                          ), 
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,//MaterialStateProperty.all<Color>(const Colors.transparent)//MaterialStateProperty.all<Color>(const Color(0xFF02A7B1))
                            foregroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          child: const Text("Submit",
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
      }*/
    );
  }
  
  Widget todos(int index , List todo){
    Image image ;
    if(todo[index].category == 'Work'){
      image = Image.asset("images/work.png");
    }else if(todo[index].category == 'Home'){
      image = Image.asset("images/home.png");
    }else{
      image = Image.asset("images/personal.png");
    }
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 8),
      child: GestureDetector(
        onLongPress: () {
          setState(() {
            isImportant(todo[index]);
            updateList();
          });
        },
        child: Container(
          
          decoration: BoxDecoration(
            color: todo[index].selectedColor,
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 10),
                color: Color.fromRGBO(0, 0, 0, 0.1),
                blurRadius: 10,
              )
            ],
            borderRadius: BorderRadius.circular(10),
            border: todo[index].isImportant? Border.all(
              color: const Color.fromRGBO(212, 175, 55, 1),
              width: 4
            ) : null
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 8 , left: 8 , top: 5 , bottom: 5),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 65,
                      width: 60,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: image
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 20,
                                width: 184,
                                child: ListView(
                                  children: [
                                    Text(
                                      todo[index].title,
                                      maxLines: null,
                                      style:TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: const Color.fromRGBO(0, 0, 0, 1),
                                        decoration: todo[index].todoStatus == "Completed" ? TextDecoration.lineThrough : TextDecoration.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              
                              todo[index].todoStatus != "Deleted" ? Checkbox(
                                value: todo[index].todoStatus == "Completed", 
                                onChanged: (bool ? value){
                                  setState(() {
                                    completeTodo(todo[index]);
                                    updateList();
                                  });
                                }
                              ) :
                              Container(
                                height: 30,
                                width: 50,
                                decoration:BoxDecoration(
                                  gradient:const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                    Color(0xFF667EEA), 
                                    Color(0xFF794BCB),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: GestureDetector(
                                  onTap: ()=>(
                                    setState(() {
                                      changeTodoList(todo[index]);
                                      updateList();
                                    },)
                                  ),
                                  child: const Center(
                                    child: Text("Undo",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                            ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            todo[index].description,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(84, 84, 84, 1),
                              decoration: todo[index].todoStatus == "Completed" ? TextDecoration.lineThrough : TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                  ],
                ),
                const SizedBox(height: 10,),
                const Divider(
                  color: Color.fromRGBO(72, 72, 72, 1), 
                  thickness: 1.0,
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    children: [
                      Text(
                        todo[index].date,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color:Color.fromRGBO(72, 72, 72, 1),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        todo[index].time,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color:Color.fromRGBO(72, 72, 72, 1),
                        ),
                      ),
                      
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          todo[index].todoStatus == "Not Completed" ? GestureDetector(
                            onTap: () {
                              editToDo(todo[index]);
                              updateList();
                            },
                            child: const Icon(
                              Icons.edit_outlined,
                              size: 28,
                              color: Color.fromRGBO(84, 84, 84, 1)//Color.fromRGBO(0, 139, 148, 1),
                            ),
                          ) : const SizedBox.shrink(),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                //todo != deletedTodoList ? deletedTodoList.add(todo[index]): null;
                                deletToDo(todo[index]);
                                updateList();
                              });
                            },
                            child: const Icon(
                              Icons.delete_outline,
                              size: 28,
                              color: Color.fromRGBO(84, 84, 84, 1)//Color.fromRGBO(0, 139, 148, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context){
    
    return Scaffold(
      appBar: AppBar(
        title:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const IconButton(onPressed: null, icon: Icon(Icons.menu,color: Colors.black,size: 30,)),
            const Text("To Do",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 22),),
            SizedBox(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("images/PassPort.jpg"),
              ),
            ),
          ]
      ),
      flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF667EEA), 
                Color(0xFF794BCB)], 
              ),
            ),
          ),
        //backgroundColor: //Color.fromARGB(250, 153, 51, 255),
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if(notification.direction == ScrollDirection.reverse || notification.direction == ScrollDirection.forward){
            setState(() {
              _isBVisible = false;
            });
          }
          if(notification.direction == ScrollDirection.idle){
            setState(() {
              _isBVisible = true;
            });
          }
          return true;
        },
        child:Padding(
            padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child:Column(
              children: [
                Container(
                  height: 40,
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap:(){
                          setState(() {
                            _listController = "All";
                            updateList();
                          });
                        },
                        child:Text("All",style: TextStyle(
                          decoration: _listController == "All" ? TextDecoration.underline : null,
                          decorationColor: const Color.fromARGB(255, 56, 81, 194),
                          decorationThickness: 2,
                          color: const Color.fromARGB(255, 56, 81, 194),
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                        ),),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        height: 20,
                        width: 2,
                        color: const Color.fromARGB(255, 56, 81, 194),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _listController = "Important";
                            updateList();
                          });
                        },
                        child:Text("Important",style: TextStyle(
                          decoration: _listController == "Important" ? TextDecoration.underline : null,
                          decorationColor: const Color.fromARGB(255, 56, 81, 194),
                          decorationThickness: 2,
                          color: const Color.fromARGB(255, 56, 81, 194),
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                        ),),
                      ),
                      const Spacer(),
                      DropdownButton<String>(
                        value: _statusController,
                        elevation: 0,
                        icon: const Icon(Icons.arrow_drop_down , color: Color.fromARGB(255, 56, 81, 194),),
                        iconSize: 24,
                        style:const TextStyle(color: Color.fromARGB(255, 56, 81, 194), fontSize: 18),
                        onChanged: (String? newValue) {
                          if(newValue != null){
                            setState(() {
                              _statusController = newValue;
                              updateList();
                            });                           
                          }
                        },
                        items: ["Not Completed","Completed","Deleted"].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,style:const TextStyle(
                              color: Color.fromARGB(255, 56, 81, 194),
                              fontSize: 15,
                              fontWeight: FontWeight.w500
                            ),),
                          );
                        }).toList(),
                    ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context,index){
                      return todos(index , selectedTodo);
                    },
                    itemCount: selectedTodo.length,
                  )
                ),
              ],
            ),
        ),
      ),
      
      floatingActionButton: Visibility(
        visible: _isBVisible,
        child: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding:const EdgeInsets.symmetric(vertical: 8 , horizontal: 10),
            child: FloatingActionButton(
              onPressed: () =>(
                showbottomSheet(false)
              ),
              backgroundColor: const Color.fromARGB(255, 114, 138, 248),
              child: const Icon(Icons.add),            
            ),
          ),
        ),
      ), 
    );
  }
} 