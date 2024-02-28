import 'dart:io';

import 'package:absen_app/auth/presentation/presentation_provider.dart';
import 'package:absen_app/common/constants.dart';
import 'package:absen_app/common/image_pick.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:routemaster/routemaster.dart';

class PhotoView extends ConsumerStatefulWidget {
  const PhotoView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PhotoViewState();
}

class _PhotoViewState extends ConsumerState<PhotoView> {
  File? image;

  void backToProfle(BuildContext context) =>
      Routemaster.of(context).push('/profile');

  void editProfile() {
    final user = ref.watch(authNotifierProvider).userData!;
    ref
        .read(authNotifierProvider.notifier)
        .editProfile(context, user, image, user.name);
  }

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
                editProfile();
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
                editProfile();
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
  Widget build(BuildContext context) {
    final user = ref.watch(authNotifierProvider).userData!;
    final authState = ref.watch(authNotifierProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => backToProfle(context),
          ),
          actions: [
            IconButton(
              onPressed: () => showPictureDialog(),
              icon: const Icon(Icons.edit),
            ),
          ],
          backgroundColor: Constants.defaultColor,
          title: const Text("Profile"),
        ),
        body: authState.state == EnumState.loading
            ? const Loader()
            : Center(
                child: Builder(builder: (context) {
                  if (user.profilePic == '') {
                    return Image.asset(Constants.defaultAvatar);
                  }
                  return CachedNetworkImage(
                    imageUrl: user.profilePic,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => const Loader(),
                    errorWidget: (context, url, error) =>
                        ErrorText(error: error.toString()),
                  );
                }),
              ),
      ),
    );
  }
}
