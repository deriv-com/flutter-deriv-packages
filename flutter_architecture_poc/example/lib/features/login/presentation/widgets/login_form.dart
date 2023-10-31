import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({required this.onLoginPressed, super.key});

  final void Function(String token) onLoginPressed;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // I knew this token is hardcoded, but since this will be invalidate in each qa machine rebuild it's not a problem. :)
  final TextEditingController _controller =
      TextEditingController(text: 'hdtJoHxLuCVhGpp');

  String? _errorText;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'API Token',
              errorText: _errorText,
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(child: const Text('Login'), onPressed: _validateInput)
        ],
      );

  void _validateInput() {
    if (_controller.value.text.isEmpty) {
      setState(() => _errorText = 'Please enter a token.');

      return;
    }

    widget.onLoginPressed(_controller.value.text);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}
