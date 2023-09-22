import 'package:absen_app/src/widget/item_details_view.dart';
import 'package:absen_app/src/widget/list_item.dart';
import 'package:flutter/material.dart';

import '../sample_feature/sample_item.dart';

class ItemListView extends StatefulWidget {
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
  State<ItemListView> createState() => _ItemListViewState();
}

class _ItemListViewState extends State<ItemListView> {
  int page = 0;

  Widget currentPage() {
    if (page == 0) {
      return ListView.builder(
        restorationId: 'classListView',
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = widget.items[index];

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
    } else if (page == 1) {
      return const Center(
        child: Text("Profil"),
      );
    } else if (page == 2) {
      return const Center(
        child: Text("Setting"),
      );
    } else {
      return const Center(
        child: Text("Terjadi Kesalahan"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          currentPage(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(
                bottom: 25,
                left: 25,
                right: 25,
              ),
              width: double.infinity / 2,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    iconSize: 30,
                    splashRadius: 10,
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        page = 0;
                      });
                    },
                    icon: const Icon(Icons.home),
                  ),
                  IconButton(
                    iconSize: 30,
                    splashRadius: 10,
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        page = 1;
                      });
                    },
                    icon: const Icon(Icons.person),
                  ),
                  IconButton(
                    iconSize: 30,
                    splashRadius: 10,
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        page = 2;
                      });
                    },
                    icon: const Icon(Icons.settings),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
