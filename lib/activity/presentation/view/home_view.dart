import 'package:absen_app/activity/data/model/activity.dart';
import 'package:absen_app/activity/presentation/presentation_provider.dart';
import 'package:absen_app/activity/presentation/widget/activity_card.dart';
import 'package:absen_app/auth/presentation/presentation_provider.dart';
import 'package:absen_app/common/constants.dart';
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

  void exportToPdf(WidgetRef ref, List<Activity> activityList) =>
      ref.read(pdfNotifierProvider.notifier).exportPDF(activityList);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authNotifierProvider).userData!;
    final activityState = ref.watch(activityNotifierProvider);
    final isPDFLoading = ref.watch(pdfNotifierProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: Row(
            children: [
              GestureDetector(
                onTap: () => navigateToProfile(context),
                child: Builder(
                  builder: (context) {
                    if (user.profilePic == '') {
                      return const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/profile.jpeg'),
                      );
                    }
                    return CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(user.profilePic),
                    );
                  },
                ),
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
            activityState.state == EnumState.loading
                ? const Loader()
                : isPDFLoading
                    ? const Loader()
                    : IconButton(
                        splashRadius: 20,
                        onPressed: () => exportToPdf(
                          ref,
                          activityState.activityList,
                        ),
                        icon: const Icon(Icons.picture_as_pdf),
                      ),
          ],
          backgroundColor: const Color(0xFF0D47A1),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(13, 71, 161, 1),
          onPressed: () => navigateToAddActivity(context),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: Column(
          children: [
            activityState.state == EnumState.loading
                ? const Loader()
                : activityState.state == EnumState.failure
                    ? ErrorText(error: activityState.message)
                    : activityState.activityList.isEmpty
                        ? const EmptyText()
                        : Expanded(
                            child: ListView.builder(
                              itemCount: activityState.activityList.length,
                              itemBuilder: (BuildContext context, int index) {
                                final item = activityState.activityList[index];
                                return ActivityCard(activity: item);
                              },
                            ),
                          ),
          ],
        ),
      ),
    );
  }
}
