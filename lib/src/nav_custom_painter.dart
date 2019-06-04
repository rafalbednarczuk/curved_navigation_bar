import 'package:flutter/material.dart';

class NavCustomPainter extends CustomPainter {
  double loc;
  double s;
  Color color;
  TextDirection textDirection;
  final double shadow;

  NavCustomPainter(double startingLoc, int itemsLength, this.color,
      this.textDirection, this.shadow) {
    final span = 1.0 / itemsLength;
    s = 0.2;
    double l = startingLoc + (span - s) / 2;
    loc = textDirection == TextDirection.rtl ? 0.8 - l : l;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo((loc - 0.1) * size.width, 0)
      ..cubicTo(
        (loc + s * 0.20) * size.width,
        size.height * 0.05,
        loc * size.width,
        size.height * 0.60,
        (loc + s * 0.50) * size.width,
        size.height * 0.60,
      )..cubicTo(
        (loc + s) * size.width,
        size.height * 0.60,
        (loc + s - s * 0.20) * size.width,
        size.height * 0.05,
        (loc + s + 0.1) * size.width,
        0,
      )
      ..lineTo(size.width, 0)..lineTo(size.width, size.height)..lineTo(
          0, size.height)
      ..close();

    if (shadow != null) {
      final shadowPaint = Paint()
        ..color = Color(0x55000000)
        ..maskFilter = MaskFilter.blur(BlurStyle.outer, shadow);

      assert(() {
        if (debugDisableShadows)
          shadowPaint.maskFilter = null;
        return true;
      }());
      canvas.drawPath(path, shadowPaint);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
