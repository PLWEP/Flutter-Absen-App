// import 'dart:io';

// import 'package:absen_app/common/constants.dart';
// import 'package:absen_app/common/widget/error_text.dart';
// import 'package:absen_app/common/widget/image_pick.dart';
// import 'package:absen_app/common/widget/loader.dart';
// import 'package:absen_app/features/auth/provider/auth_provider.dart';
// import 'package:absen_app/features/profile/provider/profile_provider.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:routemaster/routemaster.dart';

// class PhotoView extends ConsumerStatefulWidget {
//   const PhotoView({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _PhotoViewState();
// }

// class _PhotoViewState extends ConsumerState<PhotoView> {
//   File? image;

//   void backToProfle(BuildContext context) =>
//       Routemaster.of(context).push('/profile');

//   void editProfile() {
//     final user = ref.read(userProvider)!;
//     ref.read(profileControllerProvider.notifier).editProfile(
//           context: context,
//           name: user.name,
//           file: image,
//         );
//   }

//   void pop() => Routemaster.of(context).pop();

//   Future<void> showPictureDialog() async {
//     final imagePicker = ImagePicker();
//     await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return SimpleDialog(
//           title: const Text('Pilih Metode'),
//           children: [
//             SimpleDialogOption(
//               onPressed: () async {
//                 final file = await getFromCamera(imagePicker);
//                 setState(() {
//                   image = file;
//                 });
//                 editProfile();
//                 pop();
//               },
//               child: const Text('Buka Kamera'),
//             ),
//             SimpleDialogOption(
//               onPressed: () async {
//                 final file = await getFromGallery(imagePicker);
//                 setState(() {
//                   image = file;
//                 });
//                 editProfile();
//                 pop();
//               },
//               child: const Text('Buka Gallery'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final user = ref.watch(userProvider)!;
//     final isLoading = ref.watch(profileControllerProvider);
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.black87,
//         appBar: AppBar(
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () => backToProfle(context),
//           ),
//           actions: [
//             IconButton(
//               onPressed: () => showPictureDialog(),
//               icon: const Icon(Icons.edit),
//             ),
//           ],
//           backgroundColor: Constants.defaultColor,
//           title: const Text("Profile"),
//         ),
//         body: isLoading
//             ? Loader()
//             : Center(
//                 child: Builder(builder: (context) {
//                   if (user.profilePic == '') {
//                     return Image.asset(Constants.defaultAvatar);
//                   }
//                   return CachedNetworkImage(
//                     imageUrl: user.profilePic,
//                     progressIndicatorBuilder:
//                         (context, url, downloadProgress) => const Loader(),
//                     errorWidget: (context, url, error) =>
//                         ErrorText(error: error.toString()),
//                   );
//                 }),
//               ),
//       ),
//     );
//   }
// }
