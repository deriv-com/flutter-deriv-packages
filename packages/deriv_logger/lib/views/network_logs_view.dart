import 'package:colored_json/colored_json.dart';
import 'package:deriv_logger/controllers/controllers.dart';
import 'package:deriv_logger/views/logger_theme.dart';
import 'package:deriv_logger/widgets/controller_provider.dart';
import 'package:flutter/material.dart';

/// The view for network logs that will be displayed in the debug overlay.
class NetworkLogsView extends StatelessWidget {
  /// Creates a new instance of the NetworkLogsView.
  const NetworkLogsView({
    required this.theme,
    super.key,
  });

  /// theme
  final DebugOverlayTheme theme;

  @override
  Widget build(BuildContext context) {
    final controller = ControllerProvider.of(context)!.callLogController!;
    return ListenableBuilder(
      listenable: controller,
      builder: (BuildContext context, _) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Network logs'),
            actions: [
              IconButton(
                onPressed: () => controller.clearLogs(),
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          backgroundColor: theme.backgroundColor,
          body: Column(
            children: [
              Expanded(
                child: controller.logs.isEmpty
                    ? Center(
                        child: Text(
                          'No logs available!',
                          style: theme.bodyTextStyle,
                        ),
                      )
                    : ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.logs.length,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (_, int index) => _NetworkLogUI(
                          logVM: controller.logs[index],
                          theme: theme,
                        ),
                      ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.deepPurple[100]),
                child: TextField(
                  style: theme.bodyTextStyle.copyWith(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Search for api name...',
                    hintStyle:
                        theme.bodyTextStyle.copyWith(color: Colors.black),
                    border: InputBorder.none,
                  ),
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  controller: controller.searchController,
                  onChanged: (value) => controller.searchLogs(value),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NetworkLogUI extends StatelessWidget {
  const _NetworkLogUI({
    required this.logVM,
    required this.theme,
  });

  final CallLogVM logVM;
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
                  if (logVM.pair != null) ...[
                    Text('RESPONSE:', style: theme.bodyTextStyle),
                    const SizedBox(height: 8.0),
                    ColoredJson(
                      data: logVM.pair!.body,
                      stringColor: logVM.hasError ? Colors.red : Colors.green,
                    )
                  ],
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

  final CallLogVM logVM;
  final DebugOverlayTheme theme;

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          const SizedBox(width: 4.0),
          _buildLogIcon(),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(logVM.title, style: theme.bodyTextStyle),
              const SizedBox(height: 4.0),
              Text(logVM.methodValue, style: theme.subtitleTextStyle)
            ],
          ),
          const Spacer(),
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

  Widget _buildLogIcon() {
    if (!logVM.hasResponse) {
      return const Icon(
        Icons.circle_outlined,
        color: Colors.blueGrey,
        size: 18,
      );
    } else if (logVM.hasResponse && logVM.hasError) {
      return const Icon(
        Icons.warning_amber,
        color: Colors.red,
        size: 18,
      );
    } else {
      return const Icon(
        Icons.check_rounded,
        color: Colors.green,
        size: 18,
      );
    }
  }
}
