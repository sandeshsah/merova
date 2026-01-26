import 'package:flutter/material.dart';

class CustomDropdownField<T> extends StatelessWidget {
  final List<T> items;
  final T? value;
  final void Function(T?) onChanged;

  const CustomDropdownField({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items
          .map((e) => DropdownMenuItem<T>(
        value: e,
        child: Text(e.toString()),
      ))
          .toList(),
      onChanged: onChanged,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }
}
