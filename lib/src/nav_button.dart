import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final double position;
  final int length;
  final int index;
  final ValueChanged<int> onTap;
  final Widget child;
  final String? label;
  final TextStyle? activeLabelStyle;
  final TextStyle? inActiveLabelStyle;
  final bool? showActiveLabel;
  final bool? showInactiveLabel;

  NavButton({
    required this.onTap,
    required this.position,
    required this.length,
    required this.index,
    required this.child,
    this.label,
    this.activeLabelStyle,
    this.inActiveLabelStyle,
    this.showActiveLabel,
    this.showInactiveLabel,
  });

  @override
  Widget build(BuildContext context) {
    final desiredPosition = 1.0 / length * index;
    final difference = (position - desiredPosition).abs();
    final verticalAlignment = 1 - length * difference;
    final opacity = length * difference;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          onTap(index);
        },
        child: Stack(
          children: [
            Container(
              height: 75.0,
              child: Transform.translate(
                offset: Offset(
                    0, difference < 1.0 / length ? verticalAlignment * 40 : 0),
                child: Opacity(
                    opacity: difference < 1.0 / length * 0.99 ? opacity : 1.0,
                    child: child),
              ),
            ),
            if (label != null && difference == 0 && showActiveLabel == true)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    label!,
                    style: activeLabelStyle ??
                        TextStyle(
                          color: Colors.blueAccent,
                        ),
                  ),
                ),
              ),
            if (label != null && difference != 0 && showInactiveLabel == true)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    label!,
                    style: inActiveLabelStyle,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
