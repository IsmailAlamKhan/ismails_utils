import 'package:flutter/material.dart';
import 'package:ismails_utils/ismails_utils.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
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
                  formController.builder(
                    (_) => AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      height: formController.inValidFields.isEmpty ? 0 : 50,
                      child: ListView.builder(
                        itemCount: formController.inValidFields.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(formController.inValidFields[index].name),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Column(
                          children: [
                            IsmailRadioGroupFormField<String>(
                              wantClearIcon: true,
                              onChanged: print,
                              name: 'Radio',
                              decoration:
                                  const InputDecoration(labelText: 'Hello'),
                              validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return 'Please fix the errors';
                                }
                              },
                              options: list,
                            ),
                            IsmailCheckboxGroupFormField<String>(
                              name: 'Checkbox',
                              decoration:
                                  const InputDecoration(labelText: 'Hello'),
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
                          ],
                        ),
                        Column(
                          children: [
                            IsmailTextFormField(
                              // initialValue: 'Hello',
                              onChanged: (value) {},
                              decoration: const InputDecoration(
                                labelText: 'TextField',
                              ),
                              validator: (value) {
                                if (value != 'hello')
                                  return 'Please write Hello';
                              },
                              wantClearIcon: true,
                              name: 'textfield',
                            ),
                            IsmailDateTimePickerFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
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
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              name: 'CheckboxSingle',
                              validator: (value) {
                                if (value == null || !value) {
                                  return 'Please select';
                                }
                              },
                            ),
                            IsmailChoiceChipFormField<String>(
                              name: 'Chips',
                              runSpacing: 10,
                              spacing: 10,
                              options: list,
                            ),
                          ],
                        ),
                      ],
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
    return formController.builder(
      (_) => ElevatedButton(
        style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder()),
        onPressed: !formController.isValid ? null : onTap,
        child: const Text('Submit'),
      ),
    );
  }
}
