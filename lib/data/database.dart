// ignore_for_file: non_constant_identifier_names

import 'package:hive_flutter/hive_flutter.dart';

class Tododatabse {
  List ToDoList = [];
  final mybox = Hive.box('mybox');

  void CreateInitialData() {
    ToDoList = [
      ['Code a app', false],
      ['Do Exercise', false],
    ];
  }

  void loadData() {
    ToDoList = mybox.get('ToDoList');
  }

  void updateDataBase() {
    mybox.put('ToDoList', ToDoList);
  }
}
