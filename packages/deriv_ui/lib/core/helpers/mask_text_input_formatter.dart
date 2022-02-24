import 'dart:math';

import 'package:flutter/services.dart';

/// Class that creates the mask formatter for TextField
class MaskTextInputFormatter implements TextInputFormatter {
  ///
  /// The keys of the [filter] assign which character in the mask should be replaced and the values validate the entered character
  /// By default `#` match to the number and `A` to the letter
  MaskTextInputFormatter({
    String? mask,
    Map<String, RegExp>? filter,
    String? initialText,
  }) {
    updateMask(
      mask: mask,
      filter: filter ??
          <String, RegExp>{
            '#': RegExp(r'[0-9]'),
            'A': RegExp(r'[^0-9]'),
          },
    );

    if (initialText != null) {
      formatEditUpdate(
        const TextEditingValue(),
        TextEditingValue(text: initialText),
      );
    }
  }

  String? _mask;
  List<String> _maskChars = <String>[];
  Map<String, RegExp>? _maskFilter;

  int _maskLength = 0;
  final _TextMatcher _resultTextArray = _TextMatcher();
  String _resultTextMasked = '';

  TextEditingValue? _lastResValue;
  TextEditingValue? _lastNewValue;

  /// Change the mask
  TextEditingValue updateMask({
    String? mask,
    Map<String, RegExp>? filter,
  }) {
    _mask = mask;

    if (filter != null) {
      _updateFilter(filter);
    }

    _calcMaskLength();

    final String unmaskedText = getUnmaskedText();

    clear();

    return formatEditUpdate(
      const TextEditingValue(),
      TextEditingValue(
        text: unmaskedText,
        selection: TextSelection.collapsed(
          offset: unmaskedText.length,
        ),
      ),
    );
  }

  /// Get current mask
  String? getMask() => _mask;

  /// Get masked text, e.g. "+0 (123) 456-78-90"
  String getMaskedText() => _resultTextMasked;

  /// Get unmasked text, e.g. "01234567890"
  String getUnmaskedText() => _resultTextArray.toString();

  /// Check if target mask is filled
  bool isFill() => _resultTextArray.length == _maskLength;

  /// Clear masked text of the formatter
  /// Note: you need to call this method if you clear the text of the TextField because it doesn't call the formatter when it has empty text
  void clear() {
    _resultTextMasked = '';
    _resultTextArray.clear();
    _lastResValue = null;
    _lastNewValue = null;
  }

  /// Mask some text
  String maskText(String text) => MaskTextInputFormatter(
        mask: _mask,
        filter: _maskFilter,
        initialText: text,
      ).getMaskedText();

  /// Unmask some text
  String unmaskText(String text) => MaskTextInputFormatter(
          mask: _mask, filter: _maskFilter, initialText: text)
      .getUnmaskedText();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (_lastResValue == oldValue && newValue == _lastNewValue) {
      return oldValue;
    }
    if (oldValue.text.isEmpty) {
      _resultTextArray.clear();
    }
    _lastNewValue = newValue;
    return _lastResValue = _format(oldValue, newValue);
  }

  TextEditingValue _format(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final String? mask = _mask;

    if (mask == null || mask.isEmpty == true) {
      _resultTextMasked = newValue.text;
      _resultTextArray.set(newValue.text);
      return newValue;
    }

    final String beforeText = oldValue.text;
    final String afterText = newValue.text;

    final TextSelection beforeSelection = oldValue.selection;
    final TextSelection afterSelection = newValue.selection;

    final int beforeSelectionStart = afterSelection.isValid
        ? beforeSelection.isValid
            ? beforeSelection.start
            : 0
        : 0;
    final int beforeSelectionLength = afterSelection.isValid
        ? beforeSelection.isValid
            ? beforeSelection.end - beforeSelection.start
            : 0
        : oldValue.text.length;

    final int lengthDifference =
        afterText.length - (beforeText.length - beforeSelectionLength);
    final int lengthRemoved =
        lengthDifference.isNegative ? lengthDifference.abs() : 0;
    final int lengthAdded = lengthDifference > 0 ? lengthDifference : 0;

    final int afterChangeStart = max(0, beforeSelectionStart - lengthRemoved);
    final int afterChangeEnd = max(0, afterChangeStart + lengthAdded);

    final int beforeReplaceStart = max(0, beforeSelectionStart - lengthRemoved);
    final int beforeReplaceLength = beforeSelectionLength + lengthRemoved;

    final int beforeResultTextLength = _resultTextArray.length;

    int currentResultTextLength = _resultTextArray.length;
    int currentResultSelectionStart = 0;
    int currentResultSelectionLength = 0;

    for (int i = 0;
        i < min(beforeReplaceStart + beforeReplaceLength, mask.length);
        i++) {
      if (_maskChars.contains(mask[i]) && currentResultTextLength > 0) {
        currentResultTextLength -= 1;
        if (i < beforeReplaceStart) {
          currentResultSelectionStart += 1;
        }
        if (i >= beforeReplaceStart) {
          currentResultSelectionLength += 1;
        }
      }
    }

    final String replacementText =
        afterText.substring(afterChangeStart, afterChangeEnd);
    int targetCursorPosition = currentResultSelectionStart;
    if (replacementText.isEmpty) {
      _resultTextArray.removeRange(currentResultSelectionStart,
          currentResultSelectionStart + currentResultSelectionLength);
    } else {
      if (currentResultSelectionLength > 0) {
        _resultTextArray.removeRange(currentResultSelectionStart,
            currentResultSelectionStart + currentResultSelectionLength);
      }
      _resultTextArray.insert(currentResultSelectionStart, replacementText);
      targetCursorPosition += replacementText.length;
    }

    if (beforeResultTextLength == 0 && _resultTextArray.length > 1) {
      for (int i = 0; i < mask.length; i++) {
        if (_maskChars.contains(mask[i]) || _resultTextArray.isEmpty) {
          break;
        } else if (mask[i] == _resultTextArray[0]) {
          _resultTextArray.removeAt(0);
        }
      }
    }

    int curTextPos = 0;
    int maskPos = 0;
    _resultTextMasked = '';
    int cursorPos = -1;
    int nonMaskedCount = 0;

    while (maskPos < mask.length) {
      final String curMaskChar = mask[maskPos];
      final bool isMaskChar = _maskChars.contains(curMaskChar);

      bool curTextInRange = curTextPos < _resultTextArray.length;

      String? curTextChar;
      if (isMaskChar && curTextInRange) {
        while (curTextChar == null && curTextInRange) {
          final String potentialTextChar = _resultTextArray[curTextPos];

          if (_maskFilter != null &&
              _maskFilter?[curMaskChar]?.hasMatch(potentialTextChar) == true) {
            curTextChar = potentialTextChar;
          } else {
            _resultTextArray.removeAt(curTextPos);
            curTextInRange = curTextPos < _resultTextArray.length;
            if (curTextPos <= targetCursorPosition) {
              targetCursorPosition -= 1;
            }
          }
        }
      }

      if (isMaskChar && curTextInRange && curTextChar != null) {
        _resultTextMasked += curTextChar;

        if (curTextPos == targetCursorPosition && cursorPos == -1) {
          cursorPos = maskPos - nonMaskedCount;
        }

        nonMaskedCount = 0;
        curTextPos += 1;
      } else {
        if (curTextPos == targetCursorPosition &&
            cursorPos == -1 &&
            !curTextInRange) {
          cursorPos = maskPos;
        }

        if (!curTextInRange) {
          break;
        } else {
          _resultTextMasked += mask[maskPos];
        }

        nonMaskedCount++;
      }

      maskPos += 1;
    }

    if (nonMaskedCount > 0) {
      _resultTextMasked = _resultTextMasked.substring(
          0, _resultTextMasked.length - nonMaskedCount);
      cursorPos -= nonMaskedCount;
    }

    if (_resultTextArray.length > _maskLength) {
      _resultTextArray.removeRange(_maskLength, _resultTextArray.length);
    }

    final int finalCursorPosition =
        cursorPos.isNegative ? _resultTextMasked.length : cursorPos;

    return TextEditingValue(
        text: _resultTextMasked,
        selection: TextSelection(
            baseOffset: finalCursorPosition,
            extentOffset: finalCursorPosition,
            affinity: newValue.selection.affinity,
            isDirectional: newValue.selection.isDirectional));
  }

  void _calcMaskLength() {
    final String? mask = _mask;

    if (mask == null) {
      return;
    }
    _maskLength = 0;

    for (int i = 0; i < mask.length; i++) {
      if (_maskChars.contains(mask[i])) {
        _maskLength++;
      }
    }
  }

  void _updateFilter(Map<String, RegExp> filter) {
    _maskFilter = filter;
    _maskChars = _maskFilter?.keys.toList(growable: false) ?? <String>[];
  }
}

class _TextMatcher {
  final List<String> _symbolArray = <String>[];

  int get length =>
      _symbolArray.fold(0, (int prev, String match) => prev + match.length);

  void removeRange(int start, int end) => _symbolArray.removeRange(start, end);

  void insert(int start, String substring) {
    for (int i = 0; i < substring.length; i++) {
      _symbolArray.insert(start + i, substring[i]);
    }
  }

  bool get isEmpty => _symbolArray.isEmpty;

  void removeAt(int index) => _symbolArray.removeAt(index);

  String operator [](int index) => _symbolArray[index];

  void clear() => _symbolArray.clear();

  @override
  String toString() => _symbolArray.join();

  void set(String text) {
    _symbolArray.clear();
    for (int i = 0; i < text.length; i++) {
      _symbolArray.add(text[i]);
    }
  }
}
