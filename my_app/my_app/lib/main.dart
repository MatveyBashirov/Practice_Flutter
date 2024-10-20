// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_app/app_data.dart';
import 'package:my_app/appdata_provider.dart';
import 'package:my_app/daycheck.dart';
import 'package:my_app/lookcheck.dart';
import 'package:my_app/product_list.dart';

class Util {
  static Color randomColor() {
    return Color(Random().nextInt(0xffffffff));
  }
}

class Homepage extends StatefulWidget{
  const Homepage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Homepage>{
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    var data = context.dependOnInheritedWidgetOfExactType<AppDataProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: data?.appData.backColor,
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
                onPressed:(){ Navigator.pushNamed(
                  context,
                  '/lookcheck',
                  arguments: <String, int>{
                    'counter': counter
                  });},
                child: Text('Я хочу чтобы\nменя похвалили...', textAlign: TextAlign.center,)
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed:(){ Navigator.pushNamed(
                  context,
                  '/products',
                  arguments: <String, int>{
                    'counter': counter
                  });
                },
                child: Text('Я опять забыл\nчто хочу купить...', textAlign: TextAlign.center)
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed:(){ Navigator.pushNamed(
                  context,
                  '/daycheck',
                  arguments: <String, int>{
                    'counter': counter
                  });
                },
                child: Text('Я опять забыл\nчто хочу купить...', textAlign: TextAlign.center)
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Кнопка антистресс:',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed:(){
                  counter++;
                  setState(() {
                    AppDataProvider.of(context)
                        ?.appData
                        .changeBackground(Util.randomColor());
                  });
                },
                child: Text('Нажми на меня!', textAlign: TextAlign.center)
                ),
            ),
          ],
        ),
      )
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Homepage(),
        '/lookcheck': (context) => MyClass(),
        '/products': (context) => ListClass(),
        '/daycheck': (context) => DaycheckForm(),
      },
    );
  }
}

void main() {
  runApp(
    AppDataProvider(
      appData: AppData(backColor: Color(0xFFB3E5FC)),
      child: MaterialApp(
      home: MyApp(),
        ),
    ));
}
