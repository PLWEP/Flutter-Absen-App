import 'package:absen_app/activity/data/model/activity.dart';
import 'package:absen_app/activity/presentation/presentation_provider.dart';
import 'package:absen_app/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:routemaster/routemaster.dart';

class ActivityCard extends ConsumerWidget {
  final Activity activity;
  const ActivityCard({super.key, required this.activity});

  void deleteActivity(WidgetRef ref, BuildContext context) =>
      ref.read(activityNotifierProvider.notifier).deleteActivity(activity);

  void navigateToEditActivity(BuildContext context, WidgetRef ref) {
    ref.read(activityNotifierProvider.notifier).getActivityById(activity.id);
    Routemaster.of(context).push('/edit-activity/');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ExpansionTile(
      title: Text(
        DateFormat.yMEd().format(activity.date).toString(),
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    activity.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        splashRadius: 20,
                        onPressed: () => navigateToEditActivity(context, ref),
                        icon: const Icon(
                          Icons.edit,
                        ),
                      ),
                      IconButton(
                        splashRadius: 20,
                        onPressed: () => deleteActivity(ref, context),
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                activity.description,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 15),
              CachedNetworkImage(
                width: 75,
                imageUrl: activity.documentation,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    const Loader(),
                errorWidget: (context, url, error) =>
                    ErrorText(error: error.toString()),
              ),
              const SizedBox(height: 15),
            ],
          ),
        )
      ],
    );
  }
}
