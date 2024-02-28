import 'package:flutter/material.dart';

class Constants {
  static const usersCollection = 'users';
  static const activitiesCollection = 'activity';

  static const defaultAvatar = 'assets/profile.jpeg';
  static const Color defaultColor = Color.fromRGBO(13, 71, 161, 1);
}

enum EnumState {
  initial,
  loading,
  loaded,
  failure,
}

class ErrorText extends StatelessWidget {
  final String error;
  const ErrorText({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error),
            Text(error),
          ],
        ),
      ),
    );
  }
}

class EmptyText extends StatelessWidget {
  const EmptyText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.book),
            Text("Data Empty"),
          ],
        ),
      ),
    );
  }
}

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
