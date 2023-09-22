import 'package:absen_app/src/widget/bottom_nav.dart';
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
      return Center(
        child: Text("Profil"),
      );
    } else if (page == 2) {
      return Center(
        child: Text("Setting"),
      );
    } else {
      return Center(
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
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 10,
                    offset: Offset(5, 5),
                  ),
                ],
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue.shade300, Colors.white],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        page = 0;
                      });
                    },
                    icon: Icon(Icons.home, size: 30),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        page = 1;
                      });
                    },
                    icon: Icon(Icons.person, size: 30),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        page = 2;
                      });
                    },
                    icon: Icon(Icons.settings, size: 30),
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
