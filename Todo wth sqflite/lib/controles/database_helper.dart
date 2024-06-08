import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app_intermediate/model/todomodel.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  String taskTable = 'TaskTable';
  String id = 'id';
  String title = 'title';
  String description = 'description';
  String date = 'date';
  String category = 'category';
  String completed = 'completed';

  DatabaseHelper.createInstance();
  factory DatabaseHelper() {
    _databaseHelper ??= DatabaseHelper.createInstance();
    return _databaseHelper!;
  }

  Future<Database> get database async {
    _database ??= await initializeDb();
    return _database!;
  }

  Future<Database> initializeDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}tickit.db';
    var tickitDatabase =
        await openDatabase(path, version: 1, onCreate: _createdDb);
    return tickitDatabase;
  }

  void _createdDb(Database db, int newVersion) async {
    await db.execute('''CREATE TABLE $taskTable(
        $id INTEGER PRIMARY KEY AUTOINCREMENT,
        $title TEXT, 
        $description TEXT, 
        $date TEXT, 
        $category TEXT, 
        $completed INTEGER)''');
  }

  Future getTasks() async {
    final localDB = await database;
    List<Map<String, dynamic>> listOfMap = await localDB.query('TaskTable');

    return List.generate(
      listOfMap.length,
      (index) {
        return ToDoModelClass(
            id: listOfMap[index]['id'],
            title: listOfMap[index]['title'],
            description: listOfMap[index]['description'],
            date: listOfMap[index]['date'],
            category: listOfMap[index]['category'],
            completed: listOfMap[index]['completed']);
      },
    );
  }

  Future deleteTasks(int? id) async {
    final localDB = await database;
    await localDB.delete(
      'TaskTable',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> updateTask(ToDoModelClass newObj) async {
    final db = await database;
    await db.update(
      'TaskTable',
      newObj.taskMap(),
      where: 'id = ?',
      whereArgs: [newObj.id],
    );
  }
}
