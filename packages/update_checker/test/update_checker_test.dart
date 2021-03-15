import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:update_checker/update_checker.dart';

import 'mock_data.dart' as mock;

class MockFirebaseDatabaseRepository extends Mock
    implements FirebaseDatabaseRepository {}

class MockPackageInfoRepository extends Mock implements PackageInfoRepository {}

void main() {
  group(
    'Update bloc',
    () {
      MockFirebaseDatabaseRepository mockFirebaseDatabaseRepository;
      MockPackageInfoRepository mockPackageInfoRepository;

      setUp(() {
        mockFirebaseDatabaseRepository = MockFirebaseDatabaseRepository();
        mockPackageInfoRepository = MockPackageInfoRepository();
      });

      generateBlocTest(
        String description,
        Map<String, dynamic> rawData,
        int buildNumber,
        Iterable<UpdateState> expect,
      ) {
        return blocTest<UpdateBloc, UpdateState>(
          description,
          build: () {
            when(mockFirebaseDatabaseRepository.fetchUpdateData()).thenAnswer(
              (_) async => rawData,
            );
            when(mockPackageInfoRepository.getAppBuildNumber()).thenAnswer(
              (_) async => buildNumber,
            );
            return UpdateBloc(
              firebaseDatabaseRepository: mockFirebaseDatabaseRepository,
              packageInfoRepository: mockPackageInfoRepository,
            );
          },
          act: (UpdateBloc bloc) => bloc.add(UpdateFetchEvent()),
          expect: expect,
        );
      }

      test(
        'should emit UpdateInitialState as initial state',
        () => expect(UpdateBloc().state, UpdateInitialState()),
      );

      generateBlocTest(
        'should emit UpdateNotAvailableState when '
        'there is an error with fetching the update information',
        null,
        1,
        <UpdateState>[
          UpdateInProgressState(),
          UpdateNotAvailableState(),
        ],
      );

      generateBlocTest(
        'should emit UpdateNotAvailableState when '
        'there is an error with getting the running app build number',
        mock.rawData,
        -1,
        <UpdateState>[
          UpdateInProgressState(),
          UpdateNotAvailableState(),
        ],
      );

      generateBlocTest(
        'should emit UpdateNotAvailableState when '
        'running app build number is equal to update build number',
        mock.rawData,
        mock.optionalBuildNumber,
        <UpdateState>[
          UpdateInProgressState(),
          UpdateNotAvailableState(),
        ],
      );

      generateBlocTest(
        'should emit UpdateNotAvailableState when '
        'running app build number is higher than update build number',
        mock.rawData,
        mock.optionalBuildNumber + 1,
        <UpdateState>[
          UpdateInProgressState(),
          UpdateNotAvailableState(),
        ],
      );

      generateBlocTest(
        'should emit UpdateAvailableState when '
        'running app build number is lower than update build number',
        mock.rawData,
        mock.optionalBuildNumber - 1,
        <UpdateState>[
          UpdateInProgressState(),
          UpdateAvailableState(mock.updateInfoOptional),
        ],
      );

      generateBlocTest(
        'should emit UpdateAvailableState(isOptional: true) when '
        'running app build number is lower than update optional build number'
        'and higher than update mandatory build number',
        mock.rawData,
        mock.optionalBuildNumber - 1,
        <UpdateState>[
          UpdateInProgressState(),
          UpdateAvailableState(mock.updateInfoOptional),
        ],
      );

      generateBlocTest(
        'should emit UpdateAvailableState(isOptional: false) when '
        'running app build number is lower than update mandatory build number',
        mock.rawData,
        mock.mandatoryBuildNumber - 1,
        <UpdateState>[
          UpdateInProgressState(),
          UpdateAvailableState(mock.updateInfoMandatory),
        ],
      );
    },
  );
}
