import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
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
                  if (kIsWeb)
                    IsmailFormField<Uint8List>(
                      name: 'file_picker',
                      validator: (value) {
                        if (value == null) {
                          return 'Please choose a file';
                        }
                      },
                      builder: (field) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: field.hasError ? Colors.red : null,
                          ),
                          onPressed: () async {
                            try {
                              final _file =
                                  await IsmailFilePicker.instance.pickFileWeb();
                              field.didChange(_file);
                            } catch (e) {
                              logger.error(e);
                            }
                          },
                          child: const Text('Pick File'),
                        );
                      },
                    )
                  else
                    IsmailFormField<File>(
                      name: 'file_picker',
                      validator: (value) {
                        if (value == null) {
                          return 'Please choose a file';
                        }
                      },
                      builder: (field) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: field.hasError ? Colors.red : null,
                          ),
                          onPressed: () async {
                            try {
                              if (Platform.isWindows) {
                                final _file =
                                    IsmailFilePicker.instance.pickFileWindows(
                                  title: 'Please select an image',
                                );
                                field.didChange(_file);
                              } else {
                                final _file =
                                    await IsmailFilePicker.instance.pickFile();
                                field.didChange(_file);
                              }
                            } catch (e) {
                              logger.error(e);
                            }
                          },
                          child: const Text('Pick File'),
                        );
                      },
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
        onPressed: onTap,
        child: const Text('Submit'),
      ),
    );
  }
}
