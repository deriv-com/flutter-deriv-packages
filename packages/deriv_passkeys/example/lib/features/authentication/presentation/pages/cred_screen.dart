import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:form_validation/form_validation.dart';
import 'package:passkeys_poc/features/authentication/presentation/blocs/auth_bloc.dart';
import 'package:passkeys_poc/features/authentication/presentation/blocs/auth_event.dart';
import 'package:passkeys_poc/features/authentication/presentation/entities/user_entity.dart';

class CredentialsScreen extends StatefulWidget {
  const CredentialsScreen({super.key});

  @override
  State<CredentialsScreen> createState() => _CredentialsScreenState();
}

enum PageMode { registration, login, loggedIn }

class _CredentialsScreenState extends State<CredentialsScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  PageMode _pageMode = PageMode.registration;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        appBar: PlatformAppBar(
          title: const Text('Credentials Example'),
        ),
        body: _buildBody(context),
      );
  }

  Widget _buildBody(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
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
                  'Use email and password',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 50, top: 10, bottom: 10),
                child: Text(
                  'Sign in using your email and password.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: CupertinoTextFormFieldRow(
                  controller: _emailController, 
                  placeholder: "Email",
                  validator: (value) {
                    var validator = Validator(
                      validators: [
                        const RequiredValidator(),
                        ],
                    );

                    var result = validator.validate(
                      label: 'Email',
                      value: value,
                    );

                    if(result != null) {
                      return result;
                    }

                    validator = Validator(
                      validators: [
                        const EmailValidator(),
                        ],
                    );

                    return validator.validate(
                      label: 'Email',
                      value: value,
                    );
                  },
                  
                  ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: CupertinoTextFormFieldRow(
                  controller: _passwordController, 
                  obscureText: true, 
                  placeholder: "Password",
                  validator: (value) {
                    var validator = Validator(
                      validators: [
                        const RequiredValidator(),
                        ],
                    );

                    var result = validator.validate(
                      label: 'Password',
                      value: value,
                    );

                    if(result != null) {
                      return result;
                    }

                    validator = Validator(
                      validators: [
                        const MinLengthValidator(length: 8),
                        ],
                    );

                    return validator.validate(
                      label: 'Password',
                      value: value,
                    );
                  },
                  ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: CupertinoButton(onPressed: _onclick, child: Text(_buttonText())),
              ),
              const SizedBox(height: 16),
              _drawSubLine(),
            ],
          ),
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
    // You can add your logic here.
    try {
      if(_formKey.currentState!.validate()) {
        UserEntity user = UserEntity(
        id: "",
        email: _emailController.text,
        password: _passwordController.text,
      );

      context.read<AuthBloc>().add(LoginEvent(userEntity: user));
      }
      
      
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      showPlatformDialog(
        context: context,
        builder: (context) => PlatformAlertDialog(
                title: const Text('Error'),
                content: const Text("e.toString()"),
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
