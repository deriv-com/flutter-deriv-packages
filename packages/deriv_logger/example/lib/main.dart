import 'package:deriv_logger/deriv_logger.dart';
import 'package:flutter/material.dart';

void main() {
  AppLogger.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DebugOverlay(
        enabled: true,
        builder: (_) => const MyHomePage(
          title: 'Flutter Demo Home Page',
        ),
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
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Run this app in debug mode, press any button below and check the debug button and your terminal',
              textAlign: TextAlign.center,
            ),
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
}
