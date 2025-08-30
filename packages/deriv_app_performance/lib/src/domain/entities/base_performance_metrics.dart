/// Base Performance Metrics for all applications
///
/// This class provides constants for tracking common performance metrics.
/// Each constant represents a trace name that can be used with the performance
/// tracking API.
class BasePerformanceMetrics {
  // Private constructor to prevent instantiation
  const BasePerformanceMetrics._();

  /// Home Page load metrics
  static const String homePageLoad = 'home_page_load';

  /// Page Navigation Metrics
  static const String pageNavigation = 'page_navigation';

  /// Network Metrics
  /// Connection Metrics
  static const String connectionRecovery = 'connection_recovery';

  /// Data Syncing Metrics
  static const String dataSync = 'data_sync';

  /// API Call Metrics
  static const String apiCall = 'api_call';

  /// App Lifecycle Metrics
  ///
  ///
  /// App startup metrics
  static const String appStartup = 'app_startup';

  /// App resume metrics
  static const String appResume = 'app_resume';

  /// App background metrics
  static const String appBackground = 'app_background';

  /// User Interaction Metrics
  ///
  /// User interaction
  static const String userInteraction = 'user_interaction';

  /// Button Click Metrics
  static const String buttonClick = 'button_click';

  /// Form Submission Metrics
  static const String formSubmission = 'form_submission';

  /// Resource Usage Metrics
  static const String memoryUsage = 'memory_usage';

  /// CPU Usage Metrics
  static const String batteryImpact = 'battery_impact';

  /// Authentication Metrics
  ///
  /// Login Process Metrics
  static const String loginProcess = 'login_process';

  /// Logout Process Metrics
  static const String logoutProcess = 'logout_process';

  /// Authentication Check Metrics
  static const String authenticationCheck = 'authentication_check';
}
