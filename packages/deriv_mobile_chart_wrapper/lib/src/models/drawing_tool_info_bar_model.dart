/// Data class for holding info bar information.
class DrawingToolInfoBarModel {
  DrawingToolInfoBarModel({
    required this.step,
    required this.totalSteps,
    required this.title,
  });

  final String step;
  final int totalSteps;
  final String title;
}
