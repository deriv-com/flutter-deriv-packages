import 'package:deriv_app_performance/src/domain/repositories/performance_repository.dart';
import 'package:deriv_app_performance/src/domain/usecases/trace_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPerformanceRepository extends Mock implements PerformanceRepository {}

void main() {
  late TraceManager traceManager;
  late MockPerformanceRepository mockRepository;

  setUp(() {
    mockRepository = MockPerformanceRepository();
    traceManager = TraceManager(mockRepository);
  });

  group('TraceManager', () {
    test('start should call repository startTrace with correct parameters', () {
      // Arrange
      when(() => mockRepository.startTrace(
            any(),
            attributes: any(named: 'attributes'),
          )).thenReturn(null);

      // Act
      traceManager.start(
        'test_trace',
        attributes: <String, String>{'key': 'value'},
      );

      // Assert
      verify(() => mockRepository.startTrace(
            'test_trace',
            attributes: <String, String>{'key': 'value'},
          )).called(1);
    });

    test('stop should call repository stopTrace with correct parameters', () {
      // Arrange
      when(() => mockRepository.stopTrace(
            any(),
            attributes: any(named: 'attributes'),
            metrics: any(named: 'metrics'),
          )).thenReturn(null);

      // Act
      traceManager.stop(
        'test_trace',
        attributes: <String, String>{'key': 'value'},
        metrics: <String, int>{'count': 5},
      );

      // Assert
      verify(() => mockRepository.stopTrace(
            'test_trace',
            attributes: <String, String>{'key': 'value'},
            metrics: <String, int>{'count': 5},
          )).called(1);
    });

    test(
        'startPageLoad should call repository startPageLoadTrace with correct '
        'parameters', () {
      // Arrange
      when(() => mockRepository.startPageLoadTrace(
            any(),
            fromPage: any(named: 'fromPage'),
          )).thenReturn(null);

      // Act
      traceManager.startPageLoad('home_page', fromPage: 'login_page');

      // Assert
      verify(() => mockRepository.startPageLoadTrace(
            'home_page',
            fromPage: 'login_page',
          )).called(1);
    });

    test(
        'stopPageLoad should call repository stopPageLoadTrace with correct '
        'parameters', () {
      // Arrange
      when(() => mockRepository.stopPageLoadTrace(
            any(),
            success: any(named: 'success'),
          )).thenReturn(null);

      // Act
      traceManager.stopPageLoad('home_page', success: false);

      // Assert
      verify(() => mockRepository.stopPageLoadTrace(
            'home_page',
            success: false,
          )).called(1);
    });
  });
}
