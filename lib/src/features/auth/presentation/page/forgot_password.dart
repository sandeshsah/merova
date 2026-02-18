import 'package:auto_route/annotations.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:merova/src/core/extension/context_extensions.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/core/themes/app_text_styles.dart';
import 'package:merova/src/core/themes/dimensions.dart';
import 'package:merova/src/core/widget/custom_button.dart';
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
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  bool isLoading = false;
  bool isEmailSelected = true;

  String _countryCode = "+977";
  String _countryFlag = "";

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
            emailOrPhone: isEmailSelected
                ? emailController.text.trim()
                : phoneController.text.trim(),
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
                      if (isEmailSelected) _emailField() else _phoneField(),
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

  Widget _emailField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        hintText: "example@email.com",
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return "Email is required";
        if (!RegExp(r'.+@.+\..+').hasMatch(value)) return "Enter valid email";
        return null;
      },
    );
  }

  Widget _phoneField() {
    return TextFormField(
      controller: phoneController,
      keyboardType: TextInputType.number,
      decoration:  InputDecoration(
        prefix: Padding(
          padding: Dimensions.countryCode,
          child: countryCode(),
        ),
        hintText: "98XXXXXXXX",
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return "Phone required";
        if (value.length != 10) return "Must be 10 digits";
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
          onSelect: (country) async {
            setState(() {
              _countryCode = '+${country.phoneCode}';
              _countryFlag = country.flagEmoji;
            });
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool('remember', false);
            await prefs.remove('userId');
            await prefs.remove('userPassword');
          },
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _countryFlag.isEmpty ? '🇳🇵 +977' : '$_countryFlag $_countryCode',
            style: AppTextStyles.label,
          ),
          const Icon(Icons.arrow_drop_down),
          const SizedBox(width: 6),
        ],
      ),
    );
  }
}
