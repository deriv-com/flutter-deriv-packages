import 'package:deriv_auth/core/analytics/enums.dart';

/// Get user tracking data.
Map<String, dynamic> getUserTrackingData(
  LoginAction action,
  String appId, {
  required LoginProvider provider,
  String? errorMessage,
}) =>
    switch (action) {
      LoginAction.openLoginForm => <String, dynamic>{
          'event': 'open',
          'properties': <String, String>{
            'app_id': appId,
          },
        },
      LoginAction.startLogin => _getLoginStartedTrackingData(
          provider,
          appId,
        ),
      LoginAction.finishLogin => _getLoginFinishedTrackingData(
          provider,
          appId,
        ),
      LoginAction.loginError => _getLoginErrorTrackingData(
          provider,
          appId,
          errorMessage ?? (throw Exception('Error message is required.')),
        ),
    };

/// Get login started tracking data.
Map<String, dynamic> _getLoginStartedTrackingData(
        LoginProvider? provider, String appId) =>
    switch (provider) {
      LoginProvider.email => <String, dynamic>{
          'event': 'login_started',
          'properties': <String, dynamic>{
            'app_id': appId,
            'login_provider': 'email',
          },
        },
      LoginProvider.passkey => <String, dynamic>{
          'event': 'login_started',
          'properties': <String, dynamic>{
            'app_id': appId,
            'login_provider': 'passkey',
          },
        },
      LoginProvider.google => <String, dynamic>{
          'event': 'login_started',
          'properties': <String, dynamic>{
            'app_id': appId,
            'login_provider': 'google',
          },
        },
      LoginProvider.facebook => <String, dynamic>{
          'event': 'login_started',
          'properties': <String, dynamic>{
            'app_id': appId,
            'login_provider': 'facebook',
          },
        },
      LoginProvider.apple => <String, dynamic>{
          'event': 'login_started',
          'properties': <String, dynamic>{
            'app_id': appId,
            'login_provider': 'apple',
          },
        },
      null => throw Exception('Null LoginProvider is being passed.'),
    };

/// Get login finished tracking data.
Map<String, dynamic> _getLoginFinishedTrackingData(
        LoginProvider? provider, String appId) =>
    switch (provider) {
      LoginProvider.email => <String, dynamic>{
          'event': 'login_finished',
          'properties': <String, dynamic>{
            'app_id': appId,
            'login_provider': 'email',
          },
        },
      LoginProvider.passkey => <String, dynamic>{
          'event': 'login_finished',
          'properties': <String, dynamic>{
            'app_id': appId,
            'login_provider': 'passkey',
          },
        },
      LoginProvider.google => <String, dynamic>{
          'event': 'login_finished',
          'properties': <String, dynamic>{
            'app_id': appId,
            'login_provider': 'google',
          },
        },
      LoginProvider.facebook => <String, dynamic>{
          'event': 'login_finished',
          'properties': <String, dynamic>{
            'app_id': appId,
            'login_provider': 'facebook',
          },
        },
      LoginProvider.apple => <String, dynamic>{
          'event': 'login_finished',
          'properties': <String, dynamic>{
            'app_id': appId,
            'login_provider': 'apple',
          },
        },
      null => throw Exception('Null LoginProvider is being passed.'),
    };

/// Get login error tracking data.
Map<String, dynamic> _getLoginErrorTrackingData(
  LoginProvider? provider,
  String appId,
  String errorMessage,
) =>
    switch (provider) {
      LoginProvider.email => <String, dynamic>{
          'event': 'login_flow_error',
          'properties': <String, dynamic>{
            'app_id': appId,
            'login_provider': 'email',
            'error_message': errorMessage,
          },
        },
      LoginProvider.passkey => <String, dynamic>{
          'event': 'login_flow_error',
          'properties': <String, dynamic>{
            'app_id': appId,
            'login_provider': 'passkey',
            'error_message': errorMessage,
          },
        },
      LoginProvider.google => <String, dynamic>{
          'event': 'login_flow_error',
          'properties': <String, dynamic>{
            'app_id': appId,
            'login_provider': 'google',
            'error_message': errorMessage,
          },
        },
      LoginProvider.facebook => <String, dynamic>{
          'event': 'login_flow_error',
          'properties': <String, dynamic>{
            'app_id': appId,
            'login_provider': 'facebook',
            'error_message': errorMessage,
          },
        },
      LoginProvider.apple => <String, dynamic>{
          'event': 'login_flow_error',
          'properties': <String, dynamic>{
            'app_id': appId,
            'login_provider': 'apple',
            'error_message': errorMessage,
          },
        },
      null => <String, dynamic>{
          'event': 'login_flow_error',
          'properties': <String, dynamic>{
            'app_id': appId,
            'login_provider': 'default_token',
            'error_message': errorMessage,
          },
        },
    };
