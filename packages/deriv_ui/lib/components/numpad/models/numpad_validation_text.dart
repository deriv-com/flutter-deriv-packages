import 'package:flutter/material.dart';

/// This class will hold UI information that numpad needs to know 
/// from client code.
class NumpadValidationText {
  /// It creates a [NumpadValidationText] instance.
  NumpadValidationText({
    this.text,
    this.enableActionButton = true,
  });

  /// Text to display in Numpad label.
  final RichText? text;

  /// This flag will check to enable action button or not.
  final bool enableActionButton;
}
