import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.blue,
            padding: const EdgeInsets.only(
              bottom: 15,
              left: 10,
            ),
            child: const Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 100,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  Text(
                    "Nama Pengguna",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Expanded(
          flex: 2,
          child: Column(
            children: [
              ListTile(
                title: Text("Edit Profile"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
