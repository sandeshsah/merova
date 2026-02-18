
import 'package:flutter/material.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/core/themes/app_text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final String hint;
  final bool isPassword;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLength;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChange;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.keyboardType,
    this.isPassword = false,
    this.validator,
    this.onChange,
    this.prefixIcon,
    this.prefix,
    this.suffix,
    this.maxLength,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: AppTextStyles.label),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPassword ? _obscure : false,
          cursorColor: AppColors.black,
          maxLength: widget.maxLength,
          validator: widget.validator,
          onChanged: widget.onChange,
          decoration: InputDecoration(
            hintText: widget.hint,
            counterText: "",
            filled: true,
            fillColor: AppColors.white,
            prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon, color: Colors.black) : null,
            prefix: widget.prefix,
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility, color: AppColors.black),
              onPressed: () => setState(() => _obscure = !_obscure),
            )
                : widget.suffix,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.black),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.black),
            ),
          ),
        ),
      ],
    );
  }
}
