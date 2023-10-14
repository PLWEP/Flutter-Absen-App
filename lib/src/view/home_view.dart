import 'package:absen_app/src/view/add_activity_view.dart';
import 'package:absen_app/src/view/profile_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  static const routeName = '/';

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
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return ExpansionTile(
                    title: const Text(
                      "Rabu, 22 - 10 - 2023",
                      style: TextStyle(
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
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Asistensi",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Mengajarkan web dasar dan studi kasus 1",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text("dokumentasi"),
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
