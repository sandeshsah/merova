import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinOtpInput extends StatelessWidget {
  final void Function(String)? onCompleted;

  const PinOtpInput({super.key, this.onCompleted});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      onCompleted: onCompleted,
    );
  }
}
