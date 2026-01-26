import 'package:flutter/material.dart';

class OTPInputField extends StatelessWidget {
  final int length;
  const OTPInputField({super.key, this.length = 4});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: length,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
        counterText: "",
        border: OutlineInputBorder(),
      ),
    );
  }
}
