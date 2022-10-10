import 'dart:io';

import 'package:flutter/material.dart';

const s = 0.2;

class NavCustomPainter extends CustomPainter {
  late double loc;
  late double bottom;
  Color color;
  bool hasLabel;
  TextDirection textDirection;

  NavCustomPainter({
    required double startingLoc,
    required int itemsLength,
    required this.color,
    required this.textDirection,
    this.hasLabel = false,
  }) {
    final span = 1.0 / itemsLength;
    final l = startingLoc + (span - s) / 2;
    loc = textDirection == TextDirection.rtl ? 0.8 - l : l;
    bottom = hasLabel
        ? (Platform.isAndroid ? 0.55 : 0.45)
        : (Platform.isAndroid ? 0.6 : 0.5);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * (loc - 0.05), 0)
      ..cubicTo(
        size.width * (loc + s * 0.2), // topX
        size.height * 0.05, // topY
        size.width * loc, // bottomX
        size.height * bottom, // bottomY
        size.width * (loc + s * 0.5), // centerX
        size.height * bottom, // centerY
      )
      ..cubicTo(
        size.width * (loc + s), // bottomX
        size.height * bottom, // bottomY
        size.width * (loc + s * 0.8), // topX
        size.height * 0.05, // topY
        size.width * (loc + s + 0.05),
        0,
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
