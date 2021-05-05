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
  final List<IsmailFormFieldOption<String>> list = const [
    IsmailFormFieldOption(value: 'Ok'),
    IsmailFormFieldOption(value: 'No'),
    IsmailFormFieldOption(value: 'Never'),
    IsmailFormFieldOption(value: 'Noooo'),
  ];

  final List<IsmailFormFieldOption<String>> _textFieldList = [];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _textFieldList.add(IsmailFormFieldOption(value: 'Index $index'));
            index++;
          });
        },
      ),
      body: IsmailForm(
        key: formKey,
        onChanged: (value) {
          LoggerService.instance.logToConsole(value.toString());
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: IsmailFormChangeListner(
                  builder: (__, _, form) => ListView.builder(
                    itemCount: form.inValidFields.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(form.inValidFields[index].name),
                    ),
                  ),
                ),
              ),
              IsmailRadioGroupFormField<String>(
                wantClearIcon: true,
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
              IsmailCheckboxGroupFormField<String>(
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
                wantClearIcon: true,
                name: 'Dropdown',
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please fix the errors';
                  }
                },
                options: list,
              ),
              for (var textField in _textFieldList)
                IsmailTextFormField(
                  // initialValue: 'Hello',
                  onChanged: (value) {},
                  decoration: InputDecoration(labelText: textField.value),
                  validator: (value) {
                    if (value != 'hello') return 'Please write Hello';
                  },
                  wantClearIcon: true,
                  name: textField.value,
                ),
              FormBuilderDateTimePicker(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                name: 'DateTime',
                validator: (value) {
                  if (value != null) {
                    if (value.isBefore(DateTime.now())) {
                      return 'Must be older';
                    }
                  }
                },
              ),
              SubmitButton(
                onTap: () {
                  formKey.currentState?.saveAndValidate();
                  final _fields = formKey.currentState!.fields;
                  for (final item in _fields.keys) {
                    ismailLog('key = $item value = ${_fields[item]!.value}');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
    this.onTap,
  }) : super(key: key);
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return IsmailFormChangeListner(
      builder: (context, child, form) => ElevatedButton(
        onPressed: !form.isValid ? null : onTap,
        child: const Text('Submit'),
      ),
    );
  }
}
