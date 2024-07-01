// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:to_do_app/pages/my_buttons.dart';

// ignore: must_be_immutable
class DialogueBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onsave;
  VoidCallback oncancel;
  DialogueBox(
      {super.key,
      required this.controller,
      required this.onsave,
      required this.oncancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 252, 213, 94),
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(9))),
      content: Container(
        height: 150,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 252, 213, 94),
            borderRadius: BorderRadius.circular(19)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: 'Enter a Task'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Mybuttons(text: 'Save', onpressed: onsave),
                Mybuttons(text: 'Cancel', onpressed: oncancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
