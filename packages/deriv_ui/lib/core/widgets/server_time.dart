// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'package:flutter_deriv_bloc_manager/manager.dart';
//
// import 'package:flutter_multipliers/core/states/sync_time/sync_time_cubit.dart';
//
// /// Server time builder handler.
// typedef ServerTimeBuilder = Widget Function(DateTime serverTime);
//
// /// Server time error builder handler.
// typedef ServerTimeErrorBuilder = Widget Function(String error);
//
// /// Server time widget for wrapping server time and build a widget based on the server time difference in seconds.
// class ServerTime extends StatelessWidget {
//   /// Initializes server time widget.
//   const ServerTime({
//     required this.builder,
//     Key? key,
//   }) : super(key: key);
//
//   /// Server time widget builder.
//   ///
//   /// [builder] is required.
//   final ServerTimeBuilder builder;
//
//   @override
//   Widget build(BuildContext context) =>
//       BlocBuilder<SyncTimeCubit, SyncTimeState>(
//         bloc: BlocManager.instance.fetch<SyncTimeCubit>(),
//         builder: (BuildContext context, SyncTimeState state) =>
//             builder(state.dateTime),
//       );
// }
