import 'package:flutter/material.dart';

class MyClass extends StatefulWidget {
  MyClass({super.key});
  @override
  _MyClassState createState() => _MyClassState();
}

class _MyClassState extends State<MyClass> {
  //Варианты переменных для изменения по нажатию
  String currentText = "Хотите узнать, как вы выглядите?";
  List<String> endings = [" чудесно!", " волшебно!", " шикарно!"];
  List<String> images = [
    "assets/images/cat1.jpeg",
    "assets/images/cat2.jpg",
    "assets/images/cat3.jpg"
  ];
  List<String> fonts = ['TrueType', 'OpenType', 'TenorSans'];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 115, 132, 217),
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Center(child: Text('Генератор комплиментов')),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Padding(
            padding: EdgeInsets.all(30),
            child: Image.asset(images[index]),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  index = (index + 1) % endings.length; // Циклический переход
                  currentText = "Вы выглядите${endings[index]}";
                });
              },
              child: Text(currentText,
                  style: TextStyle(fontFamily: fonts[index], fontSize: 24)))
        ]))
    );
  }
}