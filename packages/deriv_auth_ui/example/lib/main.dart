import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth_ui/generated/l10n.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:example/features/get_started/pages/get_started_page.dart';
import 'package:example/features/login/repositories/example_login_repository.dart';
import 'package:example/features/signup/repositories/example_referral_repository.dart';
import 'package:example/features/signup/repositories/example_signup_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/login/services/example_login_service.dart';

void main() {
  runApp(const MyApp());
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
            ),
          ),
        ),
        BlocProvider(
          create: (context) => DerivSignupCubit(
            service: DerivSignupService(repository: ExampleSignupRepository()),
            referralService: ExampleReferralRepository(),
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
