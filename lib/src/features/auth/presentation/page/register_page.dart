import 'package:auto_route/auto_route.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:merova/src/core/extension/context_extensions.dart';
import 'package:merova/src/core/themes/dimensions.dart';
import 'package:merova/src/core/widget/custom_text_form_field.dart';
import 'package:merova/src/core/widget/header_positioned.dart';
import 'package:merova/src/core/routes/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/widget/custom_button.dart';
import '../../../../core/widget/padding_provider_widget.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController fullNameController = TextEditingController(
    //text: "John Doe",
  );
  final TextEditingController emailController = TextEditingController(
    //text: "name@gmail.com",
  );
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController captchaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool _obscurePassword = true;
  bool _agreeToTerms = false;

  String _countryCode = "+977";
  String _countryFlag = "";

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    captchaController.dispose();
    super.dispose();
  }

  Future<void> handleRegister() async {
    if (!_formKey.currentState!.validate()) return;

    if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("You must agree to the Terms and Privacy Policy"),
        ),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final prefs = await SharedPreferences.getInstance();
      final fullPhone = '$_countryCode${phoneController.text.trim()}';

      await prefs.setString('fullName', fullNameController.text.trim());
      await prefs.setString('userEmail', emailController.text.trim());
      await prefs.setString('userId', fullPhone);
      await prefs.setString('userPassword', passwordController.text);
      await prefs.setBool('remember', true);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration successful! OTP sent")),
      );

      context.router.replace(
        OtpRoute(
          flow: "register",
          emailOrPhone: fullPhone,
        ),
      );
    } catch (e) {
      setState(() => isLoading = false);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration failed: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return AppBarBackground(
      title: tr.register,
      body: Stack(
        children: [
          BodyPositioned(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: PaddingProviderWidget(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Register!",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Create your account to get started",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.textLight,
                            ),
                          ),
                          const SizedBox(height: 32),

                          /// Full Name
                          CustomTextFormField(
                            label: context.tr.fullName,
                            hint: context.tr.enterYourName,
                            controller: fullNameController,
                            keyboardType: TextInputType.text,
                            prefixIcon: Icons.person,
                          ),
                          SizedBox(height: 20),

                          /// Email
                          CustomTextFormField(
                            label: context.tr.email,
                            hint: context.tr.enterYourEmail,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: Icons.email,
                          ),
                          const SizedBox(height: 20),

                          /// Phone
                          CustomTextFormField(
                            label: context.tr.phone,
                            hint: context.tr.enterYourNumber,
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            prefixWidget: Padding(
                              padding: Dimensions.textFormField,
                              child: countryCodePicker(),
                            ),
                            maxLength: 10,
                            prefixIcon: Icons.phone_callback,
                          ),
                          const SizedBox(height: 20),

                          // Password
                          CustomTextFormField(
                            label: context.tr.password,
                            hint: context.tr.setUpPasswordHere,
                            controller: passwordController,
                            keyboardType: TextInputType.text,
                            isPassword: true,
                            prefixIcon: Icons.lock_outline,
                          ),
                          const SizedBox(height: 24),

                          // Terms Checkbox
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: _agreeToTerms,
                                onChanged: (v) =>
                                    setState(() => _agreeToTerms = v ?? false),
                                activeColor: AppColors.primary,
                              ),
                              Expanded(
                                child: Text(
                                  context
                                      .tr
                                      .iAgreeToTheTermsofServiceAndPrivacyPolicyIUnderstandMyDataIsProtectedUnderMerovaRegulations,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          // Register Button
                          CustomButton(
                            title: context.tr.register,
                            isLoading: isLoading,
                            onTap: handleRegister,
                          ),
                          const SizedBox(height: 24),

                          // Login Link
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(context.tr.alreadyHaveAnAccount),
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Text(
                                  context.tr.login,
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),

                          // Footer
                          const Center(
                            child: Text(
                              "Protected by bank-grade encryption\nRegulated by Central Bank of Bahrain",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Center(
                              child: Container(
                                width: 120,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget countryCodePicker() {
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
