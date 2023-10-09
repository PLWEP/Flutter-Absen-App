import 'package:absen_app/src/models/mata_kuliah.dart';
import 'package:absen_app/src/models/data.dart';
import 'package:absen_app/src/widget/item_details_view.dart';
import 'package:absen_app/src/widget/item_list.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  HomeView({
    super.key,
  });

  static const routeName = '/';

  final List<MataKuliah> items = daftarMataKuliah;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 86,
        title: Text(
          'Absen App',
          style: TextStyle(
            fontFamily: 'cursive',
            fontSize: 40,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          ),
        ],
        backgroundColor: const Color(0xFF0D47A1),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              restorationId: 'classListView',
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];

                return ItemList(
                  item: item,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ItemDetailsView.routeName,
                      arguments: item,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
