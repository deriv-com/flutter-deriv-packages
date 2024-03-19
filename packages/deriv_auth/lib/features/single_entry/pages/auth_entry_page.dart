import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth/features/single_entry/core/auth_data.dart';
import 'package:deriv_auth/features/single_entry/features/get_started/pages/get_started_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Auth entry page for single entry
class AuthEntryPage extends StatelessWidget {
  /// Constructor [AuthEntryPage]
  AuthEntryPage(AuthEntryModel entryData) {
    AuthData().data = entryData;
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<DerivAuthCubit>.value(
            value: AuthData().data.derivAuthCubit,
          ),
          BlocProvider<SocialAuthCubit>.value(
            value: AuthData().data.socialAuthCubit,
          ),
        ],
        child: const GetStartedPage(),
      );
}
