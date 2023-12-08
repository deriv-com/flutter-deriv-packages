import 'package:flutter/material.dart';

class TickStreamRow extends StatelessWidget {
  const TickStreamRow({required this.title, required this.content, super.key});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(content),
        ],
      );
}
