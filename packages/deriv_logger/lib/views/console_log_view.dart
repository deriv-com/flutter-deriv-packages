import 'package:deriv_logger/controllers/logger_controller.dart';
import 'package:deriv_logger/views/logger_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Page for Console logs.
class ConsoleLogsView extends StatelessWidget {
  /// Creates a new instance of the ConsoleLogsView.
  const ConsoleLogsView({
    required this.consoleLogsController,
    required this.theme,
    super.key,
  });

  /// The console log controller.
  final ConsoleLogController consoleLogsController;

  /// theme
  final DebugOverlayTheme theme;

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: consoleLogsController,
        builder: (BuildContext context, _) => SafeArea(
          child: Scaffold(
            appBar: AppBar(title: const Text('Console logs')),
            floatingActionButton: consoleLogsController.logs.isEmpty
                ? const SizedBox()
                : FloatingActionButton(
                    onPressed: () => consoleLogsController.clearLogs(),
                    child: const Icon(Icons.delete),
                  ),
            backgroundColor: theme.backgroundColor,
            body: consoleLogsController.logs.isEmpty
                ? Center(
                    child: Text(
                      'No logs available!',
                      style: theme.bodyTextStyle,
                    ),
                  )
                : ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: consoleLogsController.logs.length,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (_, int index) => ConsoleLogCard(
                      log: consoleLogsController.logs[index],
                      theme: theme,
                    ),
                  ),
          ),
        ),
      );
}

/// Log item UI.
class ConsoleLogCard extends StatelessWidget {
  /// Creates a UI for log messages.
  const ConsoleLogCard({
    super.key,
    required this.log,
    required this.theme,
  });
  final ConsoleLogVM log;
  final DebugOverlayTheme theme;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: log.color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            Divider(thickness: 0.2, height: 12, color: log.color),
            if (log.title != null) ...[
              _buildLogTitle(context),
              const SizedBox(height: 8),
            ],
            _buildLogContent(context),
            if (log.stackTrace != null) ...[
              const Divider(thickness: 0.5, height: 12),
              _buildStackTrace(context),
            ],
          ],
        ),
      );

  Widget _buildHeader(BuildContext context) => Row(
        children: [
          Text(
            log.level,
            style: TextStyle(fontWeight: FontWeight.bold, color: log.color),
          ),
          const Spacer(),
          const SizedBox(width: 16),
          Text(
            log.time,
            style: theme.subtitleTextStyle
                .copyWith(fontStyle: FontStyle.italic, color: log.color),
          ),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: () => Clipboard.setData(ClipboardData(text: log.toString())),
            child: Icon(
              Icons.copy,
              size: 18,
              color: log.color,
            ),
          ),
        ],
      );

  Widget _buildLogTitle(BuildContext context) => Text(
        log.title!,
        style: theme.bodyTextStyle
            .copyWith(fontWeight: FontWeight.bold, color: log.color),
      );

  Widget _buildLogContent(BuildContext context) =>
      Text(log.text, style: theme.bodyTextStyle);

  Widget _buildStackTrace(BuildContext context) => Scrollbar(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Text(
            log.stackTrace!,
            style: theme.subtitleTextStyle.copyWith(),
            maxLines: 10,
          ),
        ),
      );
}
