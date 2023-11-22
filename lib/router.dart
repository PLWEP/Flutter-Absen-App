import 'package:absen_app/features/auth/screen/login_view.dart';
import 'package:absen_app/features/auth/screen/register_view.dart';
import 'package:absen_app/src/view/home_view.dart';
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
  },
);
