import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:update_checker/update_checker.dart';

/// UpdateBlocPage
class UpdateBlocPage extends StatefulWidget {
  @override
  _UpdateBlocPageState createState() => _UpdateBlocPageState();
}

class _UpdateBlocPageState extends State<UpdateBlocPage> {
  final UpdateBloc updateBloc =
      UpdateBloc(firebaseRepository: FirebaseRemoteConfigRepository());

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('UpdateBloc'),
        ),
        body: BlocProvider<UpdateBloc>(
          create: (_) => updateBloc,
          child: BlocBuilder<UpdateBloc, UpdateState>(
            builder: (_, UpdateState state) => Center(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('${state.runtimeType}'),
                    const SizedBox(
                      height: 24,
                    ),
                    ElevatedButton(
                      child: const Text('Fetch'),
                      onPressed: state is UpdateInProgressState
                          ? null
                          : () => updateBloc.add(UpdateFetchEvent()),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
