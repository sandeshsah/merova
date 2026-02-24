import 'package:auto_route/auto_route.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:merova/src/core/extension/context_extensions.dart';
import 'package:merova/src/core/routes/app_router.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merova/src/core/enums/app_enum.dart';
import 'package:merova/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:merova/src/features/auth/presentation/bloc/auth_event.dart';
import 'package:merova/src/features/auth/presentation/bloc/auth_state.dart';
import 'package:merova/src/core/themes/app_text_styles.dart';
import 'package:merova/src/core/themes/dimensions.dart';
import 'package:merova/src/core/widget/custom_button.dart';
import 'package:merova/src/core/widget/custom_text_form_field.dart';
import 'package:merova/src/core/widget/header_positioned.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool isLoading = false;
  bool isEmailSelected = true;

  String _countryCode = "+977";
  String _countryFlag = "🇳🇵";

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final fullIdentifier = isEmailSelected
        ? emailController.text.trim()
        : _countryCode + phoneController.text.trim();

    context.read<AuthBloc>().add(
      AuthEvent.forgotPasswordRequested(identifier: fullIdentifier),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    return AppBarBackground(
      title: tr.forgotPassword,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.otpSent) {
            final fullIdentifier = isEmailSelected
                ? emailController.text.trim()
                : _countryCode + phoneController.text.trim();
            context.router.push(
              OtpRoute(flow: "forgotPassword", identifier: fullIdentifier),
            );
          } else if (state.status == AuthStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message ?? "Request failed"),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Stack(
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
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
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
                                _toggleButton(context.tr.email, true),
                                _toggleButton(context.tr.phone, false),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          //if (isEmailSelected) _emailField() else _phoneField(),
                          _buildUidField(context),
                          const SizedBox(height: 24),
                          CustomButton(
                            title: "Continue",
                            isLoading: state.status == AuthStatus.loading,
                            onTap: _submit,
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _toggleButton(String text, bool emailMode) {
    final isActive = isEmailSelected == emailMode;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (isEmailSelected == emailMode) return;
          setState(() {
            isEmailSelected = emailMode;
            _formKey.currentState?.reset();
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isActive ? AppColors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: isActive
                ? Border.all(color: AppColors.grey, width: 3)
                : null,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isActive ? AppColors.black : AppColors.textLight,
            ),
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
      controller: isEmailSelected ? emailController : phoneController,
      keyboardType: isEmailSelected
          ? TextInputType.emailAddress
          : TextInputType.phone,
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
                    Text(_countryFlag, style: const TextStyle(fontSize: 16)),
                    const SizedBox(width: 6),
                    Text(_countryCode, style: AppTextStyles.label),
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
      child: Text("$_countryFlag $_countryCode", style: AppTextStyles.label),
    );
  }
}
