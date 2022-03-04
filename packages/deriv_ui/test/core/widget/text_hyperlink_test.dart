import 'package:deriv_ui/core/widgets/text_hyperlink.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const String _label = 'label';
  const String _url = 'url';
  group('Custom chip test', () {
    testWidgets('should show label', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
            home: TextHyperlink(
          url: _url,
          label: _label,
          containerMargin: 10,
          openWebPage: (BuildContext context, String url) {},
        )),
      );

      await tester.pumpAndSettle();

      expect(find.byType(TextHyperlink), findsOneWidget);
      expect(find.textContaining(_label), findsOneWidget);
    });
  });
}

class _TestApp extends StatelessWidget {
  const _TestApp(this.label, this.url, this.containerMargin, this.openWebPage);

  final String label;
  final String url;
  final double containerMargin;
  final Function(BuildContext, String) openWebPage;

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: TextHyperlink(
          label: label,
          containerMargin: containerMargin,
          url: url,
          openWebPage: (BuildContext context, String url) {},
        ),
      );
}
