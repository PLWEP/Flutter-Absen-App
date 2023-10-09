import 'package:absen_app/src/models/mata_kuliah.dart';
import 'package:absen_app/src/view/base_view.dart';
import 'package:absen_app/src/view/detail_pertemuan_view.dart';
import 'package:absen_app/src/widget/item_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'settings/settings_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
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
          themeMode: settingsController.themeMode,
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case ItemDetailsView.routeName:
                    return ItemDetailsView(
                      item: ModalRoute.of(context)?.settings.arguments
                          as MataKuliah,
                    );
                  case DetailPertemuanView.routeName:
                    return DetailPertemuanView();
                  default:
                    return BaseView(
                      settingsController: settingsController,
                    );
                }
              },
            );
          },
        );
      },
    );
  }
}
