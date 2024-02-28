import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) =>
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(text),
        ),
      );

SnackBar showSnackBarWithoutContext(String text) => SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
    );
