import 'package:flutter/material.dart';

class CustomLayout extends StatelessWidget {
  final Widget body;
  const CustomLayout({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 150,
              foregroundDecoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/atas.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              height: 250,
              foregroundDecoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bawah2.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ],
        ),
        body,
      ],
    );
  }
}
