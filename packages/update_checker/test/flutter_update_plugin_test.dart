import 'package:flutter/material.dart';
import 'package:update_checker/update_bloc.dart';
import 'package:update_checker/update_event.dart';
import 'package:update_checker/update_info.dart';
import 'package:update_checker/update_state.dart';
import 'package:update_checker/src/firebase_utils.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

class MockFirebaseUtils extends Mock implements FirebaseUtils {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Update Bloc Test Cases', () {
    MockFirebaseUtils fbUtils;

    var updateInfo =
        UpdateInfo(buildNumber: 1, changelog: '', url: '', isOptional: false);
    var updateInfo2 =
        UpdateInfo(buildNumber: 2, changelog: '', url: '', isOptional: true);

    setUp(() {
      fbUtils = MockFirebaseUtils();
    });

    test('Initial State', () {
      var updateCheckBloc = UpdateCheckBloc(fbUtils: fbUtils);
      expect(updateCheckBloc.state, UpdateNotAvailable());
    });

    blocTest('Update not available',
        build: () {
          when(fbUtils.getUpdateInfo()).thenAnswer((_) {
            return null;
          });
          return UpdateCheckBloc(fbUtils: fbUtils);
        },
        act: (bloc) => bloc.add(UpdateCheckStart()),
        skip: 0,
        expect: [UpdateNotAvailable()]);

    blocTest('Update available',
        build: () {
          when(fbUtils.getUpdateInfo()).thenAnswer((_) async {
            return updateInfo;
          });
          return UpdateCheckBloc(fbUtils: fbUtils);
        },
        act: (bloc) => bloc.add(UpdateCheckStart()),
        expect: [UpdateAvailable(updateInfo)]);

    blocTest(
      'Update available ',
      build: () {
        when(fbUtils.getUpdateInfo()).thenAnswer((_) async {
          return updateInfo2;
        });
        return UpdateCheckBloc(fbUtils: fbUtils);
      },
      act: (bloc) => bloc.add(UpdateCheckStart()),
      expect: [UpdateAvailable(updateInfo2)],
    );
  });
}
