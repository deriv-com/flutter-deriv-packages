import 'package:deriv_auth/core/services/jwt/repository/deriv_jwt_repository.dart';
import 'package:deriv_auth/core/services/jwt/services/deriv_jwt_service.dart';
import 'package:deriv_auth/core/services/token/services/deriv_token_service.dart';
import 'package:deriv_auth/features/auth/cubit/deriv_auth_cubit.dart';
import 'package:deriv_auth_ui/generated/l10n.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:example/features/auth/pages/login_page.dart';
import 'package:example/features/auth/repository/example_auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/example_connection_info.dart';
import 'core/http_client.dart';
import 'features/auth/repository/example_auth_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DerivAuthCubit>(
      create: (context) => DerivAuthCubit(
        authService: ExampleAuthService(
          jwtService: DerivJwtService(
            repository: DerivJwtRepository(
              client: HttpClient(),
              appToken: 'appToken',
              connectionInfo: ExampleConnectionInfo(),
            ),
          ),
          tokenService: DerivTokenService(),
          authRepository: ExampleAuthRepository(),
          connectionInfo: ExampleConnectionInfo(),
        ),
      ),
      child: DerivThemeProvider.builder(
        initialTheme: ThemeMode.dark,
        builder: (context) => MaterialApp(
          theme: context.themeData,
          localizationsDelegates: const [DerivAuthUILocalization.delegate],
          home: const LoginPage(),
        ),
      ),
    );
  }
}
