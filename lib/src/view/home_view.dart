import 'package:absen_app/src/models/mata_kuliah.dart';
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
              cursorColor: Colors.blue,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                suffixIcon: Icon(Icons.search),
                suffixIconColor: Colors.blue,
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
    );
  }
}
