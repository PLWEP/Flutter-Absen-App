import 'package:absen_app/common/widget/error_text.dart';
import 'package:absen_app/common/widget/loader.dart';
import 'package:absen_app/model/activity_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ActivityCard extends StatelessWidget {
  final Activity item;
  const ActivityCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        DateFormat.yMEd().format(item.date).toString(),
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
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                item.description,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 15),
              CachedNetworkImage(
                width: 75,
                imageUrl: item.documentation,
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
