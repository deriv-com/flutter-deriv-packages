import 'package:flutter/material.dart';

import '../controllers/controllers.dart';
import 'views.dart';

/// Main view for Debug feature.
class MainDebugView extends StatefulWidget {
  /// Creates a new instance of the DebugView.
  const MainDebugView({
    required this.theme,
    required this.consoleLogsController,
    required this.callLogController,
    required this.subscriptionLogController,
    super.key,
  });

  /// controller for terminal logs.
  final ConsoleLogController consoleLogsController;

  /// Controller for network logs.
  final CallLogController callLogController;
  final SubscriptionLogController subscriptionLogController;

  /// Theme for debug view.
  final DebugOverlayTheme theme;
  @override
  State<MainDebugView> createState() => _MainDebugViewState();
}

class _MainDebugViewState extends State<MainDebugView> {
  late final List<Widget> _views;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _views = <Widget>[
      ConsoleLogsView(
        consoleLogsController: widget.consoleLogsController,
        theme: widget.theme,
      ),
      NetworkLogsView(
        controller: widget.callLogController,
        theme: widget.theme,
      ),
      SubscriptionLogsView(
        contoller: widget.subscriptionLogController,
        theme: widget.theme,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _views[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _changeView,
          currentIndex: _currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.light_mode_sharp),
              label: 'Console logs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.light_mode_sharp),
              label: 'Network Logs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lightbulb_outline_sharp),
              label: 'Subscriptions Logs',
            ),
          ],
        ),
      );

  void _changeView(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
