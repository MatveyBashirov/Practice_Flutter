import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: MyClass()
    ),
  ));
}

class MyClass extends StatefulWidget{
  MyClass({super.key});
  @override
  _MyClassState createState() => _MyClassState();
  }

class _MyClassState extends State<MyClass> {

  //Варианты переменных для изменения по нажатию
  String currentText = "Хотите узнать, как вы выглядите?";
  List<String> endings = [" чудесно!", " волшебно!", " шикарно!"];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {setState(() {
        index = (index + 1) % endings.length; // Циклический переход
        currentText = "Вы выглядите${endings[index]}";
      });  },
      child: Text(
        currentText,
        style: TextStyle(fontSize: 34)
      )
    );
  }
}
