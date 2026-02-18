import 'package:auto_route/annotations.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:merova/src/core/extension/context_extensions.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/core/themes/app_text_styles.dart';
import 'package:merova/src/core/themes/dimensions.dart';
import 'package:merova/src/core/widget/custom_button.dart';
import 'package:merova/src/core/widget/custom_text_form_field.dart';
import 'package:merova/src/core/widget/header_positioned.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'otp_page.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();

}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController uidController = TextEditingController();

  bool isLoading = false;
  bool isEmailSelected = true;

  String _countryCode = "+977";
  String _countryFlag = "🇳🇵";

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      setState(() => isLoading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(isEmailSelected
              ? "Reset link sent to your email"
              : "OTP sent to your phone"),
        ),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => OtpPage(
            flow: "forgotPassword",
          //   emailOrPhone: isEmailSelected
          //       ? emailController.text.trim()
          //       : phoneController.text.trim(),
           ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    return AppBarBackground(
      title: tr.forgotPassword,
      body: Stack(
        children: [
          BodyPositioned(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                padding: Dimensions.paddingDefault,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      const Text(
                        "Recover your account",
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      // Toggle buttons
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            _toggleButton("Email", true),
                            _toggleButton("Phone", false),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      //if (isEmailSelected) _emailField() else _phoneField(),
                      _buildUidField(context),
                      const SizedBox(height: 24),
                      CustomButton(title: "Continue", isLoading: isLoading, onTap: _submit),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _toggleButton(String text, bool email) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => isEmailSelected = email),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isEmailSelected == email ? AppColors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: isEmailSelected == email
                ? Border.all(color: Colors.grey.shade400, width: 3)
                : null,
          ),
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget _buildUidField(BuildContext context) {
    final tr = context.tr;

    return CustomTextFormField(
      label: isEmailSelected ? tr.email : tr.phone,
      hint: isEmailSelected ? "example@gmail.com" : "98XXXXXXXX",
      controller: uidController,
      keyboardType:
      isEmailSelected ? TextInputType.emailAddress : TextInputType.phone,
      maxLength: isEmailSelected ? null : 10,
      prefixWidget: isEmailSelected
          ? null
          : GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          showCountryPicker(
            context: context,
            showPhoneCode: true,
            onSelect: (country) {
              setState(() {
                _countryCode = '+${country.phoneCode}';
                _countryFlag = country.flagEmoji;
              });
            },
          );
        },
        child: Padding(
          padding: Dimensions.textFormField,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _countryFlag,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 6),
              Text(
                _countryCode,
                style: AppTextStyles.label,
              ),
              const SizedBox(width: 4),
              const Icon(Icons.arrow_drop_down),

            ],
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return isEmailSelected ? "Email required" : "Phone number required";
        }

        if (isEmailSelected && !RegExp(r'.+@.+\..+').hasMatch(value)) {
          return "Enter a valid email";
        }

        if (!isEmailSelected && value.length != 10) {
          return "Must be 10 digits";
        }

        return null;
      },
    );
  }

  Widget countryCode() {
    return GestureDetector(
      onTap: () {
        showCountryPicker(
          context: context,
          showPhoneCode: true,
          onSelect: (country) {
            setState(() {
              _countryCode = '+${country.phoneCode}';
              _countryFlag = country.flagEmoji;
            });
          },
        );
      },
      child: Text(
        "$_countryFlag $_countryCode",
        style: AppTextStyles.label,
      ),
    );
  }
}
