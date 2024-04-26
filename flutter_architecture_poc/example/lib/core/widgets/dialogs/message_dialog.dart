import 'package:example/core/widgets/dialogs/dialog_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

DialogPage<void> showMessageDialog(BuildContext context, String message) =>
    DialogPage<void>(
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () => context.pop(),
          )
        ],
      ),
    );
