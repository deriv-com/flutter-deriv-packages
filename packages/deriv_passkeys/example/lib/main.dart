import 'package:deriv_http_client/deriv_http_client.dart';
import 'package:deriv_localizations/l10n/generated/deriv_passkeys/deriv_passkeys_localizations.dart';
import 'package:deriv_passkeys/deriv_passkeys.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DerivPasskeysBloc(
        derivPasskeysService: DerivPasskeysService(
          DerivPasskeysRepository(
            DerivPasskeysDataSource(
                mapper: DerivPasskeysMapper(), client: HttpClient()),
          ),
        ),
        connectionInfo: PasskeysConnectionInfoEntity(
          appId: '',
          endpoint: '',
        ),
        getJwtToken: () {
          return Future.value('');
        },
      ),
      child: MaterialApp(
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          DerivPasskeysLocalizations.delegate,
        ],
        theme: ThemeData(
          primaryColor: context.theme.colors.secondary,
          fontFamily: context.theme.fontFamily,
          brightness: Brightness.dark,
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.black.withOpacity(0),
            modalBarrierColor: Colors.black.withOpacity(0.72),
          ),
          unselectedWidgetColor: context.theme.colors.lessProminent,
          toggleButtonsTheme: ToggleButtonsThemeData(
            textStyle: context.theme.textStyle(
              textStyle: TextStyles.body2,
            ),
          ),
          colorScheme: const ColorScheme.dark().copyWith(
            primary: context.theme.colors.prominent,
            secondary: context.theme.colors.coral,
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: context.theme.colors.lessProminent,
            selectionHandleColor: context.theme.colors.lessProminent,
            selectionColor: context.theme.colors.lessProminent,
          ),
          appBarTheme: AppBarTheme.of(context).copyWith(
            backgroundColor: context.theme.colors.secondary,
            centerTitle: false,
          ),
        ),
        home: const MyPage(),
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colors.primary,
      appBar: AppBar(
        title: const Text('Deriv Passkeys example app'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ContinueWithPasskeyButton(
            onTap: () {},
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: TextButton(
                onPressed: () {
                  context
                      .read<DerivPasskeysBloc>()
                      .add(DerivPasskeysCreateCredentialEvent());
                },
                child: const Text('Create Passkey'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
