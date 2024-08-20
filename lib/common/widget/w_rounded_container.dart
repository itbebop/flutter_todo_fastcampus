import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? color;
  final double radiusValue;
  final BorderRadiusGeometry? radius; // 일부만 radius 적용할 수 있는 옵션

  const RoundedContainer({
    required this.child,
    this.padding,
    this.margin,
    this.color,
    this.radiusValue = 10,
    this.radius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: radius ?? BorderRadius.circular(radiusValue),
      ),
      child: child,
    );
  }
}
