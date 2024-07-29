import 'package:colored_json/colored_json.dart';
import 'package:deriv_logger/controllers/controllers.dart';
import 'package:deriv_logger/views/logger_theme.dart';
import 'package:deriv_logger/widgets/controller_provider.dart';
import 'package:flutter/material.dart';

/// This widget is used to display the subscription logs with request payload and
/// all the responses.
class SubscriptionLogsView extends StatelessWidget {
  /// Constructor for SubscriptionLogsView.
  const SubscriptionLogsView({
    required this.theme,
    super.key,
  });

  /// theme
  final DebugOverlayTheme theme;
  @override
  Widget build(BuildContext context) {
    var controller = ControllerProvider.of(context)!.subscriptionLogController!;
    return ListenableBuilder(
      listenable: controller,
      builder: (BuildContext context, _) => SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text('Subscription logs')),
          backgroundColor: theme.backgroundColor,
          body: controller.logs.isEmpty
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
                  itemBuilder: (_, int index) => InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SubscriptionLogDetail(
                          networkLogsController: controller,
                          logVM: controller.logs[index],
                          theme: theme,
                        ),
                      ),
                    ),
                    child: _NetworkLogUI(
                      logVM: controller.logs[index],
                      theme: theme,
                    ),
                  ),
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

  final SubscriptionLogVM logVM;
  final DebugOverlayTheme theme;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(6),
        color: logVM.getColor.withOpacity(0.1),
        child: _Title(
          logVM: logVM,
          theme: theme,
        ),
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

class SubscriptionLogDetail extends StatelessWidget {
  /// Controller for networklogs.
  final NetworkLogsController networkLogsController;

  final SubscriptionLogVM logVM;

  /// theme
  final DebugOverlayTheme theme;

  const SubscriptionLogDetail({
    required this.networkLogsController,
    required this.logVM,
    required this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(logVM.title),
      ),
      backgroundColor: theme.backgroundColor,
      body: AnimatedBuilder(
        animation: networkLogsController,
        builder: (BuildContext context, _) => SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _RequestUI(logVM),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: logVM.getPayloads.length,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (_, int index) => DetailItem(
                    logVM: logVM.getPayloads[index],
                    theme: theme,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _RequestUI extends StatelessWidget {
  const _RequestUI(this.log);

  final SubscriptionLogVM log;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Request',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const Divider(thickness: 0.2, height: 12, color: Colors.black38),
          Container(
            constraints: const BoxConstraints(maxHeight: 200),
            width: double.infinity,
            child: SingleChildScrollView(
              child: ColoredJson(
                data: log.body,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  const DetailItem({
    super.key,
    required this.logVM,
    required this.theme,
  });

  final NetworkLogVM logVM;

  /// theme
  final DebugOverlayTheme theme;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.all(0),
      iconColor: Colors.black,
      backgroundColor: logVM.getColor.withOpacity(0.1),
      collapsedBackgroundColor: logVM.getColor.withOpacity(0.1),
      title: _DetailTitle(
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
                ColoredJson(data: logVM.body),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _DetailTitle extends StatelessWidget {
  const _DetailTitle({
    required this.logVM,
    required this.theme,
  });

  final NetworkLogVM logVM;

  /// theme
  final DebugOverlayTheme theme;

  @override
  Widget build(BuildContext context) => Text(
        logVM.methodValue,
        style: theme.bodyTextStyle,
        overflow: TextOverflow.ellipsis,
      );
}
