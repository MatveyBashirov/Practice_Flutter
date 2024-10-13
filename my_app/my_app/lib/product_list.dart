// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ListClass extends StatefulWidget {
  ListClass({super.key});
  @override
  _ListClassState createState() => _ListClassState();
}

class _ListClassState extends State<ListClass>{

  List<String> products = ['молоко', 'хлеб', 'печенье'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 115, 132, 217),
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        title: 
        Center(
          child: Text("Список покупок"),
        )
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Введите название продукта:"),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Название",
                      )
                    ),
                  )
                ],
              )
            ),
            Expanded(
              flex: 2,
              child:
              ListView.separated(
              itemBuilder: (BuildContext context, int index){
                return Container(
                  height: 50,
                  color: Color.fromARGB(255, 255, 250, 111),
                  child: Center(child: Text(products[index]),),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
              itemCount: products.length
              )
            )
          ],
        ),
      )
    );
  }
}