import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

import 'package:flutter_deriv_bloc_manager_example/states/dependent_cubit/dependent_cubit.dart';
import 'package:flutter_deriv_bloc_manager_example/states/main_cubit/main_cubit.dart';

void main() {
  initializeBlocs();

  runApp(const App());
}

void initializeBlocs() {
  // Register Blocs.
  BlocManager.instance.register(MainCubit());
  BlocManager.instance.register(DependentCubit());

  // Call a function in the [MainCubit] to emit an state.
  BlocManager.instance.fetch<MainCubit>().doCalculation();
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Deriv bloc manager example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<MainCubit, MainCubitState>(
                bloc: BlocManager.instance.fetch<MainCubit>(),
                builder: (context, state) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Main Cubit State: '),
                    Expanded(
                      child: Text(
                        '$state',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              BlocBuilder<DependentCubit, DependentCubitState>(
                bloc: BlocManager.instance.fetch<DependentCubit>(),
                builder: (context, state) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Dependent Cubit State: '),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '$state',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
