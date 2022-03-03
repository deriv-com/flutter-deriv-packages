// // ignore_for_file: avoid_redundant_argument_values
//
// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
// import 'package:flutter_deriv_api/state/connection/connection_cubit.dart';
//
// import 'package:flutter_deriv_bloc_manager/manager.dart';
//
// import 'package:flutter_multipliers/core/presentation/widgets/countdown_timer.dart';
// import 'package:flutter_multipliers/generated/l10n.dart';
//
// void main() {
//   setUpAll(
//     () {
//       BlocManager.instance.register(
//         ConnectionCubit(
//           ConnectionInformation(appId: '', brand: '', endpoint: ''),
//           isMock: true,
//         ),
//       );
//     },
//   );
//
//   tearDownAll(() => BlocManager.instance.dispose<ConnectionCubit>());
//
//   group('Countdown Timer =>', () {
//     testWidgets(
//       'should call `onCountdownFinished()` callback when counter reaches to zero.',
//       (WidgetTester tester) async {
//         final DateTime startTime = DateTime.now();
//         final DateTime endTime = DateTime.now();
//
//         bool isCountdownFinished = false;
//
//         final CountdownTimer timer = CountdownTimer(
//           startTime: startTime,
//           endTime: endTime,
//           widgetBuilder: (_, String value) => Text(value),
//           onCountdownFinished: () => isCountdownFinished = true,
//         );
//
//         await tester.pumpWidget(_TestApp(timer));
//
//         await tester.idle();
//         await tester.pumpAndSettle();
//
//         await tester.pump(const Duration(seconds: 1));
//
//         expect(isCountdownFinished, isTrue);
//       },
//     );
//
//     testWidgets(
//       'should show just minute part.',
//       (WidgetTester tester) async {
//         final DateTime startTime = DateTime.now();
//         final DateTime endTime = DateTime.now();
//
//         final CountdownTimer timer = CountdownTimer(
//           startTime: startTime,
//           endTime: endTime,
//           widgetBuilder: (_, String value) => Text(value),
//           showHour: false,
//           showSecond: false,
//           showTimePartLabels: false,
//         );
//
//         await tester.pumpWidget(_TestApp(timer));
//
//         await tester.idle();
//         await tester.pumpAndSettle();
//
//         expect(find.text('00'), findsOneWidget);
//       },
//     );
//
//     testWidgets(
//       'should show hour and minute part.',
//       (WidgetTester tester) async {
//         final DateTime startTime = DateTime.now();
//         final DateTime endTime = DateTime.now();
//
//         final CountdownTimer timer = CountdownTimer(
//           startTime: startTime,
//           endTime: endTime,
//           widgetBuilder: (_, String value) => Text(value),
//           showHour: true,
//           showSecond: false,
//           showTimePartLabels: false,
//         );
//
//         await tester.pumpWidget(_TestApp(timer));
//
//         await tester.idle();
//         await tester.pumpAndSettle();
//
//         expect(find.text('00:00'), findsOneWidget);
//       },
//     );
//
//     testWidgets(
//       'should show hour, minute and second part.',
//       (WidgetTester tester) async {
//         final DateTime startTime = DateTime.now();
//         final DateTime endTime = DateTime.now();
//
//         final CountdownTimer timer = CountdownTimer(
//           startTime: startTime,
//           endTime: endTime,
//           widgetBuilder: (_, String value) => Text(value),
//           showHour: true,
//           showSecond: true,
//           showTimePartLabels: false,
//         );
//
//         await tester.pumpWidget(_TestApp(timer));
//
//         await tester.idle();
//         await tester.pumpAndSettle();
//
//         expect(find.text('00:00:00'), findsOneWidget);
//       },
//     );
//
//     testWidgets(
//       'should show hour, minute and second part with labels.',
//       (WidgetTester tester) async {
//         final DateTime startTime = DateTime.now();
//         final DateTime endTime = DateTime.now();
//
//         final CountdownTimer timer = CountdownTimer(
//           startTime: startTime,
//           endTime: endTime,
//           widgetBuilder: (_, String value) => Text(value),
//           showHour: true,
//           showSecond: true,
//           showTimePartLabels: true,
//         );
//
//         await tester.pumpWidget(_TestApp(timer));
//
//         await tester.idle();
//         await tester.pumpAndSettle();
//
//         expect(find.text('00 hr 00 min 00 sec'), findsOneWidget);
//       },
//     );
//   });
// }
//
// class _TestApp extends StatelessWidget {
//   const _TestApp(this.timer);
//
//   final CountdownTimer timer;
//
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
//           S.delegate,
//           GlobalMaterialLocalizations.delegate,
//           GlobalWidgetsLocalizations.delegate,
//           GlobalCupertinoLocalizations.delegate,
//         ],
//         supportedLocales: S.delegate.supportedLocales,
//         home: timer,
//       );
// }
