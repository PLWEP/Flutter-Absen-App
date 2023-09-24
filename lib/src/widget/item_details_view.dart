import 'package:absen_app/src/models/course_class_item.dart';
import 'package:flutter/material.dart';

class ItemDetailsView extends StatelessWidget {
  final CourseClass item;
  const ItemDetailsView({
    super.key,
    required this.item,
  });

  static const routeName = '/class_details';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue.shade900,
            title: const Text('Class Details'),
            bottom: const TabBar(tabs: [
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.book),
                    SizedBox(width: 6),
                    Text('Content'),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.people),
                    SizedBox(width: 6),
                    Text('Colleges'),
                  ],
                ),
              ),
            ]),
          ),
          body: const TabBarView(
            children: [
              Center(
                child: Text("Content"),
              ),
              Center(
                child: Text("Colleges"),
              ),
            ],
          )),
    );
  }
}
