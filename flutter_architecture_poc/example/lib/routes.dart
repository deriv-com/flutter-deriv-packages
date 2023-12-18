import 'package:example/core/widgets/connectivity_handler.dart';
import 'package:example/core/widgets/dialogs/loading_dialog.dart';
import 'package:example/core/widgets/dialogs/logout_dialog.dart';
import 'package:example/core/widgets/dialogs/message_dialog.dart';
import 'package:example/features/chart/presentation/chart_page.dart';
import 'package:example/features/home/presentation/home_page.dart';
import 'package:example/features/login/presentation/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

String rootName = 'root';
String loginPageName = 'login_page';
String homePageName = 'home_page';
String chartPageName = 'chart_page';
String loadingDialogName = 'loading_dialog';
String messageDialogName = 'message_dialog';
String logoutDialogName = 'logout_dialog';

String rootPath = '/';
String loginPagePath = '/';
String homePagePath = '/$homePageName';
String chartPagePath = '/$chartPageName';
String loadingDialogPath = '/$loadingDialogName';
String messageDialogPath = '/$messageDialogName';
String logoutDialogPath = '/$logoutDialogName';

GoRouter router = GoRouter(
  initialLocation: rootPath,
  routes: <RouteBase>[
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) =>
          ConnectivityHandler(child),
      routes: <RouteBase>[
        GoRoute(
          name: loadingDialogName,
          path: loadingDialogPath,
          pageBuilder: (BuildContext context, GoRouterState state) =>
              showLoadingDialog(context, state.extra as String?),
        ),
        GoRoute(
          name: messageDialogName,
          path: messageDialogPath,
          pageBuilder: (BuildContext context, GoRouterState state) =>
              showMessageDialog(context, state.extra as String),
        ),
        GoRoute(
          name: logoutDialogName,
          path: logoutDialogPath,
          pageBuilder: (BuildContext context, GoRouterState state) =>
              showLogoutDialog(context, state.extra as LogoutModel),
        ),
        GoRoute(
          name: loginPageName,
          path: loginPagePath,
          builder: (BuildContext context, GoRouterState state) =>
              const LoginPage(),
        ),
        GoRoute(
          name: homePageName,
          path: homePagePath,
          builder: (BuildContext context, GoRouterState state) =>
              const HomePage(),
        ),
        GoRoute(
          name: chartPageName,
          path: chartPagePath,
          builder: (BuildContext context, GoRouterState state) =>
              const ChartPage(),
        ),
      ],
    )
  ],
);
