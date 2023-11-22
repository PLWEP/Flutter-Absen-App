import 'package:absen_app/features/auth/provider/auth_provider.dart';
import 'package:absen_app/model/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:routemaster/routemaster.dart';

class HomeView extends ConsumerWidget {
  const HomeView({
    super.key,
  });

  void navigateToProfile(BuildContext context) =>
      Routemaster.of(context).push('/profile');

  void navigateToAddActivity(BuildContext context) =>
      Routemaster.of(context).push('/add-activity');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 86,
          title: Row(
            children: [
              GestureDetector(
                onTap: () => navigateToProfile(context),
                child: Builder(builder: (context) {
                  if (user.profilePic == '') {
                    return const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/profile.jpeg'),
                    );
                  } else {}
                  return CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(user.profilePic),
                  );
                }),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Hi ${user.name}!',
                  style: const TextStyle(
                    overflow: TextOverflow.fade,
                    fontSize: 20,
                  ),
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
          onPressed: () => navigateToAddActivity(context),
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
