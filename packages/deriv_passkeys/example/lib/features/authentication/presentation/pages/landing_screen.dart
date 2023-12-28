
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:passkeys_poc/features/authentication/presentation/blocs/auth_bloc.dart';
import 'package:passkeys_poc/features/authentication/presentation/blocs/auth_event.dart';
import 'package:passkeys_poc/features/authentication/presentation/blocs/auth_state.dart';
import 'package:passkeys_poc/features/authentication/presentation/pages/cred_screen.dart';
import 'package:passkeys_poc/features/authentication/presentation/pages/passkeys_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
          appBar: PlatformAppBar(
            title: const Text('Main Landing Page'),
          ),
          body: BlocConsumer<AuthBloc, AuthState>(

      listener: (context, snapshot) {
        if (snapshot is AuthenticatedState) {
          Navigator.pop(context);
        }
      },
      builder: (context, snapshot) {
        if(snapshot is AuthenticatedState) {
          // show a text widget with the user's email and a button to go to logout which will dispatch an event to the bloc
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome ${snapshot.userEntity.email}'),
                  const SizedBox(height: 16),
                  CupertinoButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(const LogoutEvent());
                    },
                    child: const Text('Logout'),
                  ),
                ],
              ),
            ),
          );
        }
              return Padding( 
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            platformPageRoute(
                              context: context,
                              builder: (context) => PasskeysScreen(), // Passkeys page
                            ),
                          );
                        },
                        child: const Text('Go to Passkeys Page'),
                      ),
                      const SizedBox(height: 16),
                      CupertinoButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            platformPageRoute(
                              context: context,
                              builder: (context) => const CredentialsScreen(), // Credentials page
                            ),
                          );
                        },
                        child: const Text('Go to Credentials Page'),
                      ),
                    ],
                  ),
                ),
              );
            }
          ),
        );
  }
}
