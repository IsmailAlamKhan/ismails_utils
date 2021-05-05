import 'package:flutter/material.dart';
import 'package:ismails_utils/ismails_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(home: Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final List<IsmailFormFieldItem<String>> list = [
    IsmailFormFieldItem(value: 'Ok'),
    IsmailFormFieldItem(value: 'No'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.save),
          onPressed: () {
            formKey.currentState?.validate();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          onChanged: () {},
          child: Column(
            children: [
              GroupRadioFormField<String>(
                initialValue: 'Ok',
                decoration: const InputDecoration(labelText: 'Hello'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please fix the errors';
                  }
                },
                onChanged: print,
                options: const [
                  IsmailFormFieldItem(value: 'Ok'),
                  IsmailFormFieldItem(value: 'No'),
                ],
              ),
              GroupCheckboxFormField<String>(
                initialValue: ['No'],
                decoration: const InputDecoration(labelText: 'Hello'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please fix the errors';
                  }
                },
                onChanged: print,
                options: const [
                  IsmailFormFieldItem(value: 'Ok'),
                  IsmailFormFieldItem(value: 'No'),
                ],
              ),
              CustomDropdownFormField<String>(
                decoration: const InputDecoration(),
                onChanged: print,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please fix the errors';
                  }
                },
                options: list,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
