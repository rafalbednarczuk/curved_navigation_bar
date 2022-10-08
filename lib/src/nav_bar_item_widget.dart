import 'package:flutter/material.dart';

class NavBarItemWidget extends StatelessWidget {
  final double position;
  final int length;
  final int index;
  final ValueChanged<int> onTap;
  final Widget child;
  final String? label;
  final TextStyle? labelStyle;

  NavBarItemWidget({
    required this.onTap,
    required this.position,
    required this.length,
    required this.index,
    required this.child,
    this.label,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => onTap(index),
        child: _buildItem(),
      ),
    );
  }

  Widget _buildItem() {
    final desiredPosition = 1.0 / length * index;
    final difference = (position - desiredPosition).abs();
    final verticalAlignment = 1 - length * difference;
    final opacity = length * difference;
    if (label == null) {
      return Container(
        height: 75.0,
        child: Transform.translate(
          offset: Offset(
            0,
            difference < 1.0 / length ? verticalAlignment * 40 : 0,
          ),
          child: Opacity(
            opacity: difference < 1.0 / length * 0.99 ? opacity : 1.0,
            child: child,
          ),
        ),
      );
    }
    return Column(
      children: [
        Container(
          height: 50.0,
          child: Transform.translate(
            offset: Offset(
              0,
              difference < 1.0 / length ? verticalAlignment * 40 : 0,
            ),
            child: Opacity(
              opacity: difference < 1.0 / length * 0.99 ? opacity : 1.0,
              child: child,
            ),
          ),
        ),
        Text(
          label ?? '',
          style: labelStyle,
        ),
      ],
    );
  }
}
