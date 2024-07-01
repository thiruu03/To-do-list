// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/data/database.dart';

import 'package:to_do_app/pages/tiles.dart';
import 'package:to_do_app/pages/dialogue_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    if (mybox.get('ToDoList') == null) {
      db.CreateInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  final mybox = Hive.box('mybox');
  final textcontroller = TextEditingController();
  Tododatabse db = Tododatabse();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.ToDoList[index][1] = !db.ToDoList[index][1];
    });
    db.updateDataBase();
  }

  void saveText() {
    setState(() {
      db.ToDoList.add([textcontroller.text, false]);

      textcontroller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogueBox(
          controller: textcontroller,
          onsave: saveText,
          oncancel: () => Navigator.of(context).pop(),
        );
      },
    );
    db.updateDataBase();
  }

  void removeTask(int index) {
    setState(() {
      db.ToDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[300],
      appBar: AppBar(
        title: const Center(
          child: Text('TO DO'),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 197, 25),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: const Color.fromARGB(255, 255, 197, 25),
        child: Icon(Icons.add),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      body: ListView.builder(
        itemCount: db.ToDoList.length,
        itemBuilder: (context, index) {
          return Coponents(
            taskname: db.ToDoList[index][0],
            taskcompleted: db.ToDoList[index][1],
            onchanged: (value) {
              checkBoxChanged(value, index);
            },
            deleteTask: (p0) {
              removeTask(index);
            },
          );
        },
      ),
    );
  }
}
