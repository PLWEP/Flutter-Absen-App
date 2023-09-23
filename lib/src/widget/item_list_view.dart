import 'package:absen_app/src/sample_feature/course_class_item.dart';
import 'package:absen_app/src/widget/item_details_view.dart';
import 'package:absen_app/src/widget/item_list.dart';
import 'package:flutter/material.dart';

class ItemListView extends StatelessWidget {
  ItemListView({
    super.key,
  });

  static const routeName = '/';

  final List<CourseClass> items = courseClasses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      restorationId: 'classListView',
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];

        return ItemList(
          id: item.id,
          name: item.name,
          sks: item.sks,
          totalColleges: item.totalColleges,
          onTap: () {
            Navigator.restorablePushNamed(
              context,
              ItemDetailsView.routeName,
            );
          },
        );
      },
    );
  }
}
