import 'package:absen_app/common/widget/error_text.dart';
import 'package:absen_app/common/widget/loader.dart';
import 'package:absen_app/features/activity/provider/activity_provider.dart';
import 'package:absen_app/features/auth/provider/auth_provider.dart';
import 'package:absen_app/features/home/widget/activity_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class HomeView extends ConsumerWidget {
  const HomeView({
    super.key,
  });

  void navigateToProfile(BuildContext context) =>
      Routemaster.of(context).push('/profile');

  void navigateToAddActivity(BuildContext context) =>
      Routemaster.of(context).push('/add-activity');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    final isLoading = ref.watch(activityControllerProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: Row(
            children: [
              GestureDetector(
                onTap: () => navigateToProfile(context),
                child: Builder(builder: (context) {
                  if (user.profilePic == '') {
                    return const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/profile.jpeg'),
                    );
                  } else {}
                  return CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(user.profilePic),
                  );
                }),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Hi ${user.name}!',
                  style: const TextStyle(
                    overflow: TextOverflow.fade,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              splashRadius: 20,
              onPressed: () {},
              icon: const Icon(Icons.picture_as_pdf),
            ),
          ],
          backgroundColor: const Color(0xFF0D47A1),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(13, 71, 161, 1),
          onPressed: () => navigateToAddActivity(context),
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            isLoading
                ? const Loader()
                : ref.watch(userActivityProvider).when(
                      data: (data) => Expanded(
                        child: ListView.builder(
                          restorationId: 'classListView',
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            final item = data[index];
                            return ActivityCard(item: item);
                          },
                        ),
                      ),
                      error: (error, stackTrace) =>
                          ErrorText(error: error.toString()),
                      loading: () => const Loader(),
                    ),
          ],
        ),
      ),
    );
  }
}
