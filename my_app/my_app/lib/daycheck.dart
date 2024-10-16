import 'package:flutter/material.dart';

class DaycheckForm extends StatefulWidget {
  @override
  State<DaycheckForm> createState() => DaycheckFormState();
}

class DaycheckFormState extends State<DaycheckForm>{

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Опросник'),
        ),
      ),
      body: Form(
      key: _formKey,
      child: Column(
        children: [
          Row(children: [
            Expanded(
              child: TextFormField(
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
    );
  }

  void submitForm(){
    if(_formKey.currentState?.validate()??false){
      
    }
  }

}