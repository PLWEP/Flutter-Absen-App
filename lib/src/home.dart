import 'package:absen_app/src/settings/settings_controller.dart';
import 'package:absen_app/src/settings/settings_view.dart';
import 'package:absen_app/src/widget/item_list_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final SettingsController settingsController;
  const HomePage({super.key, required this.settingsController});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 0;

  Widget currentPage() {
    if (page == 0) {
      return ItemListView();
    } else if (page == 1) {
      return const Center(
        child: Text("Profil"),
      );
    } else if (page == 2) {
      return SettingsView(controller: widget.settingsController);
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
                bottom: 15,
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
