import 'package:example/core/widgets/dialogs/logout_dialog.dart';
import 'package:example/features/active_symbol/presentation/widgets/active_symbol.dart';
import 'package:example/features/login/presentation/states/login_cubit.dart';
import 'package:example/features/tick_stream/presentation/states/tick_stream_cubit.dart';
import 'package:example/features/tick_stream/presentation/states/tick_stream_cubit_extended.dart';
import 'package:example/features/tick_stream/presentation/widgets/tick_stream.dart';
import 'package:example/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Active Symbols'),
          leading: _buildLogoutButton(context),
          actions: <Widget>[_buildChartButton()],
        ),
        body: const Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              SizedBox(height: 48, child: ActiveSymbol()),
              Expanded(child: TickStream()),
            ],
          ),
        ),
      );

  Widget _buildChartButton() =>
      BlocBuilder<TickStreamCubitExtended, TickStreamState>(
        builder: (BuildContext context, TickStreamState state) => IconButton(
          icon: const Icon(Icons.ssid_chart_rounded),
          onPressed: state is TickStreamLoadedState
              ? () => context.push(chartPagePath)
              : null,
        ),
      );

  Widget _buildLogoutButton(BuildContext context) => IconButton(
        icon: const Icon(Icons.person),
        onPressed: () async {
          final LoginCubit loginCubit = context.read<LoginCubit>();
          final String loginId = await loginCubit.loginId;

          final LogoutModel logoutModel = LogoutModel(
            loginId,
            () {
              loginCubit.logout();
              context.go(loginPagePath);
            },
          );

          await context.push(logoutDialogPath, extra: logoutModel);
        },
      );
}
