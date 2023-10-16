import 'dart:developer' as logger_dev;

/// Logger interface for logging errors or messages
abstract class Logger {
  /// Logs a [message].
  void log(String message);
}

/// Concrete implementation of [Logger].
class ConsoleLogger implements Logger {
  @override
  void log(String message) {
    logger_dev.log(message);
  }
}
