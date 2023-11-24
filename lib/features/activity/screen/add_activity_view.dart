import 'dart:io';

import 'package:absen_app/common/constants.dart';
import 'package:absen_app/common/widget/image_pick.dart';
import 'package:absen_app/common/widget/loader.dart';
import 'package:absen_app/features/activity/provider/activity_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:routemaster/routemaster.dart';

class AddActivityView extends ConsumerStatefulWidget {
  const AddActivityView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddActivityViewState();
}

class _AddActivityViewState extends ConsumerState<AddActivityView> {
  var date = DateTime.now();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  File? image;

  void pop() => Routemaster.of(context).pop();

  Future<void> showPictureDialog() async {
    final imagePicker = ImagePicker();
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Pilih Metode'),
          children: [
            SimpleDialogOption(
              onPressed: () async {
                final file = await getFromCamera(imagePicker);
                setState(() {
                  image = file;
                });
                pop();
              },
              child: const Text('Buka Kamera'),
            ),
            SimpleDialogOption(
              onPressed: () async {
                final file = await getFromGallery(imagePicker);
                setState(() {
                  image = file;
                });
                pop();
              },
              child: const Text('Buka Gallery'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }

  void addActivity() =>
      ref.read(activityControllerProvider.notifier).addActivity(
            context: context,
            title: _titleController.text.trim(),
            description: _descriptionController.text.trim(),
            date: date,
            file: image!,
          );

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(activityControllerProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.defaultColor,
        title: const Text(
          'Add Activity',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          Form(
            key: formKey,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Date',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () => isLoading
                        ? {}
                        : showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2099),
                          ).then(
                            (value) {
                              setState(() {
                                if (value != null) {
                                  date = value;
                                }
                              });
                            },
                          ),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                          ),
                          const Icon(Icons.date_range),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            DateFormat.yMEd().format(date).toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Title',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    enabled: isLoading ? false : true,
                    controller: _titleController,
                    validator: (value) =>
                        value!.isEmpty ? "Please Fill The Field" : null,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.black,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.red,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    cursorColor: Colors.black,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    enabled: isLoading ? false : true,
                    controller: _descriptionController,
                    validator: (value) =>
                        value!.isEmpty ? "Please Fill The Field" : null,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.black,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.red,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    maxLength: 250,
                    maxLines: 5,
                    cursorColor: Colors.black,
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: image != null ? Colors.green : Colors.red,
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () => isLoading ? {} : showPictureDialog(),
                      child: const Center(
                        child: Text(
                          'Documentation',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (image == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please input image'),
                              ),
                            );
                          } else {
                            addActivity();
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(13, 71, 161, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadowColor: Colors.black,
                        padding: const EdgeInsets.all(10),
                      ),
                      child: isLoading
                          ? const Loader()
                          : const Text(
                              'Save',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
