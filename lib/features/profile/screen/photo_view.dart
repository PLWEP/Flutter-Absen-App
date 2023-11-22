import 'package:absen_app/common/constants.dart';
import 'package:absen_app/features/auth/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class PhotoView extends ConsumerWidget {
  const PhotoView({super.key});

  void backToProfle(BuildContext context) =>
      Routemaster.of(context).push('/profile');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => backToProfle(context),
          ),
          backgroundColor: Constants.defaultColor,
          title: const Text("Profile"),
        ),
        body: Center(
          child: Builder(builder: (context) {
            if (user.profilePic == '') {
              return Image.asset(Constants.defaultAvatar);
            } else {}
            return Image.network(user.profilePic);
          }),
        ),
      ),
    );
  }
}
