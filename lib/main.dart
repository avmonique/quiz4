import 'package:flutter/material.dart';
import 'package:quiz4/screens/screen1.dart';

void main() {
  runApp(const Quiz4());
}

class Quiz4 extends StatelessWidget {
  const Quiz4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Quiz4Screen1(),
    );
  }
}