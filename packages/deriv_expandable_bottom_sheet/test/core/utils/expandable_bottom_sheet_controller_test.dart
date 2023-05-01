import 'package:deriv_expandable_bottom_sheet/deriv_expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
  });

  group('ExpandableBottomSheetController', () {
    late ExpandableBottomSheetController controller;

    setUp(() {
      controller = ExpandableBottomSheetController(
        animationController: AnimationController(
          vsync: const TestVSync(),
          duration: const Duration(milliseconds: 300),
        ),
      )..init();
    });

    tearDown(() {
      controller.dispose();
    });

    test('initial values', () {
      expect(controller.isLowerContentGestureEnabled, isTrue);
      expect(controller.isHintOpen, isFalse);
      expect(controller.height, 0);
      expect(controller.isOpen, isFalse);
      expect(controller.lowerBound, 0);
    });

    test('open/close bottom sheet', () {
      controller.changeLowerBound(100);
      expect(controller.lowerBound, 100);

      // Open bottom sheet
      controller.height = 150;
      expect(controller.isOpen, isTrue);

      // Close bottom sheet
      controller.close();
      expect(controller.isOpen, isFalse);
    });

    test('hint visibility', () {
      expect(controller.isHintOpen, isFalse);

      // Open hint
      controller.isHintOpen = true;
      expect(controller.isHintOpen, isTrue);

      // Close hint
      controller.isHintOpen = false;
      expect(controller.isHintOpen, isFalse);
    });

    test('height stream', () async {
      final List<double> expectedHeights = <double>[100, 150, 200];
      final List<double> actualHeights = <double>[];
      controller.heightStream.listen((double height) {
        actualHeights.add(height);
      });
      for (final double element in expectedHeights) {
        controller.height = element;
      }

      await Future<void>.delayed(const Duration());

      expect(actualHeights, expectedHeights);
    });

  });
}
