import 'package:deriv_app_performance/src/domain/repositories/performance_repository.dart';
import 'package:deriv_app_performance/src/domain/usecases/performance_setup.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPerformanceRepository extends Mock implements PerformanceRepository {}

void main() {
  late PerformanceSetup performanceSetup;
  late MockPerformanceRepository mockRepository;

  setUp(() {
    mockRepository = MockPerformanceRepository();
    performanceSetup = PerformanceSetup(mockRepository);
  });

  group('PerformanceSetup', () {
    test('initialize should call repository initialize with correct parameters',
        () async {
      // Arrange
      when(() => mockRepository.initialize(
            enabled: any(named: 'enabled'),
            options: any(named: 'options'),
          )).thenAnswer((_) async {});

      // Act
      final bool result = await performanceSetup.initialize(
        options: <String, dynamic>{'sampling_rate': 0.5},
      );

      // Assert
      verify(() => mockRepository.initialize(
            options: <String, dynamic>{'sampling_rate': 0.5},
          )).called(1);
      expect(result, true);
    });

    test('initialize should return false when repository throws an exception',
        () async {
      // Arrange
      when(() => mockRepository.initialize(
            enabled: any(named: 'enabled'),
            options: any(named: 'options'),
          )).thenThrow(Exception('Test error'));

      // Act
      final bool result = await performanceSetup.initialize();

      // Assert
      expect(result, false);
    });

    test('setCollectionEnabled should call repository setCollectionEnabled',
        () async {
      // Arrange
      when(() => mockRepository.setCollectionEnabled(any()))
          .thenAnswer((_) async {});

      // Act
      final bool result = await performanceSetup.setCollectionEnabled(true);

      // Assert
      verify(() => mockRepository.setCollectionEnabled(true)).called(1);
      expect(result, true);
    });

    test(
        'setCollectionEnabled should return false when repository throws an '
        'exception', () async {
      // Arrange
      when(() => mockRepository.setCollectionEnabled(any()))
          .thenThrow(Exception('Test error'));

      // Act
      final bool result = await performanceSetup.setCollectionEnabled(true);

      // Assert
      expect(result, false);
    });

    test('isCollectionEnabled should call repository isCollectionEnabled',
        () async {
      // Arrange
      when(() => mockRepository.isCollectionEnabled())
          .thenAnswer((_) async => true);

      // Act
      final bool result = await performanceSetup.isCollectionEnabled();

      // Assert
      verify(() => mockRepository.isCollectionEnabled()).called(1);
      expect(result, true);
    });

    test(
        'isCollectionEnabled should return false when repository throws an '
        'exception', () async {
      // Arrange
      when(() => mockRepository.isCollectionEnabled())
          .thenThrow(Exception('Test error'));

      // Act
      final bool result = await performanceSetup.isCollectionEnabled();

      // Assert
      expect(result, false);
    });
  });
}
