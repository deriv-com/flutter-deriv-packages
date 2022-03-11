// ignore_for_file: avoid_setters_without_getters

part of 'shimmer.dart';

/// Shimmer Filter render object this render object will mimic the previous
/// object with new values as the animation proceeds.
class _ShimmerFilter extends RenderProxyBox {
  _ShimmerFilter(this._percent, this._direction, this._gradient);

  ShimmerDirection _direction;
  Gradient _gradient;
  double _percent;

  @override
  ShaderMaskLayer? get layer => super.layer as ShaderMaskLayer?;

  @override
  bool get alwaysNeedsCompositing => child != null;

  /// Sets the new animation process state.
  set percent(double value) {
    if (value == _percent) {
      return;
    }

    _percent = value;

    markNeedsPaint();
  }

  /// Sets the new animation gradient.
  set gradient(Gradient value) {
    if (value == _gradient) {
      return;
    }

    _gradient = value;

    markNeedsPaint();
  }

  /// Sets the new animation direction.
  set direction(ShimmerDirection direction) {
    if (direction == _direction) {
      return;
    }

    _direction = direction;

    markNeedsLayout();
  }

  /// Paints the glowing effect based on its properties and the animation state.
  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) {
      layer = null;
    }

    assert(needsCompositing);

    final double width = child!.size.width;
    final double height = child!.size.height;

    Rect rect;
    double dx, dy;

    switch (_direction) {
      case ShimmerDirection.rtl:
        dx = _offset(width, -width, _percent);
        dy = 0.0;
        rect = Rect.fromLTWH(dx - width, dy, 3 * width, height);

        break;
      case ShimmerDirection.ttb:
        dx = 0.0;
        dy = _offset(-height, height, _percent);
        rect = Rect.fromLTWH(dx, dy - height, width, 3 * height);

        break;
      case ShimmerDirection.btt:
        dx = 0.0;
        dy = _offset(height, -height, _percent);
        rect = Rect.fromLTWH(dx, dy - height, width, 3 * height);

        break;

      default:
        dx = _offset(-width, width, _percent);
        dy = 0.0;
        rect = Rect.fromLTWH(dx - width, dy, 3 * width, height);
    }

    layer ??= ShaderMaskLayer();
    layer!
      ..shader = _gradient.createShader(rect)
      ..maskRect = offset & size
      ..blendMode = BlendMode.srcIn;

    context.pushLayer(layer!, super.paint, offset);
  }

  /// Computes the offset of the effect based on the size of the widget and the
  /// animation state.
  double _offset(double start, double end, double percent) =>
      start + (end - start) * percent;
}
