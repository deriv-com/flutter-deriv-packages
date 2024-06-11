import 'package:colored_json/colored_json.dart';
import 'package:deriv_logger/controllers/network_logs_controller.dart';
import 'package:deriv_logger/views/logger_theme.dart';
import 'package:flutter/material.dart';

class SubscriptionLogsView extends StatelessWidget {
  const SubscriptionLogsView({
    required this.networkLogsController,
    required this.theme,
    super.key,
  });

  /// Controller for networklogs.
  final NetworkLogsController networkLogsController;

  /// theme
  final DebugOverlayTheme theme;
  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: networkLogsController,
        builder: (BuildContext context, _) => SafeArea(
          child: Scaffold(
            appBar: AppBar(title: const Text('Network logs')),
            floatingActionButton: networkLogsController.logs.isEmpty
                ? const SizedBox()
                : FloatingActionButton(
                    onPressed: () => networkLogsController.clearLogs(),
                    child: const Icon(Icons.delete),
                  ),
            backgroundColor: theme.backgroundColor,
            body: networkLogsController.logs.isEmpty
                ? Center(
                    child: Text(
                      'No logs available!',
                      style: theme.bodyTextStyle,
                    ),
                  )
                : ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: networkLogsController.subscriptionLogs.length,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (_, int index) => _NetworkLogUI(
                      logVM: networkLogsController.subscriptionLogs[index],
                      theme: theme,
                    ),
                  ),
          ),
        ),
      );
}

class _NetworkLogUI extends StatelessWidget {
  const _NetworkLogUI({
    required this.logVM,
    required this.theme,
  });

  final SubscriptionLogVM logVM;
  final DebugOverlayTheme theme;

  @override
  Widget build(BuildContext context) => ExpansionTile(
        tilePadding: const EdgeInsets.all(0),
        iconColor: Colors.black,
        backgroundColor: logVM.getColor.withOpacity(0.1),
        collapsedBackgroundColor: logVM.getColor.withOpacity(0.1),
        title: _Title(
          logVM: logVM,
          theme: theme,
        ),
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('REQUEST:', style: theme.bodyTextStyle),
                  const SizedBox(height: 8.0),
                  ColoredJson(data: logVM.body),
                ],
              ),
            ),
          ),
        ],
      );
}

class _Title extends StatelessWidget {
  const _Title({
    required this.logVM,
    required this.theme,
  });

  final SubscriptionLogVM logVM;
  final DebugOverlayTheme theme;

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          const SizedBox(width: 4.0),
          logVM.getPayloads.isNotEmpty
              ? const Icon(
                  Icons.circle,
                  color: Colors.green,
                  size: 18,
                )
              : const Icon(
                  Icons.circle_outlined,
                  color: Colors.blueGrey,
                  size: 18,
                ),
          const SizedBox(width: 8),
          Text(logVM.title, style: theme.bodyTextStyle),
          const Spacer(),
          Text(
            logVM.payloads.length.toString(),
            style: const TextStyle(
              color: Colors.black,
            ),
            overflow: TextOverflow.fade,
            softWrap: true,
          ),
        ],
      );
}
