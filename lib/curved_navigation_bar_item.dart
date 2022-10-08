import 'package:flutter/material.dart';

class CurvedNavigationBarItem {
  final Widget child;
  final String? label;
  final TextStyle? labelStyle;

  const CurvedNavigationBarItem({
    required this.child,
    this.label,
    this.labelStyle,
  });
}
