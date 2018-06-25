import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

class MUnderlineTabIndicator extends Decoration {
  MUnderlineTabIndicator({
    this.borderSide: const BorderSide(width: 2.0, color: Colors.white),
    this.insets: EdgeInsets.zero,
  })  : assert(borderSide != null),
        assert(insets != null);

  final BorderSide borderSide;

  final EdgeInsetsGeometry insets;

  @override
  Decoration lerpFrom(Decoration a, double t) {
    if (a is MUnderlineTabIndicator) {
      return MUnderlineTabIndicator(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        insets: EdgeInsetsGeometry.lerp(a.insets, insets, t),
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  Decoration lerpTo(Decoration b, double t) {
    if (b is MUnderlineTabIndicator) {
      return MUnderlineTabIndicator(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        insets: EdgeInsetsGeometry.lerp(insets, b.insets, t),
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  _UnderlinePainter createBoxPainter([VoidCallback onChanged]) {
    return _UnderlinePainter(this, onChanged);
  }
}

class _UnderlinePainter extends BoxPainter {
  _UnderlinePainter(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  final MUnderlineTabIndicator decoration;

  BorderSide get borderSide => decoration.borderSide;

  EdgeInsetsGeometry get insets => decoration.insets;

  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    assert(rect != null);
    assert(textDirection != null);
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);
    return Rect.fromLTWH(
      indicator.left,
      indicator.bottom - borderSide.width,
      indicator.width,
      borderSide.width,
    );
  }

  Rect _indicatorLeftRectFor(Rect rect, TextDirection textDirection) {
    assert(rect != null);
    assert(textDirection != null);
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);
    return Rect.fromCircle(
      center: Offset(indicator.left + borderSide.width / 2, indicator.bottom),
      radius: borderSide.width * 1.5,
    );
  }

  Rect _indicatorRightRectFor(Rect rect, TextDirection textDirection) {
    assert(rect != null);
    assert(textDirection != null);
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);
    return Rect.fromCircle(
      center: Offset(indicator.right - borderSide.width / 2, indicator.bottom),
      radius: borderSide.width * 1.5,
    );
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size;
    final TextDirection textDirection = configuration.textDirection;
    final Rect indicator =
        _indicatorRectFor(rect, textDirection).deflate(borderSide.width / 2.0);
    final Rect rectLeft = _indicatorLeftRectFor(rect, textDirection)
        .deflate(borderSide.width / 2.0);
    final Rect rectRight = _indicatorRightRectFor(rect, textDirection)
        .deflate(borderSide.width / 2.0);
    final Paint paint = borderSide.toPaint();
    paint.style = (PaintingStyle.fill);
    canvas.drawArc(rectLeft, -pi, pi, true, paint);
    canvas.drawArc(rectRight, -pi, pi, true, paint);
    final Paint paint2 = borderSide.toPaint();
    canvas.drawLine(indicator.bottomLeft, indicator.bottomRight, paint2);
  }
}
