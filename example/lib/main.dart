import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ismails_utils/ismails_utils.dart';

import 'country_page.dart';

final logger = LoggerService();
final fileService = FileService.instance;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(home: CountryPage());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final GlobalKey<IsmailFormState> formKey = GlobalKey<IsmailFormState>();
  final List<IsmailFormFieldOption<String>> list = const [
    IsmailFormFieldOption(value: 'Ok'),
    IsmailFormFieldOption(value: 'No'),
    IsmailFormFieldOption(value: 'Never'),
    IsmailFormFieldOption(value: 'Noooo'),
    IsmailFormFieldOption(value: 'Noooo123'),
    IsmailFormFieldOption(value: 'Noooo123213'),
    IsmailFormFieldOption(value: 'Noooo123213q234'),
    IsmailFormFieldOption(value: 'Noooo123213q23421312'),
    IsmailFormFieldOption(value: 'Noooo123213q2342131212321'),
    IsmailFormFieldOption(value: 'Noooo123213q234213121232121213'),
    IsmailFormFieldOption(value: 'Noooo123213q2342131212321212131231'),
    IsmailFormFieldOption(value: 'Noooo123213q23421312123212121312311231'),
  ];

  final List<IsmailFormFieldOption<String>> _textFieldList = [];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: IsmailForm(
        key: formKey,
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
                Builder(builder: (context) {
                  return IsmailTextFormField(
                    // initialValue: 'Hello',
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      labelText: textField.value,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            log(textField.value);
                            _textFieldList.remove(textField);
                          });
                        },
                        icon: const Icon(Icons.delete_forever),
                      ),
                    ),
                    validator: (value) {
                      if (value != 'hello') return 'Please write Hello';
                    },
                    wantClearIcon: true,
                    name: textField.value,
                  );
                }),
              IsmailDateTimePickerFormField(
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
              IsmailCheckboxFormField(
                title: const Text('H'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                name: 'CheckboxSingle',
                validator: (value) {
                  if (value == null || !value) {
                    return 'Please select';
                  }
                },
              ),
              SizedBox(
                height: 200,
                child: IsmailChoiceChipFormField<String>(
                  name: 'Chips',
                  runSpacing: 10,
                  spacing: 10,
                  options: list,
                ),
              ),
              SubmitButton(
                onTap: () {
                  formKey.currentState?.saveAndValidate();
                  final _fields = formKey.currentState!.fields;
                  for (final item in _fields.keys) {
                    logger.info('key = $item value = ${_fields[item]!.value}');
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
