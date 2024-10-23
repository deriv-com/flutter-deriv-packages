import 'package:deriv_language_selector/deriv_language_selector.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/mock.dart';

void main() {
  late LanguageCubit mockCubit;

  setUp(() {
    mockCubit = MockLanguageCubit();

    when(() => mockCubit.state).thenReturn(
      LanguageLoadedState(
        language: mockLanguageModel,
        activeLanguages: <LanguageModel>[
          mockLanguageModel,
        ],
      ),
    );

    when(() => mockCubit.stream).thenAnswer(
      (_) => Stream<LanguageState>.fromIterable(
        <LanguageState>[
          LanguageLoadedState(
            language: mockLanguageModel,
            activeLanguages: <LanguageModel>[
              mockLanguageModel,
            ],
          ),
        ],
      ),
    );

    when(() => mockCubit.close()).thenAnswer((_) async {});
  });
  group('LanguageSelector.button', () {
    testWidgets('''triggers `showExpandableLanguageBottomSheet` if 
        custom bottom sheet handler not provided''',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<LanguageCubit>(
              create: (_) => mockCubit,
              child: const LanguageSelector.button(
                bottomsheetTitle: 'Select Language',
              ),
            ),
          ),
        ),
      );

      final Finder buttonFinder = find.byType(LanguageSelectorWidget);

      expect(buttonFinder, findsOneWidget);

      await tester.tap(buttonFinder);

      await tester.pumpAndSettle();

      final Finder bottomsheetFinder = find.byType(LanguageItemList);

      expect(bottomsheetFinder, findsOneWidget);
    });

    testWidgets('triggers custom bottom sheet handler if provided',
        (WidgetTester tester) async {
      bool customBottmsheetCalled = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<LanguageCubit>(
              create: (_) => mockCubit,
              child: LanguageSelector.button(
                bottomsheetTitle: 'Select Language',
                showLanguageBottomSheet:
                    (Widget bottomsheet, BuildContext context) {
                  customBottmsheetCalled = true;

                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) => bottomsheet,
                  );
                },
              ),
            ),
          ),
        ),
      );

      final Finder buttonFinder = find.byType(LanguageSelectorWidget);

      expect(buttonFinder, findsOneWidget);

      await tester.tap(buttonFinder);

      await tester.pumpAndSettle();

      expect(customBottmsheetCalled, true);
    });

    testWidgets('Button displays current language',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<LanguageCubit>(
              create: (_) => mockCubit,
              child: const LanguageSelector.button(
                bottomsheetTitle: 'Select Language',
              ),
            ),
          ),
        ),
      );

      final Finder buttonFinder =
          find.text(mockLanguageModel.code.toUpperCase());
      expect(buttonFinder, findsOneWidget);
    });
  });

  group('LanguageSelector.bottomSheet', () {
    testWidgets('displays list of active languages',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<LanguageCubit>(
              create: (_) => mockCubit,
              child: const LanguageSelector.bottomSheet(),
            ),
          ),
        ),
      );

      final Finder itemFinder =
          find.text(mockCubit.state.activeLanguages.first.name);
      final Finder languageListFinder = find.byType(LanguageItemList);

      expect(itemFinder, findsOneWidget);
      expect(languageListFinder, findsOneWidget);
    });
  });
}
