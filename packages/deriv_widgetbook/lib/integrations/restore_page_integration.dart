import 'package:shared_preferences/shared_preferences.dart';
import 'package:widgetbook/widgetbook.dart';

class RestoreLastPageIntegration extends WidgetbookIntegration {
  RestoreLastPageIntegration({
    required SharedPreferences preferences,
  }) : _db = preferences;

  final SharedPreferences _db;

  /// The last state (URL) that was visited. Used for initial restoration
  String get lastState => _db.getString('lastState') ?? '/';

  /// The last path (Component + Story part of the URL)
  String? _lastPath;

  /// The last params without the args
  Map<String, String>? _lastParams;

  @override
  void onChange(WidgetbookState state) {
    // On page changed
    if (_lastPath != null && state.path != null && _lastPath != state.path) {
      // Restore last arg state
      if (_db.containsKey(state.path!)) {
        state.queryParams = <String, String>{
          ...state.queryParams,
          'args': _db.getString(state.path!)!,
        };
      }

      // Maintain non-args (ie theme, textScaleFactor, etc.)
      if (_lastParams != null) {
        state.queryParams = <String, String>{
          ..._lastParams!,
          if (state.queryParams.containsKey('args'))
            'args': state.queryParams['args']!,
        };
      }
    }

    // Save current arg state
    if (state.path != null) {
      if (state.queryParams.containsKey('args')) {
        _db.setString(
          state.path!,
          state.queryParams['args']!,
        );
      } else {
        _db.remove(state.path!);
      }
    }

    _lastPath = state.path;
    _lastParams = <String, String>{...state.queryParams}..remove('args');

    // The part that enables initial state restoration
    _db.setString('lastState', state.uri.toString());
  }
}
