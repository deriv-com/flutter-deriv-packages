import 'package:deriv_theme/deriv_theme.dart';

import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'main.directories.g.dart';

@App()
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

@App()
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        DeviceFrameAddon(
          devices: Devices.all,
          initialDevice: Devices.android.bigPhone,
        ),
        ThemeAddon(
          themes: [
            const WidgetbookTheme(
              name: 'Dark',
              data: ThemeMode.dark,
            ),
          ],
          themeBuilder:
              (BuildContext context, ThemeMode themeMode, Widget child) {
            return DerivThemeProvider.builder(
              initialTheme: themeMode,
              builder: (BuildContext context) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  DerivThemeProvider.changeThemeMode(context, themeMode);
                });
                return MaterialApp(
                  theme: context.themeData,
                  home: Scaffold(
                      backgroundColor: context.theme.colors.primary,
                      body: child),
                );
              },
            );
          },
        ),
        AlignmentAddon(),
        LocalizationAddon(
            locales: DateRangeLocalizations.supportedLocales,
            localizationsDelegates: [
              DefaultWidgetsLocalizations.delegate,
              DefaultMaterialLocalizations.delegate,
              DateRangeLocalizations.delegate,
            ]),
        TextScaleAddon(scales: [1.0, 2.0, 3.0]),
        InspectorAddon(),
      ],
    );
  }
}
