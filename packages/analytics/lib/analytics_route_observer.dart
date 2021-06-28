import 'package:flutter/material.dart';

/// Class used as route-observer
class AnalyticsRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  /// Constructor of "AnalyticsRouteObserver" class with [onNewRoute] callback as argument.
  AnalyticsRouteObserver({
    required this.onNewRoute,
  });

  /// Function callback from the "AnalyticsRouteObserver" class.
  final Function onNewRoute;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      onNewRoute(route);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      onNewRoute(newRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute && route is PageRoute) {
      onNewRoute(previousRoute);
    }
  }
}
