import 'package:example/features/tick_stream/presentation/states/tick_stream_cubit.dart';
import 'package:example/features/tick_stream/presentation/states/tick_stream_cubit_extended.dart';
import 'package:example/features/tick_stream/presentation/widgets/tick_stream_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TickStream extends StatelessWidget {
  const TickStream({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: BlocBuilder<TickStreamCubitExtended, TickStreamState>(
          builder: (BuildContext context, TickStreamState state) {
            if (state is TickStreamInitialState) {
              return const Text('Please select an active symbol.');
            }

            if (state is TickStreamLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is TickStreamLoadedState) {
              return TickStreamWidget(entity: state.tick);
            }

            if (state is TickStreamErrorState) {
              return Text(state.message);
            }

            return const Text('Unknown State');
          },
        ),
      );
}
