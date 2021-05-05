import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:ismails_utils/ismails_utils.dart';

void main() {
  LoggerService.init();
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
  final GlobalKey<IsmailFormState> formKey = GlobalKey<IsmailFormState>();
  final List<IsmailFormFieldItem<String>> list = const [
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
            formKey.currentState?.saveAndValidate();
            final _fields = formKey.currentState!.fields;
            for (final item in _fields.keys) {
              ismailLog('key = $item value = ${_fields[item]!.value}');
            }
          },
        ),
      ),
      body: IsmailForm(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            IsmailGroupRadioFormField<String>(
              onChanged: print,
              name: 'Radio',
              decoration: const InputDecoration(labelText: 'Hello'),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please fix the errors';
                }
              },
              options: list,
            ),
            IsmailGroupCheckboxFormField<String>(
              name: 'Checkbox',
              decoration: const InputDecoration(labelText: 'Hello'),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please fix the errors';
                }
              },
              options: list,
            ),
            IsmailDropdownButtonFormField<String>(
              name: 'Dropdown',
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please fix the errors';
                }
              },
              options: list,
            ),
            IsmailTextFormField(
              // isPass: true,
              name: 'TextField',
            )
          ],
        ),
      ),
    );
  }
}
