import 'package:deriv_logger/controllers/controllers.dart';
import 'package:flutter/material.dart';

class ControllerProvider extends InheritedWidget {
  final ConsoleLogController consoleLogController;
  final SubscriptionLogController? subscriptionLogController;
  final CallLogController? callLogController;

  const ControllerProvider({
    super.key,
    required this.consoleLogController,
    this.subscriptionLogController,
    this.callLogController,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(ControllerProvider oldWidget) {
    return true;
  }

  static ControllerProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ControllerProvider>();
  }
}
