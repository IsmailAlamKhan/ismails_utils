import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ismails_utils/ismails_utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> with Logger {
  final List<IsmailFormFieldOption<String>> list = const [
    IsmailFormFieldOption(value: 'Ok'),
    IsmailFormFieldOption(value: 'No'),
  ];
  final formController = IsmailFormController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: SubmitButton(
        formController: formController,
        onTap: () {
          formController.saveAndValidate();
          final _fields = formController.value;
          for (final item in _fields.keys) {
            logger.info('key = $item value = ${_fields[item]!}');
          }
        },
      ),
      body: IsmailForm(
        controller: formController,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                IsmailTextFormField(
                  name: 'Hello',
                  valueTransformer: (String? value) => value.toString().toInt(),
                ),
                formController.builder<IsmailFormController>(
                  (_, notifier, ___) =>
                      Text('${notifier.value['Hello'].runtimeType}'),
                ),
              ],
            ),
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
    required this.formController,
  }) : super(key: key);
  final VoidCallback? onTap;
  final IsmailFormController formController;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder()),
      onPressed: onTap,
      child: const Text('Submit'),
    );
  }
}
