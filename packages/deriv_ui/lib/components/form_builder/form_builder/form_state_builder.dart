part of 'form_builder.dart';

/// This widget will find the closest [FormBuilder] in the widget tree and
/// return the corresponding [FormBuilderController] in the builder callback.
class FormStateBuilder extends StatelessWidget {
  /// Constructs a new FormStateBuilder.
  const FormStateBuilder({
    required this.builder,
  });

  /// The builder function that will be called when there is a change in the
  /// form.
  final Widget Function(BuildContext, FormBuilderController) builder;

  @override
  Widget build(BuildContext context) {
    final FormBuilderController? controller = FormBuilderController.of(context);

    if (controller == null) {
      throw FlutterError(
        'FormBuilder: FormBuilderController is not found. Make sure you have '
        'a FormBuilder widget as a parent of your widget and has been provided'
        'with a valid FormBuilderController.',
      );
    }

    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) => builder(context, controller),
    );
  }
}
