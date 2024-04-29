// ignore_for_file: always_specify_types

import 'package:bloc_test/bloc_test.dart';
import 'package:deriv_auth/features/get_started/models/deriv_get_started_slide_model.dart';
import 'package:deriv_auth/features/get_started/presentation/layouts/deriv_get_started_layout.dart';
import 'package:deriv_language_selector/deriv_language_selector.dart';
import 'package:deriv_localizations/l10n/generated/deriv_auth/deriv_auth_localizations.dart';
import 'package:deriv_localizations/l10n/generated/deriv_auth/deriv_auth_localizations_ar.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:patrol_finders/patrol_finders.dart';

import '../../../../pump_app.dart';

class MockDerivGetStartedSlideModel extends Mock
    implements DerivGetStartedSlideModel {}

class MockLanguageCubit extends MockCubit<LanguageState>
    implements LanguageCubit {}

void main() {
  group('DerivGetStartedLayout', () {
    late MockDerivGetStartedSlideModel mockSlideModel;

    const String appLogoIconPath = 'assets/icons/ic_logo_extended.svg';
    const String backgroundImagePath = 'assets/images/triangles.svg';

    final MockLanguageCubit mockLanguageCubit = MockLanguageCubit();

    setUpAll(() {
      mockSlideModel = MockDerivGetStartedSlideModel();
      when(() => mockSlideModel.imagePath)
          .thenReturn('assets/images/charts.svg');
      when(() => mockSlideModel.supportingText).thenReturn('Supporting text');

      final LanguageModel languageModel = LanguageModel(
        code: 'en',
        flag: 'assets/icons/flags/ic_flag_en.png',
        name: 'English',
      );

      when(() => mockLanguageCubit.state).thenReturn(
        LanguageLoadedState(
          activeLanguages: [
            languageModel,
          ],
          language: languageModel,
        ),
      );
    });

    patrolWidgetTest('should call onLoginTapped when login button is pressed',
        (PatrolTester $) async {
      bool loginTapped = false;

      await $.pumpApp(BlocProvider<LanguageCubit>(
        create: (_) => mockLanguageCubit,
        child: MaterialApp(
          localizationsDelegates: const [DerivAuthLocalizations.delegate],
          locale: const Locale('en'),
          home: Scaffold(
            body: DerivGetStartedLayout(
              onTapNavigation: (context) {},
              slides: [mockSlideModel],
              appLogoIconPath: appLogoIconPath,
              backgroundImagePath: backgroundImagePath,
              onLoginTapped: () {
                loginTapped = true;
              },
              onSignupTapped: () {},
            ),
          ),
        ),
      ));

      await $.tap($(SecondaryButton));

      expect(loginTapped, isTrue);
    });

    patrolWidgetTest('should call onSignupTapped when signup button is pressed',
        (PatrolTester $) async {
      bool signupTapped = false;

      await $.pumpApp(
        BlocProvider<LanguageCubit>(
          create: (_) => mockLanguageCubit,
          child: MaterialApp(
            localizationsDelegates: const [DerivAuthLocalizations.delegate],
            locale: const Locale('en'),
            home: Scaffold(
              body: DerivGetStartedLayout(
                onTapNavigation: (context) {},
                slides: [mockSlideModel],
                appLogoIconPath: appLogoIconPath,
                backgroundImagePath: backgroundImagePath,
                onLoginTapped: () {},
                onSignupTapped: () {
                  signupTapped = true;
                },
              ),
            ),
          ),
        ),
      );

      await $.tap($(PrimaryButton));

      expect(signupTapped, isTrue);
    });
  });
}
