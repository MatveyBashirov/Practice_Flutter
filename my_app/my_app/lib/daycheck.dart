import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DaycheckForm extends StatefulWidget {
  @override
  State<DaycheckForm> createState() => DaycheckFormState();
}

class DaycheckFormState extends State<DaycheckForm>{

  final _formKey = GlobalKey<FormState>();
  final formWordOfDay = TextEditingController();
  final formGrade = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 115, 132, 217),
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Center(
          child: Text('Опросник'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(children: [
                Expanded(
                  child: TextFormField(
                    controller: formWordOfDay,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Как опишите день одним словом?',
                    ),
                    validator: (value){
                      if (value == null || value.isEmpty) {
                      return 'Введите данные';
                      }
                      return null;
                    },
                  ),
                )
              ]
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(children: [
                Expanded(
                  child: TextFormField(
                    controller: formGrade,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Поставьте оценку дню по 10-бальной шкале',
                    ),
                    validator: (value){
                      if (value == null || value.isEmpty) {
                      return 'Введите данные';
                      }
                      return null;
                    },
                  ),
                )
              ]
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: submitForm,
                  child: Text('Сохранить'))
              ],
            )
          ],
        ),
            ),
      ),
    );
  }

  void submitForm(){
    if(_formKey.currentState?.validate()??false){}
  }

}