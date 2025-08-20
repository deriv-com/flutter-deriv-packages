import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:deriv_app_performance/src/domain/repositories/performance_repository.dart';
import 'package:deriv_app_performance/src/domain/usecases/track_operation.dart';

class MockPerformanceRepository extends Mock implements PerformanceRepository {}

void main() {
  late TrackOperation trackOperation;
  late MockPerformanceRepository mockRepository;

  setUp(() {
    mockRepository = MockPerformanceRepository();
    trackOperation = TrackOperation(mockRepository);

    // Register fallback values for complex types
    registerFallbackValue(() async => 'result');
  });

  group('TrackOperation', () {
    const String traceName = 'test_trace';
    final Map<String, String> attributes = <String, String>{'key': 'value'};

    test('should track operation with repository', () async {
      // Arrange
      when(() => mockRepository.trackOperation<String>(
            any(),
            any(),
            attributes: any(named: 'attributes'),
          )).thenAnswer((_) async => 'result');

      // Act
      final String result = await trackOperation(
        traceName,
        () async => 'result',
        attributes: attributes,
      );

      // Assert
      expect(result, equals('result'));
      verify(() => mockRepository.trackOperation<String>(
            traceName,
            any(),
            attributes: attributes,
          )).called(1);
    });

    test('should handle operation exceptions and rethrow', () async {
      // Arrange
      when(() => mockRepository.trackOperation<String>(
            any(),
            any(),
            attributes: any(named: 'attributes'),
          )).thenThrow(Exception('Test error'));

      // Act & Assert
      expect(
        () => trackOperation(
          traceName,
          () async => 'result',
          attributes: attributes,
        ),
        throwsException,
      );

      verify(() => mockRepository.trackOperation<String>(
            traceName,
            any(),
            attributes: attributes,
          )).called(1);
    });

    test('should delegate to repository trackOperation', () async {
      // Arrange
      Future<String> testOperation() async {
        await Future<void>.delayed(const Duration(milliseconds: 10));
        return 'delayed result';
      }

      when(() => mockRepository.trackOperation<String>(
            any(),
            any(),
            attributes: any(named: 'attributes'),
          )).thenAnswer((_) async => 'delayed result');

      // Act
      final String result = await trackOperation(
        traceName,
        testOperation,
        attributes: attributes,
      );

      // Assert
      expect(result, equals('delayed result'));
      verify(() => mockRepository.trackOperation<String>(
            traceName,
            any(),
            attributes: attributes,
          )).called(1);
    });
  });
}
