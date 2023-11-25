import 'package:absen_app/features/activity/screen/add_activity_view.dart';
import 'package:absen_app/features/activity/screen/edit_activity_view.dart';
import 'package:absen_app/features/auth/screen/login_view.dart';
import 'package:absen_app/features/auth/screen/register_view.dart';
import 'package:absen_app/features/home/screen/home_view.dart';
import 'package:absen_app/features/profile/screen/edit_profile_view.dart';
import 'package:absen_app/features/profile/screen/photo_view.dart';
import 'package:absen_app/features/profile/screen/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(child: LoginView()),
    '/register': (_) => const MaterialPage(child: RegisterView()),
  },
);

final loggedInRoute = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(child: HomeView()),
    '/profile': (_) => const MaterialPage(child: ProfileView()),
    '/edit-profile': (_) => const MaterialPage(child: EditProfileView()),
    '/photo': (_) => const MaterialPage(child: PhotoView()),
    '/add-activity': (_) => const MaterialPage(child: AddActivityView()),
    '/edit-activity/:activityId': (route) => MaterialPage(
          child: EditActivityView(
            activityId: route.pathParameters['activityId']!,
          ),
        ),
  },
);
