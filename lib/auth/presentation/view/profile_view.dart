import 'package:absen_app/auth/presentation/presentation_provider.dart';
import 'package:absen_app/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  void navigateToPhoto(BuildContext context) =>
      Routemaster.of(context).push('/photo');

  void navigateToEditProfile(BuildContext context) =>
      Routemaster.of(context).push('/edit-profile');

  void logOut(WidgetRef ref, BuildContext context) =>
      ref.read(authNotifierProvider.notifier).logout();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authNotifierProvider).userData!;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.defaultColor,
          title: const Text("Profile"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Constants.defaultColor,
                width: double.infinity,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => navigateToPhoto(context),
                            child: Builder(builder: (context) {
                              if (user.profilePic == '') {
                                return const CircleAvatar(
                                  radius: 60,
                                  backgroundImage:
                                      AssetImage(Constants.defaultAvatar),
                                );
                              }
                              return CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(user.profilePic),
                              );
                            }),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            user.name,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            user.uid,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 6),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        ListTile(
                          trailing: const Icon(Icons.navigate_next),
                          title: const Text("Edit Profile"),
                          leading: const Icon(Icons.person),
                          iconColor: Colors.black,
                          onTap: () => navigateToEditProfile(context),
                        ),
                        ListTile(
                          trailing: const Icon(Icons.navigate_next),
                          title: const Text("Logout"),
                          leading: const Icon(Icons.logout),
                          iconColor: Colors.black,
                          onTap: () => logOut(ref, context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
