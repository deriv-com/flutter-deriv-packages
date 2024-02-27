import 'package:flutter/widgets.dart';

class WidgetbookGroup extends StatelessWidget {
  const WidgetbookGroup({
    required this.label,
    required this.children,
    super.key,
  });

  final String label;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(label),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            ),
          ],
        ),
      );
}
