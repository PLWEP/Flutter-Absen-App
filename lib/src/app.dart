import 'package:absen_app/src/view/add_activity_view.dart';
import 'package:absen_app/src/view/home_view.dart';
import 'package:absen_app/src/view/login_view.dart';
import 'package:absen_app/src/view/profile_view.dart';
import 'package:absen_app/src/view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'app',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case AddActivityView.routeName:
                return const AddActivityView();
              case ProfileView.routeName:
                return const ProfileView();
              case LoginView.routeName:
                return LoginView();
              case RegisterView.routeName:
                return const RegisterView();
              case HomeView.routeName:
                return const HomeView();
              default:
                return LoginView();
            }
          },
        );
      },
    );
  }
}
