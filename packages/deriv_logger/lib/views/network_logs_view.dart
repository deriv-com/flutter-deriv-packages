import 'package:colored_json/colored_json.dart';
import 'package:deriv_logger/controllers/network_logs_controller.dart';
import 'package:deriv_logger/views/logger_theme.dart';
import 'package:flutter/material.dart';

/// The view for network logs that will be displayed in the debug overlay.
class NetworkLogsView extends StatelessWidget {
  /// Creates a new instance of the NetworkLogsView.
  const NetworkLogsView({
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
                    itemCount: networkLogsController.logs.length,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (_, int index) => _NetworkLogUI(
                      logVM: networkLogsController.logs[index],
                    ),
                  ),
          ),
        ),
      );
}

class _NetworkLogUI extends StatelessWidget {
  const _NetworkLogUI({
    required this.logVM,
  });

  final NetworkLogVM logVM;

  @override
  Widget build(BuildContext context) => ExpansionTile(
        backgroundColor: logVM.getColor.withOpacity(0.1),
        collapsedBackgroundColor: logVM.getColor.withOpacity(0.1),
        title: ListTile(
          leading: logVM.isRequest
              ? Icon(
                  Icons.keyboard_double_arrow_up_outlined,
                  color: Colors.deepPurple[300],
                )
              : const Icon(
                  Icons.keyboard_double_arrow_down,
                  color: Colors.green,
                ),
          title: Text(
            logVM.title,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            logVM.getTimeString,
            style: const TextStyle(color: Colors.black, fontSize: 12),
          ),
        ),
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ColoredJson(
                data: logVM.body,
              ),
            ),
          ),
        ],
      );
}

class _Title extends StatelessWidget {
  const _Title({
    required this.logVM,
  });

  final NetworkLogVM logVM;

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          logVM.isRequest
              ? const Icon(
                  Icons.keyboard_double_arrow_up_outlined,
                  color: Colors.red,
                )
              : const Icon(
                  Icons.keyboard_double_arrow_down,
                  color: Colors.green,
                ),
          logVM.isRequest
              ? const Text(
                  'REQUEST:',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )
              : const Text(
                  'RESPONSE:',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
          const SizedBox(width: 8),
          Text(
            logVM.title,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            logVM.getTimeString,
            style: const TextStyle(
              color: Colors.black,
            ),
            overflow: TextOverflow.fade,
            softWrap: true,
          ),
        ],
      );
}
