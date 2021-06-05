import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ismails_utils/ismails_utils.dart';

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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.settings)),
            ],
          ),
        ),
        bottomNavigationBar: SubmitButton(
          formController: formController,
          onTap: () {
            formController.saveAndValidate();
            final _fields = formController.fieldsWithoutDisposed;
            for (final item in _fields.keys) {
              logger.info('key = $item value = ${_fields[item]!.value}');
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
                  formController.builder<IsmailFormController>(
                    (_, notifier, ___) => AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      height: notifier.inValidFields.isEmpty ? 0 : 50,
                      child: ListView.builder(
                        itemCount: notifier.inValidFields.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(notifier.inValidFields[index].name),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
