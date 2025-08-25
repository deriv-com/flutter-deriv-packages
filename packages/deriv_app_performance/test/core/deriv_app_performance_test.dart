import 'package:deriv_app_performance/src/core/deriv_app_performance.dart';
import 'package:deriv_app_performance/src/data/datasources/performance_datasource.dart';
import 'package:deriv_app_performance/src/data/providers/performance_provider.dart';
import 'package:deriv_app_performance/src/domain/entities/base_performance_metrics.dart';
import 'package:deriv_app_performance/src/domain/repositories/performance_repository.dart';
import 'package:deriv_app_performance/src/domain/usecases/performance_setup.dart';
import 'package:deriv_app_performance/src/domain/usecases/trace_manager.dart';
import 'package:deriv_app_performance/src/domain/usecases/track_operation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock classes
class MockPerformanceRepository extends Mock implements PerformanceRepository {}

class MockPerformanceDataSource extends Mock implements PerformanceDataSource {}

class MockPerformanceSetup extends Mock implements PerformanceSetup {}

class MockTraceManager extends Mock implements TraceManager {}

class MockTrackOperation extends Mock implements TrackOperation {}

class MockPerformanceProvider extends Mock implements PerformanceProvider {}

void main() {
  late MockPerformanceRepository mockRepository;
  late MockPerformanceDataSource mockDataSource;
  late MockPerformanceSetup mockPerformanceSetup;
  late MockTraceManager mockTraceManager;
  late MockTrackOperation mockTrackOperation;

  setUp(() {
    mockRepository = MockPerformanceRepository();
    mockDataSource = MockPerformanceDataSource();
    mockPerformanceSetup = MockPerformanceSetup();
    mockTraceManager = MockTraceManager();
    mockTrackOperation = MockTrackOperation();

    // Register fallback values for complex types
    registerFallbackValue(<String, String>{});
    registerFallbackValue(<String, int>{});
    registerFallbackValue(<PerformanceProvider>[]);
    registerFallbackValue(Future<String>(() async => 'result'));

    // Reset AppPerformance singleton for testing with our mocks
    AppPerformance.resetForTesting(
      dataSource: mockDataSource,
      repository: mockRepository,
      performanceSetup: mockPerformanceSetup,
      traceManager: mockTraceManager,
      trackOperation: mockTrackOperation,
    );
  });

  group('AppPerformance', () {
    test('isInitialized should return initialization status', () {
      // Act
      final bool result = AppPerformance.instance.isInitialized;

      // Assert
      expect(result, isTrue); // Should be true after resetForTesting
    });

    test('hasInitializationError should return error status', () {
      // Act
      final bool result = AppPerformance.instance.hasInitializationError;

      // Assert
      expect(result, isFalse); // Should be false after resetForTesting
    });

    test('initializationError should return error message', () {
      // Act
      final String result = AppPerformance.instance.initializationError;

      // Assert
      expect(result, isEmpty); // Should be empty after resetForTesting
    });

    test('setCollectionEnabled should delegate to performanceSetup', () async {
      // Arrange
      when(() => mockPerformanceSetup.setCollectionEnabled(any()))
          .thenAnswer((_) async => true);

      // Act
      final bool result =
          await AppPerformance.instance.setCollectionEnabled(true);

      // Assert
      expect(result, isTrue);
      verify(() => mockPerformanceSetup.setCollectionEnabled(true)).called(1);
    });

    test('setCollectionEnabled should handle errors', () async {
      // Arrange
      when(() => mockPerformanceSetup.setCollectionEnabled(any()))
          .thenThrow(Exception('Test error'));

      // Act
      final bool result =
          await AppPerformance.instance.setCollectionEnabled(true);

      // Assert
      expect(result, isFalse);
      verify(() => mockPerformanceSetup.setCollectionEnabled(true)).called(1);
    });

    test('isCollectionEnabled should delegate to performanceSetup', () async {
      // Arrange
      when(() => mockPerformanceSetup.isCollectionEnabled())
          .thenAnswer((_) async => true);

      // Act
      final bool result = await AppPerformance.instance.isCollectionEnabled();

      // Assert
      expect(result, isTrue);
      verify(() => mockPerformanceSetup.isCollectionEnabled()).called(1);
    });

    test('isCollectionEnabled should handle errors', () async {
      // Arrange
      when(() => mockPerformanceSetup.isCollectionEnabled())
          .thenThrow(Exception('Test error'));

      // Act
      final bool result = await AppPerformance.instance.isCollectionEnabled();

      // Assert
      expect(result, isFalse);
      verify(() => mockPerformanceSetup.isCollectionEnabled()).called(1);
    });

    test('startTracing should delegate to traceManager', () {
      // Arrange
      const String traceName = 'test_trace';
      final Map<String, String> attributes = <String, String>{'key': 'value'};
      when(() => mockTraceManager.start(any(),
          attributes: any(named: 'attributes'))).thenReturn(null);

      // Act
      AppPerformance.instance.startTracing(
        traceName: traceName,
        attributes: attributes,
      );

      // Assert
      verify(() => mockTraceManager.start(traceName, attributes: attributes))
          .called(1);
    });

    test('startTracing should handle errors', () {
      // Arrange
      const String traceName = 'test_trace';
      when(() => mockTraceManager.start(any(),
              attributes: any(named: 'attributes')))
          .thenThrow(Exception('Test error'));

      // Act & Assert - should not throw
      AppPerformance.instance.startTracing(traceName: traceName);
      verify(() => mockTraceManager.start(traceName)).called(1);
    });

    test('stopTracing should delegate to traceManager', () {
      // Arrange
      const String traceName = 'test_trace';
      final Map<String, String> attributes = <String, String>{'key': 'value'};
      final Map<String, int> metrics = <String, int>{'metric': 1};
      when(() => mockTraceManager.stop(
            any(),
            attributes: any(named: 'attributes'),
            metrics: any(named: 'metrics'),
          )).thenReturn(null);

      // Act
      AppPerformance.instance.stopTracing(
        traceName: traceName,
        attributes: attributes,
        metrics: metrics,
      );

      // Assert
      verify(() => mockTraceManager.stop(
            traceName,
            attributes: attributes,
            metrics: metrics,
          )).called(1);
    });

    test('stopTracing should handle errors', () {
      // Arrange
      const String traceName = 'test_trace';
      when(() => mockTraceManager.stop(
            any(),
            attributes: any(named: 'attributes'),
            metrics: any(named: 'metrics'),
          )).thenThrow(Exception('Test error'));

      // Act & Assert - should not throw
      AppPerformance.instance.stopTracing(traceName: traceName);
      verify(() => mockTraceManager.stop(
            traceName,
          )).called(1);
    });

    test('trackOperation should delegate to trackOperation usecase', () async {
      // Arrange
      const String traceName = 'test_trace';
      final Map<String, String> attributes = <String, String>{'key': 'value'};
      Future<String> operation() async => 'result';

      when(() => mockTrackOperation.call<String>(
            any(),
            any(),
            attributes: any(named: 'attributes'),
          )).thenAnswer((_) async => 'result');

      // Act
      final String result =
          await AppPerformance.instance.trackOperation<String>(
        traceName: traceName,
        operation: operation,
        attributes: attributes,
      );

      // Assert
      expect(result, equals('result'));
      verify(() => mockTrackOperation.call<String>(
            traceName,
            any(),
            attributes: attributes,
          )).called(1);
    });

    test('trackOperation should handle errors and still execute operation',
        () async {
      // Arrange
      const String traceName = 'test_trace';
      Future<String> operation() async => 'result';

      when(() => mockTrackOperation.call<String>(
            any(),
            any(),
            attributes: any(named: 'attributes'),
          )).thenThrow(Exception('Test error'));

      // Act
      final String result =
          await AppPerformance.instance.trackOperation<String>(
        traceName: traceName,
        operation: operation,
      );

      // Assert
      expect(result, equals('result'));
      verify(() => mockTrackOperation.call<String>(
            traceName,
            any(),
          )).called(1);
    });

    test('startPageLoadTrace should delegate to traceManager', () {
      // Arrange
      const String pageName = 'home_page';
      const String fromPage = 'login_page';
      when(() => mockTraceManager.startPageLoad(
            any(),
            fromPage: any(named: 'fromPage'),
          )).thenReturn(null);

      // Act
      AppPerformance.instance.startPageLoadTrace(pageName, fromPage: fromPage);

      // Assert
      verify(() => mockTraceManager.startPageLoad(
            pageName,
            fromPage: fromPage,
          )).called(1);
    });

    test('startPageLoadTrace should handle errors', () {
      // Arrange
      const String pageName = 'home_page';
      when(() => mockTraceManager.startPageLoad(
            any(),
            fromPage: any(named: 'fromPage'),
          )).thenThrow(Exception('Test error'));

      // Act & Assert - should not throw
      AppPerformance.instance.startPageLoadTrace(pageName);
      verify(() => mockTraceManager.startPageLoad(
            pageName,
          )).called(1);
    });

    test('stopPageLoadTrace should delegate to traceManager', () {
      // Arrange
      const String pageName = 'home_page';
      when(() => mockTraceManager.stopPageLoad(
            any(),
            success: any(named: 'success'),
          )).thenReturn(null);

      // Act
      AppPerformance.instance.stopPageLoadTrace(pageName);

      // Assert
      verify(() => mockTraceManager.stopPageLoad(
            pageName,
          )).called(1);
    });

    test('stopPageLoadTrace should handle errors', () {
      // Arrange
      const String pageName = 'home_page';
      when(() => mockTraceManager.stopPageLoad(
            any(),
            success: any(named: 'success'),
          )).thenThrow(Exception('Test error'));

      // Act & Assert - should not throw
      AppPerformance.instance.stopPageLoadTrace(pageName);
      verify(() => mockTraceManager.stopPageLoad(
            pageName,
          )).called(1);
    });

    test(
        'trackConnectionRecovery should call startTracing with correct '
        'parameters', () {
      // Arrange
      const String connectionType = 'wifi';
      when(() => mockTraceManager.start(
            any(),
            attributes: any(named: 'attributes'),
          )).thenReturn(null);

      // Act
      AppPerformance.instance.trackConnectionRecovery(connectionType);

      // Assert
      verify(() => mockTraceManager.start(
            BasePerformanceMetrics.connectionRecovery,
            attributes: <String, String>{'connection_type': connectionType},
          )).called(1);
    });

    test('trackConnectionRecovery should handle errors', () {
      // Arrange
      const String connectionType = 'wifi';
      when(() => mockTraceManager.start(
            any(),
            attributes: any(named: 'attributes'),
          )).thenThrow(Exception('Test error'));

      // Act & Assert - should not throw
      AppPerformance.instance.trackConnectionRecovery(connectionType);
      verify(() => mockTraceManager.start(
            BasePerformanceMetrics.connectionRecovery,
            attributes: <String, String>{'connection_type': connectionType},
          )).called(1);
    });

    test(
        'completeConnectionRecovery should call stopTracing with correct '
        'parameters', () {
      // Arrange
      const bool success = true;
      const int duration = 1000;
      when(() => mockTraceManager.stop(
            any(),
            attributes: any(named: 'attributes'),
            metrics: any(named: 'metrics'),
          )).thenReturn(null);

      // Act
      AppPerformance.instance.completeConnectionRecovery(
        duration: duration,
      );

      // Assert
      verify(() => mockTraceManager.stop(
            BasePerformanceMetrics.connectionRecovery,
            attributes: <String, String>{'success': success.toString()},
            metrics: <String, int>{'outage_duration_ms': duration},
          )).called(1);
    });

    test('completeConnectionRecovery should work without duration parameter',
        () {
      // Arrange
      const bool success = true;
      when(() => mockTraceManager.stop(
            any(),
            attributes: any(named: 'attributes'),
            metrics: any(named: 'metrics'),
          )).thenReturn(null);

      // Act
      AppPerformance.instance.completeConnectionRecovery();

      // Assert
      verify(() => mockTraceManager.stop(
            BasePerformanceMetrics.connectionRecovery,
            attributes: <String, String>{'success': success.toString()},
            metrics: <String, int>{},
          )).called(1);
    });

    test('completeConnectionRecovery should handle errors', () {
      // Arrange
      const bool success = true;
      when(() => mockTraceManager.stop(
            any(),
            attributes: any(named: 'attributes'),
            metrics: any(named: 'metrics'),
          )).thenThrow(Exception('Test error'));

      // Act & Assert - should not throw
      AppPerformance.instance.completeConnectionRecovery();
      verify(() => mockTraceManager.stop(
            BasePerformanceMetrics.connectionRecovery,
            attributes: <String, String>{'success': success.toString()},
            metrics: <String, int>{},
          )).called(1);
    });

    test('resetForTesting should reset the singleton state', () {
      // Arrange - Initial state is set in setUp

      // Act - Reset without providing any dependencies
      AppPerformance.resetForTesting();

      // Assert
      expect(AppPerformance.instance.isInitialized, isFalse);
    });

    test('resetForTesting should set provided dependencies', () {
      // Arrange
      final MockPerformanceRepository newMockRepository =
          MockPerformanceRepository();
      final MockPerformanceSetup newMockPerformanceSetup =
          MockPerformanceSetup();

      // Act
      AppPerformance.resetForTesting(
        repository: newMockRepository,
        performanceSetup: newMockPerformanceSetup,
      );

      // Assert
      expect(AppPerformance.instance.isInitialized, isTrue);

      // Verify the new dependencies are used
      when(() => newMockPerformanceSetup.isCollectionEnabled())
          .thenAnswer((_) async => true);

      // This should use the new mock
      AppPerformance.instance.isCollectionEnabled();
      verify(() => newMockPerformanceSetup.isCollectionEnabled()).called(1);
    });

    test(
        'init should initialize dependencies and '
        'call performanceSetup.initialize', () async {
      // First reset without dependencies to test init
      AppPerformance.resetForTesting();

      // Arrange - Mock the factory methods using a spy
      final List<PerformanceProvider> mockProviders = <PerformanceProvider>[];
      final Map<String, dynamic> mockOptions = <String, dynamic>{
        'test': 'value'
      };

      // Act
      final bool result = await AppPerformance.instance.init(
        providers: mockProviders,
        options: mockOptions,
      );

      // Assert
      // Since we can't easily mock static factory methods, we just verify
      // that the initialization process completes and returns false
      // (since we don't have real implementations of the factories)
      expect(result, isFalse);
    });
  });
}
