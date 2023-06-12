import 'package:deriv_auth/features/auth/cubit/deriv_auth_cubit.dart';
import 'package:deriv_auth/features/reset_password/cubit/reset_password_cubit.dart';
import 'package:deriv_auth_ui/generated/l10n.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:example/features/get_started/pages/get_started_page.dart';
import 'package:example/features/login/repositories/example_login_repository.dart';
import 'package:example/features/reset_pass/services/example_reset_pass_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/login/services/example_login_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DerivAuthCubit>(
          create: (context) => DerivAuthCubit(
            authService: ExampleLoginService(
              authRepository: ExampleLoginRepository(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => DerivResetPassCubit(
            service: ExampleResetPassService(),
          ),
        ),
      ],
      child: DerivThemeProvider.builder(
        initialTheme: ThemeMode.dark,
        builder: (context) => MaterialApp(
          theme: context.themeData,
          localizationsDelegates: const [DerivAuthUILocalization.delegate],
          home: const GetStartedPage(),
        ),
      ),
    );
  }
}
