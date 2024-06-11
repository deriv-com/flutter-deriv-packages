import 'package:deriv_logger/controllers/controllers.dart';
import 'package:deriv_logger/deriv_logger.dart';
import 'package:deriv_logger/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/binary_api.dart';

/// DebugOverlay
class DebugOverlay extends StatefulWidget {
  /// Overlay UI
  const DebugOverlay(
      {required this.builder,
      super.key,
      this.icon = const Icon(Icons.bug_report_outlined),
      this.enabled = kDebugMode,
      this.binaryAPI});

  /// Widget that is displayed at DebugOverlay action header.
  final Widget icon;

  /// Should return your application widget for which DebugOverlay is applied.
  final WidgetBuilder builder;

  /// When this field is [true] - debug overlay is running in your app.
  /// By default, this field get value from const [kDebugMode].
  final bool enabled;

  /// Binary API for network logs.
  final BinaryAPI? binaryAPI;

  @override
  State<DebugOverlay> createState() => _DebugOverlayState();
}

class _DebugOverlayState extends State<DebugOverlay> {
  final ConsoleLogController consoleLogsController = ConsoleLogController();
  late final NetworkLogsController _networkLogsController;

  @override
  void initState() {
    super.initState();

    if (widget.enabled) {
      WidgetsBinding.instance.addPostFrameCallback(
          (Duration timeStamp) => _insertOverlay(context));
    }

    if (widget.binaryAPI != null) {
      _networkLogsController = NetworkLogsController(
        exposure: widget.binaryAPI!.callHistory!,
        subscriptionExposure: widget.binaryAPI!.subscriptionHistory!,
      );
    }
    consoleLogsController.initialize();
  }

  @override
  Widget build(BuildContext context) => widget.builder.call(context);

  void _insertOverlay(BuildContext context) {
    const DebugOverlayTheme theme = DebugOverlayTheme();

    return Overlay.of(context).insert(
      OverlayEntry(
        builder: (BuildContext context) => DebugOverlayButton(
          theme: theme,
          onTap: () => _onButtonTap(context, theme),
          child: widget.icon,
        ),
      ),
    );
  }

  void _onButtonTap(BuildContext context, DebugOverlayTheme theme) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: theme.backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (BuildContext ctx) => FractionallySizedBox(
        heightFactor: 0.9,
        child: widget.binaryAPI != null
            ? MainDebugView(
                theme: theme,
                consoleLogsController: consoleLogsController,
                networkLogsController: _networkLogsController,
              )
            : ConsoleLogsView(
                theme: theme,
                consoleLogsController: consoleLogsController,
              ),
      ),
    );
  }
}
