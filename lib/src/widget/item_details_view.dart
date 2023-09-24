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
            title: Text(
              "${item.name} ${item.id}",
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
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
          body: TabBarView(
            children: [
              ListView.builder(
                itemCount: item.contents.length,
                itemBuilder: (BuildContext context, int index) {
                  final content = item.contents[index];

                  return ListTile(
                    title: Text(
                      content.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(content.description),
                  );
                },
              ),
              ListView.builder(
                itemCount: item.colleges.length,
                itemBuilder: (BuildContext context, int index) {
                  final college = item.colleges[index];

                  return ListTile(
                    title: Text(
                      college.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(college.nim),
                    leading: Icon(
                      college.gender == "Male" ? Icons.male : Icons.female,
                    ),
                  );
                },
              ),
            ],
          )),
    );
  }
}
