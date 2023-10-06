import 'dart:async';

/// Defines all the actions that the Rudderstack client can perform
abstract class DerivRudderstackActions {

  /// Identifies a user with the given [userId].
  Future<bool> identify({required String userId});

  /// Tracks an event with the given [eventName].
  Future<bool> track({required String eventName});

  /// Logs a screen view with the given [screenName].
  Future<bool> screen({required String screenName});

  /// Adds a user to a group with the given [groupId].
  Future<bool> group({required String groupId});

  /// Aliases a user with the given alias.
  Future<bool> alias({required String alias});

  /// Sets up the RudderStack client.
  ///
  /// Takes [dataPlaneUrl] and [writeKey] as parameters.
  Future<bool> setup({required String dataPlaneUrl, required String writeKey});

  /// Resets the RudderStack client state.
  Future<bool> reset();

  /// Disables the RudderStack client.
  Future<bool> disable();

  /// Enables the RudderStack client.
  Future<bool> enable();

  /// Sets the context for the RudderStack client.
  ///
  /// Takes a [token] as a parameter.
  Future<bool> setContext({required String token});

}
