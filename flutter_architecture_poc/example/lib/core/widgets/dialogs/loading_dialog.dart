import 'package:example/core/widgets/dialogs/dialog_page.dart';
import 'package:flutter/material.dart';

DialogPage<void> showLoadingDialog(BuildContext context, [String? message]) =>
    DialogPage<void>(
      barrierDismissible: false,
      builder: (BuildContext context) => Material(
        color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).dialogBackgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const CircularProgressIndicator(),
                  if (message != null)
                    Column(
                      children: <Widget>[
                        const SizedBox(height: 32),
                        Text(
                          message,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
