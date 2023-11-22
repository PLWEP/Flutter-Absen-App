import 'package:absen_app/features/auth/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  void navigateToPhoto(BuildContext context) =>
      Routemaster.of(context).push('/photo');

  void logOut(WidgetRef ref, BuildContext context) {
    ref.read(authControllerProvider.notifier).logout();
    Routemaster.of(context).pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(13, 71, 161, 1),
          title: const Text("Profile"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                color: const Color.fromRGBO(13, 71, 161, 1),
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
                                      AssetImage('assets/profile.jpeg'),
                                );
                              } else {}
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
                          onTap: () {},
                        ),
                        ListTile(
                          trailing: const Icon(Icons.navigate_next),
                          title: const Text("Change Password"),
                          leading: const Icon(Icons.lock),
                          iconColor: Colors.black,
                          onTap: () {},
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
