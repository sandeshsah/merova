import 'package:auto_route/auto_route.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:merova/src/core/extension/context_extensions.dart';
import 'package:merova/src/core/themes/dimensions.dart';
import 'package:merova/src/core/widget/custom_text_form_field.dart';
import 'package:merova/src/core/widget/header_positioned.dart';
import 'package:merova/src/core/routes/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../../../../core/enums/app_enum.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/widget/custom_button.dart';
import '../../../../core/widget/padding_provider_widget.dart';
import 'package:merova/src/core/constants/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
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

    final fullPhone = '$_countryCode${phoneController.text.trim()}';

    context.read<AuthBloc>().add(
      AuthEvent.registerRequested(
        fullName: fullNameController.text.trim(),
        password: passwordController.text.trim(),
        phoneNumber: fullPhone,
        email: emailController.text.trim(),
      ),
    );
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
                child: BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) async {
                    if (state.status == AuthStatus.otpSent &&
                        state.flow == AuthFlow.register) {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString(
                        StorageKeys.fullName,
                        fullNameController.text.trim(),
                      );
                      await prefs.setString(
                        StorageKeys.userEmail,
                        emailController.text.trim(),
                      );
                      await prefs.setString(
                        StorageKeys.phoneNumber,
                        phoneController.text.trim(),
                      );
                      await prefs.setString(
                        StorageKeys.countryCode,
                        _countryCode,
                      );
                      await prefs.setString(
                        StorageKeys.countryFlag,
                        _countryFlag.isEmpty ? "🇳🇵" : _countryFlag,
                      );

                      final fullPhone =
                          '$_countryCode${phoneController.text.trim()}';
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Registration successful! OTP sent"),
                        ),
                      );
                      context.router.replace(
                        OtpRoute(flow: "register", identifier: fullPhone),
                      );
                    } else if (state.status == AuthStatus.error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            state.message != null && state.message!.isNotEmpty
                                ? state.message!
                                : "Registration failed",
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return PaddingProviderWidget(
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
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Full name is required";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 20),

                              /// Email
                              CustomTextFormField(
                                label: context.tr.email,
                                hint: context.tr.enterYourEmail,
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                prefixIcon: Icons.email,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "This field is required";
                                  }
                                  if (!val.contains('@')) {
                                    return "Invalid email format";
                                  }
                                  return null;
                                },
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
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "This field is required";
                                  }
                                  if (val.length < 10) {
                                    return "Phone number must be at least 10 digits";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),

                              /// Password
                              CustomTextFormField(
                                label: context.tr.password,
                                hint: context.tr.setUpPasswordHere,
                                controller: passwordController,
                                keyboardType: TextInputType.text,
                                isPassword: true,
                                prefixIcon: Icons.lock_outline,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Password is required";
                                  }
                                  if (val.length < 6) {
                                    return "Password must be at least 6 characters";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 24),

                              // Terms Checkbox
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: _agreeToTerms,
                                    onChanged: (v) => setState(
                                      () => _agreeToTerms = v ?? false,
                                    ),
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
                                isLoading: state.status == AuthStatus.loading,
                                onTap: handleRegister,
                              ),
                              const SizedBox(height: 24),

                              // Login Link
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: Text.rich(
                                      TextSpan(
                                        text: '${tr.alreadyHaveAnAccount}  ',
                                        children: [
                                          TextSpan(
                                            text: tr.login,
                                            style: TextStyle(
                                              color: AppColors.primary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),

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
                              const SizedBox(height: 10),
                              // Padding(
                              //   padding: const EdgeInsets.only(bottom: 12),
                              //   child: Center(
                              //     child: Container(
                              //       width: 120,
                              //       height: 4,
                              //       decoration: BoxDecoration(
                              //         color: Colors.grey.shade400,
                              //         borderRadius: BorderRadius.circular(10),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
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
