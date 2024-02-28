import 'package:absen_app/activity/presentation/view/add_activity_view.dart';
import 'package:absen_app/activity/presentation/view/edit_activity_view.dart';
import 'package:absen_app/auth/presentation/view/login_view.dart';
import 'package:absen_app/auth/presentation/view/register_view.dart';
import 'package:absen_app/activity/presentation/view/home_view.dart';
import 'package:absen_app/auth/presentation/view/edit_profile_view.dart';
import 'package:absen_app/auth/presentation/view/photo_view.dart';
import 'package:absen_app/auth/presentation/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(
  onUnknownRoute: (route) {
    return const MaterialPage(child: LoginView());
  },
  routes: {
    '/': (_) => const MaterialPage(child: LoginView()),
    '/register': (_) => const MaterialPage(child: RegisterView()),
  },
);

final loggedInRoute = RouteMap(
  onUnknownRoute: (route) {
    return const MaterialPage(child: HomeView());
  },
  routes: {
    '/': (_) => const MaterialPage(child: HomeView()),
    '/profile': (_) => const MaterialPage(child: ProfileView()),
    '/edit-profile': (_) => const MaterialPage(child: EditProfileView()),
    '/photo': (_) => const MaterialPage(child: PhotoView()),
    '/add-activity': (_) => const MaterialPage(child: AddActivityView()),
    '/edit-activity': (_) => const MaterialPage(child: EditActivityView()),
  },
);
