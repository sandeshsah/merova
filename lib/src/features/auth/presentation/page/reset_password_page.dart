import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merova/src/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:merova/src/core/extension/context_extensions.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/core/themes/app_text_styles.dart';
import 'package:merova/src/core/themes/dimensions.dart';
import 'package:merova/src/core/widget/custom_button.dart';
import 'package:merova/src/core/widget/custom_text_form_field.dart';
import 'package:merova/src/core/widget/header_positioned.dart';
import '../../../../core/enums/app_enum.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ResetPasswordPage extends StatefulWidget {
  final String identifier;
  const ResetPasswordPage({super.key, required this.identifier});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool obscureNew = true;
  bool obscureConfirm = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        AuthEvent.resetPasswordRequested(
          identifier: widget.identifier,
          password: _passwordController.text.trim(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return AppBarBackground(
      title: tr.resetPassword,
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
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state.status == AuthStatus.authenticated) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Password reset successfully! Logged in.",
                        ),
                      ),
                    );
                    context.router.replaceAll([const PasswordResetSuccessRoute()]);
                  } else if (state.status == AuthStatus.error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message ?? "Reset failed"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return SingleChildScrollView(
                    padding: Dimensions.paddingDefault,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Change your password.",
                            style: AppTextStyles.headline2,
                          ),
                          SizedBox(height: 10.h),
                          CustomTextFormField(
                            label: tr.password,
                            controller: _passwordController,
                            hint: tr.enterNewPassword,
                            keyboardType: TextInputType.text,
                            isPassword: true,
                            prefixIcon: Icons.lock_outline,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password required";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          CustomTextFormField(
                            label: tr.confirmPassword,
                            controller: _confirmPasswordController,
                            hint: tr.reEnterPasswordHere,
                            keyboardType: TextInputType.text,
                            isPassword: true,
                            prefixIcon: Icons.lock_outline,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Re-enter Password here";
                              }
                              if (value != _passwordController.text) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),
                          CustomButton(
                            title: "Submit",
                            isLoading: state.status == AuthStatus.loading,
                            onTap: _submit,
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
