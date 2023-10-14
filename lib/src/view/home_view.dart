import 'package:absen_app/src/models/mata_kuliah.dart';
import 'package:absen_app/src/view/profile_view.dart';
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
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ProfileView.routeName,
                );
              },
              child: const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/coba.png'),
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Hi Mahasiswa!',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
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

                return ExpansionTile(
                  title: Text(
                    "Pertemuan ${index + 1}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(item.id),
                      subtitle: Text(item.name),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
