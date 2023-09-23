import 'package:absen_app/src/models/course_class_item.dart';
import 'package:absen_app/src/widget/item_details_view.dart';
import 'package:absen_app/src/widget/item_list.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  HomeView({
    super.key,
  });

  static const routeName = '/';

  final List<CourseClass> items = courseClasses;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          height: 60,
          child: Form(
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              style: const TextStyle(fontSize: 20),
              cursorWidth: 1.5,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
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
          ),
        ),
      ],
    );
  }
}
