import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:passkeys/passkey_auth.dart';
import 'package:passkeys_poc/features/authentication/data/data_sources/relying_party_server.dart';
import 'package:passkeys_poc/features/authentication/presentation/blocs/auth_bloc.dart';
import 'package:passkeys_poc/features/authentication/presentation/blocs/auth_event.dart';
import 'package:passkeys_poc/features/authentication/presentation/entities/user_entity.dart';

class PasskeysScreen extends StatefulWidget {
  PasskeysScreen({super.key}) : _auth = PasskeyAuth(SharedRelyingPartyServer());

  final PasskeyAuth<RpRequest, RpResponse> _auth;

  @override
  State<PasskeysScreen> createState() => _PasskeysScreenState();
}

enum PageMode { registration, login, loggedIn }

class _PasskeysScreenState extends State<PasskeysScreen> {
  final _emailController = TextEditingController(text: "bassam@deriv.com");
  PageMode _pageMode = PageMode.registration;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const Text('Passkeys Example'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Text(
                'Tired of passwords?',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 50, top: 10, bottom: 10),
              child: Text(
                'Sign in using your biometrics like fingerprint or face.',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: PlatformTextField(
                  controller: _emailController,
                  hintText: "Email",
                )),
            SizedBox(
                width: double.infinity,
                height: 50,
                child: CupertinoButton(
                    onPressed: _onclick, child: Text(_buttonText()))),
            const SizedBox(height: 16),
            _drawSubLine(),
          ],
        ),
      ),
    );
  }

  String _buttonText() {
    if (_pageMode == PageMode.registration) {
      return 'sign up';
    } else if (_pageMode == PageMode.login) {
      return 'sign in';
    } else {
      return 'logout';
    }
  }

  Widget _drawSubLine() {
    if (_pageMode == PageMode.registration) {
      return RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: 'Already have an account? ',
              style: TextStyle(color: CupertinoColors.black),
            ),
            TextSpan(
              text: 'Sign in',
              style: TextStyle(color: CupertinoTheme.of(context).primaryColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  setState(() {
                    _pageMode = PageMode.login;
                  });
                },
            )
          ],
        ),
      );
    } else if (_pageMode == PageMode.login) {
      return RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: 'First time here? ',
              style: TextStyle(color: CupertinoColors.black),
            ),
            TextSpan(
              text: 'Sign up',
              style: TextStyle(color: CupertinoTheme.of(context).primaryColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  setState(() {
                    _pageMode = PageMode.registration;
                  });
                },
            )
          ],
        ),
      );
    } else {
      return const Text('You are currently logged in.');
    }
  }

  Future<void> _onclick() async {
    // // You can add your logic here.
    try {
      if (_pageMode == PageMode.registration) {
        final response = await widget._auth.registerWithEmail(RpRequest(
          email: _emailController.text,
        ));

        if (response != null) {
          UserEntity user = UserEntity(id: "", email: _emailController.text);

          context.read<AuthBloc>().add(SignupEvent(userEntity: user));

          setState(() {
            _pageMode = PageMode.loggedIn;
          });
        }
      } else if (_pageMode == PageMode.login) {
        final response = await widget._auth.authenticateWithEmail(RpRequest(
          email: _emailController.text,
        ));

        print(response);

        if (response != null) {
          UserEntity user = UserEntity(id: "", email: _emailController.text);

          context.read<AuthBloc>().add(LoginEvent(userEntity: user));
          setState(() {
            _pageMode = PageMode.loggedIn;
          });
        }
      } else {
        setState(() {
          _pageMode = PageMode.login;
        });
      }
    } catch (e) {
      showPlatformDialog(
        context: context,
        builder: (context) => PlatformAlertDialog(
          title: const Text('Error'),
          content: Text(e.toString()),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }
}
