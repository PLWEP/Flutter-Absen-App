import 'dart:io';

import 'package:absen_app/common/constants.dart';
import 'package:absen_app/common/text_form_activity_decoration.dart';
import 'package:absen_app/common/widget/error_text.dart';
import 'package:absen_app/common/widget/image_pick.dart';
import 'package:absen_app/common/widget/loader.dart';
import 'package:absen_app/features/activity/provider/activity_provider.dart';
import 'package:absen_app/data/model/activity_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:routemaster/routemaster.dart';

class EditActivityView extends ConsumerStatefulWidget {
  final String activityId;
  const EditActivityView({
    super.key,
    required this.activityId,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditActivityViewState();
}

class _EditActivityViewState extends ConsumerState<EditActivityView> {
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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }

  void editActivity(Activity activity) =>
      ref.read(activityControllerProvider.notifier).editActivity(
            context: context,
            activity: Activity(
              id: activity.id,
              uid: activity.uid,
              title: _titleController.text.trim(),
              description: _descriptionController.text.trim(),
              date: date,
              documentation: activity.documentation,
            ),
            file: image,
          );

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(activityControllerProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.defaultColor,
        title: const Text(
          'Edit Activity',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ref.watch(getActivityByIdProvider(widget.activityId)).when(
            data: (data) {
              if (_titleController.text.isEmpty &&
                  _descriptionController.text.isEmpty) {
                _titleController.text = data.title;
                _descriptionController.text = data.description;
                date = data.date;
              }
              return ListView(
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
                                  const SizedBox(width: 10),
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
                            decoration: decoration,
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
                          const SizedBox(height: 15),
                          TextFormField(
                            enabled: isLoading ? false : true,
                            controller: _descriptionController,
                            validator: (value) =>
                                value!.isEmpty ? "Please Fill The Field" : null,
                            decoration: decoration,
                            maxLength: 250,
                            maxLines: 5,
                            cursorColor: Colors.black,
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Documentation',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Stack(
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () =>
                                    isLoading ? {} : showPictureDialog(),
                                child: DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(10),
                                  dashPattern: const [10, 4],
                                  strokeCap: StrokeCap.round,
                                  child: Container(
                                    width: double.infinity,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: image != null
                                        ? Image.file(image!)
                                        : Center(
                                            child: CachedNetworkImage(
                                              imageUrl: data.documentation,
                                              progressIndicatorBuilder:
                                                  (context, url,
                                                          downloadProgress) =>
                                                      const Loader(),
                                              errorWidget: (context, url,
                                                      error) =>
                                                  ErrorText(
                                                      error: error.toString()),
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                              if (image != null)
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        image = null;
                                      });
                                    },
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  editActivity(data);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Constants.defaultColor,
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
              );
            },
            error: (error, stackTrace) => ErrorText(error: error.toString()),
            loading: () => const Loader(),
          ),
    );
  }
}
