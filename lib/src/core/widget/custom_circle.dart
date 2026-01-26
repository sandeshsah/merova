import 'package:flutter/material.dart';

class CustomCircle extends StatelessWidget {
  final double size;
  final Color color;

  const CustomCircle({
    super.key,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
