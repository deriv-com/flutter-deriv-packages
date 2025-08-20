import 'package:deriv_app_performance/src/data/datasources/firebase_performance_datasource.dart';
import 'package:deriv_app_performance/src/data/repositories/firebase_performance_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebasePerformanceDataSource extends Mock
    implements FirebasePerformanceDataSource {}

void main() {
  late FirebasePerformanceRepositoryImpl repository;
  late MockFirebasePerformanceDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockFirebasePerformanceDataSource();
    repository = FirebasePerformanceRepositoryImpl(mockDataSource);
  });

  group('FirebasePerformanceRepositoryImpl', () {
    const String traceName = 'test_trace';
    final Map<String, String> attributes = <String, String>{'key': 'value'};
    final Map<String, int> metrics = <String, int>{'metric': 1};

    test('initialize should call dataSource.initialize with correct parameters',
        () async {
      // Arrange
      when(() => mockDataSource.initialize(
            enabled: any(named: 'enabled'),
            options: any(named: 'options'),
          )).thenAnswer((_) async {});

      // Act
      await repository.initialize(
        options: <String, dynamic>{'sampling_rate': 0.5},
      );

      // Assert
      verify(() => mockDataSource.initialize(
            options: <String, dynamic>{'sampling_rate': 0.5},
          )).called(1);
    });

    test('initialize should handle errors gracefully', () async {
      // Arrange
      when(() => mockDataSource.initialize(
            enabled: any(named: 'enabled'),
            options: any(named: 'options'),
          )).thenThrow(Exception('Test error'));

      // Act & Assert
      // Should not throw an exception
      await repository.initialize();

      verify(() => mockDataSource.initialize()).called(1);
    });

    test('setCollectionEnabled should call dataSource.setCollectionEnabled',
        () async {
      // Arrange
      when(() => mockDataSource.setCollectionEnabled(any()))
          .thenAnswer((_) async {});

      // Act
      await repository.setCollectionEnabled(true);

      // Assert
      verify(() => mockDataSource.setCollectionEnabled(true)).called(1);
    });

    test('setCollectionEnabled should handle errors gracefully', () async {
      // Arrange
      when(() => mockDataSource.setCollectionEnabled(any()))
          .thenThrow(Exception('Test error'));

      // Act & Assert
      // Should not throw an exception
      await repository.setCollectionEnabled(false);

      verify(() => mockDataSource.setCollectionEnabled(false)).called(1);
    });

    test('isCollectionEnabled should call dataSource.isCollectionEnabled',
        () async {
      // Arrange
      when(() => mockDataSource.isCollectionEnabled())
          .thenAnswer((_) async => true);

      // Act
      final bool result = await repository.isCollectionEnabled();

      // Assert
      expect(result, isTrue);
      verify(() => mockDataSource.isCollectionEnabled()).called(1);
    });

    test('isCollectionEnabled should handle errors gracefully', () async {
      // Arrange
      when(() => mockDataSource.isCollectionEnabled())
          .thenThrow(Exception('Test error'));

      // Act
      final bool result = await repository.isCollectionEnabled();

      // Assert
      expect(result, isFalse); // Should default to false on error
      verify(() => mockDataSource.isCollectionEnabled()).called(1);
    });

    test('startTrace should call dataSource.startTrace', () async {
      // Arrange
      when(() => mockDataSource.startTrace(
            any(),
            attributes: any(named: 'attributes'),
          )).thenAnswer((_) async {});

      // Act
      repository.startTrace(
        traceName,
        attributes: attributes,
      );

      // Assert
      verify(() => mockDataSource.startTrace(
            traceName,
            attributes: attributes,
          )).called(1);
    });

    test('stopTrace should call dataSource.stopTrace', () async {
      // Arrange
      when(() => mockDataSource.stopTrace(
            any(),
            attributes: any(named: 'attributes'),
            metrics: any(named: 'metrics'),
          )).thenAnswer((_) async {});

      // Act
      repository.stopTrace(
        traceName,
        attributes: attributes,
        metrics: metrics,
      );

      // Assert
      verify(() => mockDataSource.stopTrace(
            traceName,
            attributes: attributes,
            metrics: metrics,
          )).called(1);
    });

    test(
        'startPageLoadTrace should call dataSource.startTrace with correct '
        'attributes', () async {
      // Arrange
      when(() => mockDataSource.startTrace(
            any(),
            attributes: any(named: 'attributes'),
          )).thenAnswer((_) async {});

      // Act
      repository.startPageLoadTrace(
        'home_page',
        fromPage: 'login_page',
      );

      // Assert
      verify(() => mockDataSource.startTrace(
            'home_page_load',
            attributes: any(named: 'attributes'),
          )).called(1);
    });

    test(
        'stopPageLoadTrace should call dataSource.stopTrace with correct '
        'attributes', () async {
      // Arrange
      when(() => mockDataSource.stopTrace(
            any(),
            attributes: any(named: 'attributes'),
            metrics: any(named: 'metrics'),
          )).thenAnswer((_) async {});

      // Act
      repository.stopPageLoadTrace(
        'home_page',
      );

      // Assert
      verify(() => mockDataSource.stopTrace(
            'home_page_load',
            attributes: <String, String>{'success': 'true'},
            metrics: any(named: 'metrics'),
          )).called(1);
    });
  });
}
