// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_app/lookcheck.dart';
import 'package:my_app/product_list.dart';

class Homepage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 115, 132, 217),
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Center(child: Text('Добро пожаловать!')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Text('Добрый день! Выглядите задумчивым,\nчто я могу для вас сделать?',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed:(){ Navigator.pushNamed(context, '/lookcheck');},
                child: Text('Я хочу чтобы\nменя похвалили...', textAlign: TextAlign.center,)
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed:(){ Navigator.pushNamed(context, '/products');},
                child: Text('Я опять забыл\nчто хочу купить...', textAlign: TextAlign.center)
                ),
            )
          ],
        ),
      )
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Пример навигации',
      initialRoute: '/',
      routes: {
        '/': (context) => Homepage(),
        '/lookcheck': (context) => MyClass(),
        '/products': (context) => ListClass(),
      },
    );
  }
}

void main() {
  runApp(MyApp());
}
