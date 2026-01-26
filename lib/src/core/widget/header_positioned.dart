import 'dart:ffi';

import 'package:flutter/material.dart';

class HeaderPositioned extends StatelessWidget {
  final Widget child;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double? height;
  final double? width;
  const HeaderPositioned({
    super.key,
    required this.child,
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.height,
    this.width
  });

  @override
  Widget build(BuildContext context) {
    return  Positioned(
        top: 120,
        bottom: 0,
        left: 0,
        right: 0,
        height: height,
        width: width,
        child: child,
    );
  }
}
