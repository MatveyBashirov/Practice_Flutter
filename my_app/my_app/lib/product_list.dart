// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_app/appdata_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListClass extends StatefulWidget {
  const ListClass({super.key});
  @override
  _ListClassState createState() => _ListClassState();
} 

class _ListClassState extends State<ListClass>{
  
  TextEditingController controller = TextEditingController();
  List<String> products = [];
  late SharedPreferences prefs;

  @override
  void initState(){
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async{
    prefs = await SharedPreferences.getInstance();
    setState(() {
      products = prefs.getStringList('products')??[];
    });
  }

  Future<void> saveProducts() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('products', products);
  }

  void addToList(){
    String product = controller.text;
    if (product.isNotEmpty) {
    setState(() {
      products.add(product);
    });
    controller.clear();
    saveProducts();
  }
  }

  void removeFromList(int index) {
    setState(() {
      products.removeAt(index);
    });
    saveProducts();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, int> counter = ModalRoute.of(context)!.settings.arguments as Map<String, int>;
    var data = context.dependOnInheritedWidgetOfExactType<AppDataProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: data?.appData.backColor,
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        title: 
        Center(
          child: Text("Список покупок"),
        )
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Вы нажали на кнопку ${counter['counter']} раз'),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Введите название продукта:"),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 20.0),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Название",
                      )
                    ),
                  ),
                  ElevatedButton(
                    onPressed: addToList,
                    child: Text('Добавить продукт'),
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
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: Text(products[index]),),
                      IconButton(
                          icon: Icon(Icons.delete, color: Colors.grey),
                          onPressed: () => removeFromList(index),
                        ),
                    ],
                  ),
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