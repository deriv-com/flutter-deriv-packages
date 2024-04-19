// final String url =
//           'https://e497-94-201-147-222.ngrok-free.app/deriv-passkeys-error';
//       final http.Response response = await http.post(
//         Uri.parse(url),
//         body: jsonEncode(<String, String>{
//           'error': e.toString(),
//         }),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//         },
//       );

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> sendError(Object error) async {
  final String url =
      'https://e497-94-201-147-222.ngrok-free.app/deriv-passkeys-error';
  final http.Response response = await http.post(
    Uri.parse(url),
    body: jsonEncode(<String, String>{
      'error': error.toString(),
    }),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
  );
}
