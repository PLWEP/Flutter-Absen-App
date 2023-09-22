import 'package:absen_app/src/widget/item_details_view.dart';
import 'package:absen_app/src/widget/list_item.dart';
import 'package:flutter/material.dart';

import '../sample_feature/sample_item.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({
    super.key,
    this.items = const [
      SampleItem(1),
      SampleItem(2),
      SampleItem(3),
      SampleItem(4),
      SampleItem(5),
    ],
  });

  static const routeName = '/';

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      restorationId: 'classListView',
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];

        return ItemList(
          title: 'Class ${item.id}',
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
