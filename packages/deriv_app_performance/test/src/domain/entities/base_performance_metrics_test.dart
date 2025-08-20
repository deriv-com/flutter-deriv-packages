import 'package:flutter_test/flutter_test.dart';
import 'package:deriv_app_performance/src/domain/entities/base_performance_metrics.dart';

void main() {
  group('BasePerformanceMetrics', () {
    test('should have correct page navigation metrics', () {
      expect(BasePerformanceMetrics.homePageLoad, equals('home_page_load'));
      expect(BasePerformanceMetrics.pageNavigation, equals('page_navigation'));
    });

    test('should have correct network metrics', () {
      expect(BasePerformanceMetrics.connectionRecovery,
          equals('connection_recovery'));
      expect(BasePerformanceMetrics.dataSync, equals('data_sync'));
      expect(BasePerformanceMetrics.apiCall, equals('api_call'));
    });

    test('should have correct app lifecycle metrics', () {
      expect(BasePerformanceMetrics.appStartup, equals('app_startup'));
      expect(BasePerformanceMetrics.appResume, equals('app_resume'));
      expect(BasePerformanceMetrics.appBackground, equals('app_background'));
    });

    test('should have correct user interaction metrics', () {
      expect(
          BasePerformanceMetrics.userInteraction, equals('user_interaction'));
      expect(BasePerformanceMetrics.buttonClick, equals('button_click'));
      expect(BasePerformanceMetrics.formSubmission, equals('form_submission'));
    });

    test('should have correct resource usage metrics', () {
      expect(BasePerformanceMetrics.memoryUsage, equals('memory_usage'));
      expect(BasePerformanceMetrics.batteryImpact, equals('battery_impact'));
    });

    test('should have correct authentication metrics', () {
      expect(BasePerformanceMetrics.loginProcess, equals('login_process'));
      expect(BasePerformanceMetrics.logoutProcess, equals('logout_process'));
      expect(BasePerformanceMetrics.authenticationCheck,
          equals('authentication_check'));
    });
  });
}
