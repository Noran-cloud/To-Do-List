import 'package:flutter/material.dart';
import 'package:project2/BMI_calculator.dart';
import 'package:project2/To_do_List.dart';
//import 'package:project2/BMI_result.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  ToDoList(),
      debugShowCheckedModeBanner: false,
    );
  }
}
