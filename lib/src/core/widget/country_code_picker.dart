import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class CountryCodePicker extends StatelessWidget {
  final void Function(Country) onSelect;

  const CountryCodePicker({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text("Select Country"),
      onPressed: () {
        showCountryPicker(
          context: context,
          onSelect: onSelect,
        );
      },
    );
  }
}
