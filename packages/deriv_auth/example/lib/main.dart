import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_http_client/deriv_http_client.dart';
import 'package:deriv_passkeys/deriv_passkeys.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_localizations/l10n/generated/deriv_auth/deriv_auth_localizations.dart';
import 'package:device_preview/device_preview.dart';
import 'package:example/features/get_started/pages/get_started_page.dart';
import 'package:example/features/login/repositories/example_login_repository.dart';
import 'package:example/features/signup/repositories/example_referral_repository.dart';
import 'package:example/features/signup/repositories/example_signup_repository.dart';
import 'package:example/features/social_auth/deriv_auth_connection_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/login/services/example_login_service.dart';

void main() {
  /// Added [DevicePreview] while fixing on UI issue
  /// that was only in smaller devices. This later can be removed
  /// when we are fully using widget book.
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DerivAuthCubit>(
          create: (context) => DerivAuthCubit(
            authService: ExampleLoginService(
              authRepository: ExampleLoginRepository(),
              jwtService: DerivJwtService(
                repository: DerivJwtRepository(
                  client: HttpClient(),
                  connectionInfo: DerivAuthConnectionInfo(),
                  getAppToken: ()=>'test_app_token',
                ),
              ),
              connectionInfo: DerivAuthConnectionInfo(),
              tokenService: DerivTokenService(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => DerivSignupCubit(
            service: DerivSignupService(repository: ExampleSignupRepository()),
            referralService: ExampleReferralRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => SocialAuthCubit(
            socialAuthService: DerivSocialAuthService(
              client: HttpClient(),
              connectionInfo: DerivAuthConnectionInfo(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => DerivPasskeysBloc(
            getJwtToken: () async => "jwtToken",
            derivPasskeysService: DerivPasskeysService(
              DerivPasskeysRepository(
                DerivPasskeysDataSource(
                  mapper: DerivPasskeysMapper(),
                  client: HttpClient(),
                ),
              ),
            ),
            connectionInfo: PasskeysConnectionInfoEntity(
              appId: DerivAuthConnectionInfo().appId,
              endpoint: DerivAuthConnectionInfo().endpoint,
            ),
          ),
        ),
      ],
      child: DerivThemeProvider.builder(
        initialTheme: ThemeMode.dark,
        builder: (context) => MaterialApp(
          theme: context.themeData,
          builder: DevicePreview.appBuilder,
          localizationsDelegates: const [DerivAuthLocalizations.delegate],
          home: const GetStartedPage(),
        ),
      ),
    );
  }
}
