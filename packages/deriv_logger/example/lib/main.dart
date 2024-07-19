import 'package:deriv_logger/deriv_logger.dart';
import 'package:example/network_log_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/api/response/active_symbols_response_result.dart';
import 'package:flutter_deriv_api/api/response/ticks_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/binary_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/state/connection/connection_cubit.dart'
    as connection_cubit;

void main() {
  AppLogger.initialize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late connection_cubit.ConnectionCubit _connectionCubit;

  @override
  void initState() {
    super.initState();

    _connectionCubit = connection_cubit.ConnectionCubit(
      ConnectionInformation(
        appId: '23789',
        brand: 'deriv',
        endpoint: 'green.derivws.com',
        authEndpoint: '',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _connectionCubit,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Builder(builder: (context) {
          return BlocBuilder<connection_cubit.ConnectionCubit,
              connection_cubit.ConnectionState>(
            builder: (context, state) {
              return state is connection_cubit.ConnectionConnectedState
                  ? DebugOverlay(
                      enabled: true,
                      callEmitter:
                          NetworkLogHandler(_connectionCubit.api as BinaryAPI)
                              .callLogEmitter,
                      subscriptionEmitter:
                          NetworkLogHandler(_connectionCubit.api as BinaryAPI)
                              .subscriptionLogEmitter,
                      builder: (_) => const MyHomePage(
                        title: 'Flutter Demo Home Page',
                      ),
                    )
                  : const Scaffold(
                      body: Center(
                        child: Text(
                          'Connecting to server...',
                        ),
                      ),
                    );
            },
          );
        }),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Run this app in debug mode, press any button below and check the debug button and your terminal',
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: _makeApiCall,
              child: const Text('Make api call for ActiveSymbol request'),
            ),
            ElevatedButton(
              onPressed: _makeSubscriptionCall,
              child: const Text('Make api call for Subscription call'),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () => AppLogger.i('Information', title: 'Main page'),
            tooltip: 'information',
            child: const Text('Information'),
          ),
          FloatingActionButton(
            onPressed: () => AppLogger.e('This is error!!', title: 'Main page'),
            tooltip: 'error',
            child: const Text('Error'),
          ),
          FloatingActionButton(
            onPressed: () =>
                AppLogger.w('Showing some warning!!', title: 'Main page'),
            tooltip: 'warning',
            child: const Text('Warning'),
          ),
          FloatingActionButton(
            onPressed: () =>
                AppLogger.f('This is a fatal message', title: ' Main Page'),
            tooltip: 'fatal',
            child: const Text('Fatal'),
          ),
          FloatingActionButton(
            onPressed: () =>
                AppLogger.s('This is a success', title: ' Main Page'),
            tooltip: 'success',
            child: const Text('Success'),
          ),
        ],
      ),
    );
  }

  void _makeSubscriptionCall() async {
    final value = TicksResponse.subscribeTick(
      const TicksRequest(ticks: ['R_100', 'R_50']),
    );

    AppLogger.i(value, title: 'Active Symbol Payload');
  }

  void _makeApiCall() async {
    ActiveSymbolsResponse.fetchActiveSymbols(
      const ActiveSymbolsRequest(
        activeSymbols: 'brief',
        productType: 'basic',
        landingCompany: 'svg',
      ),
    );
  }
}
