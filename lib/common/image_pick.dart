import 'dart:io';
import 'package:image_picker/image_picker.dart';

// get from gallery
getFromGallery(ImagePicker imagePicker) async {
  final pickedFile = await imagePicker.pickImage(
    source: ImageSource.gallery,
    maxWidth: 1800,
    maxHeight: 1800,
  );
  if (pickedFile != null) {
    return File(pickedFile.path);
  }
}

// get from camera
getFromCamera(ImagePicker imagePicker) async {
  final pickedFile = await imagePicker.pickImage(
    source: ImageSource.camera,
    maxWidth: 1800,
    maxHeight: 1800,
  );
  if (pickedFile != null) {
    return File(pickedFile.path);
  }
}
