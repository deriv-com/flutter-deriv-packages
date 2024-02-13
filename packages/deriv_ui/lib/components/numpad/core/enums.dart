

/// Indicates the number of inputs in the NumberPad widget, 
/// between one or two inputs.
enum NumberPadWidgetType {
  /// Has one input with a title at the top of the view.
  singleInput,

  /// Has two inputs with a title at the top of each input.
  doubleInput,
}

/// Indicates which input field should be focused when 
/// [NumberPadWidgetType] is double input.
enum NumberPadInputFocus {
  /// Focuses on the first input field.
  firstInputField,

  /// Focuses on the second input field.
  secondInputField,
}

/// Indicates how NumberPad widget is closed
enum NumberPadCloseType {
  /// When the user clicked on the OK button to close numberPad widget
  pressOK,

  /// when the user clicked anywhere outside the widget 
  /// to dismiss the NumberPad widget
  clickOutsideView,
}
