import 'package:absen_app/src/models/data.dart';
import 'package:absen_app/src/view/add_activity_view.dart';
import 'package:absen_app/src/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              splashRadius: 20,
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
          ],
          backgroundColor: const Color(0xFF0D47A1),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              AddActivityView.routeName,
            );
          },
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                restorationId: 'classListView',
                itemCount: daftarMataKuliah.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = daftarMataKuliah[index];
                  return ExpansionTile(
                    title: Text(
                      DateFormat.yMEd().format(item.tanggal).toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 5,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.judul,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              item.deskripsi,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Image.network(item.dokumentasi),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
