import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:deriv_passkeys/src/presentation/widgets/icon_text_row_widget.dart';

void main() {
  testWidgets('IconTextRowWidget displays icon and text correctly',
      (WidgetTester tester) async {
    const String assetName = 'assets/svg/passkey_icon.svg';
    const String text = 'Sample Text';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: IconTextRowWidget(
            assetName: assetName,
            text: text,
          ),
        ),
      ),
    );

    final Finder svgFinder = find.byType(SvgPicture);
    final Finder textFinder = find.text(text);

    expect(svgFinder, findsOneWidget);
    expect(textFinder, findsOneWidget);

    final SvgPicture svgWidget = tester.widget(svgFinder) as SvgPicture;
    final Text textWidget = tester.widget(textFinder) as Text;

    expect((svgWidget.bytesLoader as SvgAssetLoader).packageName,
        'deriv_passkeys');
    expect((svgWidget.bytesLoader as SvgAssetLoader).assetName, assetName);
    expect(textWidget.data, text);
  });
}
