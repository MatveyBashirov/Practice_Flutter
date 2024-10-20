import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/appdata_provider.dart';

class DaycheckForm extends StatefulWidget {
  @override
  State<DaycheckForm> createState() => DaycheckFormState();
}

class DaycheckFormState extends State<DaycheckForm> {
  final _formKey = GlobalKey<FormState>();
  final formWordOfDay = TextEditingController();
  int? selectedGrade;
  @override
  Widget build(BuildContext context) {
    var data = context.dependOnInheritedWidgetOfExactType<AppDataProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: data?.appData.backColor,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите данные';
                        }
                        return null;
                      },
                    ),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(children: [
                  Expanded(
                    child: DropdownButtonFormField<int>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Поставьте оценку дню по 10-бальной шкале',
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'Введите данные';
                        }
                        return null;
                      },
                      items: List.generate(10, (index) {
                        return DropdownMenuItem<int>(
                          value: index + 1,
                          child: Text('${index + 1}'),
                        );
                      }),
                      onChanged: (value) {
                        setState(() {
                          selectedGrade = value;
                        });
                      },
                    ),
                  )
                ]),
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

  void submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Слово дня: ${formWordOfDay.text} Оценка: $selectedGrade'),
        ),
      );
    }
  }
}
