import 'package:example/core/connectivity_service/connectivity_service.dart';
import 'package:example/core/enums.dart';
import 'package:example/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConnectivityHandler extends StatefulWidget {
  const ConnectivityHandler(this.child, {super.key});

  final Widget child;

  @override
  State<ConnectivityHandler> createState() => _ConnectivityHandlerState();
}

class _ConnectivityHandlerState extends State<ConnectivityHandler> {
  @override
  void initState() {
    super.initState();

    ConnectivityService().connectivityStatus.listen(_handleConnectivity);
  }

  @override
  Widget build(BuildContext context) => widget.child;

  void _handleConnectivity(ConnectivityStatus event) {
    if (event == ConnectivityStatus.connecting) {
      context.push(loadingDialogPath, extra: 'Connecting...');
    } else if (context.canPop()) {
      context.pop();
    }
  }
}
