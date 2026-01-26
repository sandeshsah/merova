import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  final String message;

  const SuccessDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Success"),
      content: Text(message),
      icon: const Icon(Icons.check_circle, color: Colors.green),
    );
  }
}
