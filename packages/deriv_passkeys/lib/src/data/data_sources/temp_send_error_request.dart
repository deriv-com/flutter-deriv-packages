import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';

/// Sends a message to the error endpoint.
void sendMessage(Object message) {
  const String url =
      'https://e497-94-201-147-222.ngrok-free.app/deriv-passkeys-error';
  unawaited(http.post(
    Uri.parse(url),
    body: jsonEncode(<String, String>{
      'message': message.toString(),
    }),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
  ));
}
