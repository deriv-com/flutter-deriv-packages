import 'dart:async';
import 'dart:developer' as logger;

import 'package:flutter/services.dart';

/// DerivRudderstack plugin handles initialising and setting up RudderStack
/// client and handles logging various analytical events.
class DerivRudderstack {
  static const MethodChannel _channel = MethodChannel('deriv_rudderstack');

  /// Call `identify` to track the users across the application installation.
  /// It requires [userId] and an optional map of [traits] for extra details.
  Future<bool> identify(
      {required String userId, Map<String, dynamic>? traits}) async {
    try {
      final bool response =
          await _channel.invokeMethod<dynamic>('identify', <String, dynamic>{
        'userId': userId,
        'traits': traits ?? <String, dynamic>{},
      });

      return response;
    } on PlatformException catch (e) {
      logger.log('${(DerivRudderstack).toString()}: ${e.message}');
    }

    return false;
  }

  /// Call `track` to record the users' activity. It requires the [eventName]
  /// and an optional [properties] map for extra details.
  Future<bool> track(
      {required String eventName, Map<String, dynamic>? properties}) async {
    try {
      final bool response =
          await _channel.invokeMethod<dynamic>('track', <String, dynamic>{
        'eventName': eventName,
        'properties': properties ?? <String, dynamic>{},
      });
      return response;
    } on PlatformException catch (e) {
      logger.log('${(DerivRudderstack).toString()}: ${e.message}');
    }

    return false;
  }

  /// You can use the `screen` call to record whenever the user sees a screen
  /// on the mobile device. It requires [screenName] an optional
  /// [properties] map for extra details.
  Future<bool> screen(
      {required String screenName, Map<String, dynamic>? properties}) async {
    try {
      final bool response =
          await _channel.invokeMethod<dynamic>('screen', <String, dynamic>{
        'screenName': screenName,
        'properties': properties ?? <String, dynamic>{},
      });

      return response;
    } on PlatformException catch (e) {
      logger.log('${(DerivRudderstack).toString()}: ${e.message}');
    }

    return false;
  }

  /// The `group` call associates a user to a specific organization. It requires
  /// [groupId] and an optional [traits] map for extra details.
  Future<bool> group(
      {required String groupId, Map<String, dynamic>? traits}) async {
    try {
      final bool response =
          await _channel.invokeMethod<dynamic>('group', <String, dynamic>{
        'groupId': groupId,
        'traits': traits ?? <String, dynamic>{},
      });

      return response;
    } on PlatformException catch (e) {
      logger.log('${(DerivRudderstack).toString()}: ${e.message}');
    }

    return false;
  }

  /// The `alias` call associates the user with a new identification. It requires
  /// [alias] value.
  Future<bool> alias({required String alias}) async {
    try {
      final bool response =
          await _channel.invokeMethod<dynamic>('alias', <String, dynamic>{
        'alias': alias,
      });

      return response;
    } on PlatformException catch (e) {
      logger.log('${(DerivRudderstack).toString()}: ${e.message}');
    }

    return false;
  }

  /// Use the `reset` call to clear the persisted traits for the identify call.
  /// This is required for Logout operations.
  Future<bool> reset() async {
    try {
      final bool response = await _channel.invokeMethod<dynamic>('reset');

      return response;
    } on PlatformException catch (e) {
      logger.log('${(DerivRudderstack).toString()}: ${e.message}');
    }

    return false;
  }

  /// Call `disable` to disable sending rudder stack events.
  Future<bool> disable() async {
    try {
      return await _channel.invokeMethod<dynamic>('disable');
    } on PlatformException catch (e) {
      logger.log('${(DerivRudderstack).toString()}: ${e.message}');
    }

    return false;
  }

  /// Call `enable` too enable sending rudder stack events.
  Future<bool> enable() async {
    try {
      return await _channel.invokeMethod<dynamic>('enable');
    } on PlatformException catch (e) {
      logger.log('${(DerivRudderstack).toString()}: ${e.message}');
    }

    return false;
  }

  /// Call `setContext` to support sending push notification to the destinations
  /// that support Push Notification. It requires [token] value.
  Future<bool> setContext({required String token}) async {
    try {
      final bool response =
          await _channel.invokeMethod<dynamic>('setContext', <String, dynamic>{
        'pushToken': token,
      });

      return response;
    } on PlatformException catch (e) {
      logger.log('${(DerivRudderstack).toString()}: ${e.message}');
    }

    return false;
  }
}
