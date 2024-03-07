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
  Widget build(BuildContext context) => Widgetbook.material(
        directories: directories,
        addons: <WidgetbookAddon>[
          DeviceFrameAddon(
            devices: Devices.all,
            initialDevice: Devices.android.bigPhone,
          ),
          ThemeAddon<ThemeMode>(
            themes: <WidgetbookTheme<ThemeMode>>[
              const WidgetbookTheme<ThemeMode>(
                name: 'Dark',
                data: ThemeMode.dark,
              ),
            ],
            themeBuilder:
                (BuildContext context, ThemeMode themeMode, Widget child) =>
                    DerivThemeProvider.builder(
              initialTheme: themeMode,
              builder: (BuildContext context) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  DerivThemeProvider.changeThemeMode(context, themeMode);
                });
                return MaterialApp(
                  supportedLocales: DateRangeLocalizations.supportedLocales,
                  localizationsDelegates: const <LocalizationsDelegate<
                      dynamic>>[
                    DefaultWidgetsLocalizations.delegate,
                    DefaultMaterialLocalizations.delegate,
                    DateRangeLocalizations.delegate,
                  ],
                  theme: context.themeData,
                  home: Scaffold(
                      backgroundColor: context.theme.colors.primary,
                      body: SafeArea(
                        child: child,
                      )),
                );
              },
            ),
          ),
          AlignmentAddon(),
          LocalizationAddon(
              locales: DateRangeLocalizations.supportedLocales,
              localizationsDelegates: <LocalizationsDelegate<dynamic>>[
                DefaultWidgetsLocalizations.delegate,
                DefaultMaterialLocalizations.delegate,
                DateRangeLocalizations.delegate,
              ]),
          TextScaleAddon(scales: <double>[1, 2, 3]),
          InspectorAddon(),
        ],
      );
}
