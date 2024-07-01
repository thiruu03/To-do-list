import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Mybuttons extends StatelessWidget {
  final String text;
  VoidCallback onpressed;
  Mybuttons({super.key, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      color: const Color.fromARGB(255, 255, 197, 25),
      child: Text(text),
    );
  }
}
