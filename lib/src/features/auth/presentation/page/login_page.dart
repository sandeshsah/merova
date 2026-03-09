import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:country_picker/country_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:merova/src/core/extension/context_extensions.dart';
import 'package:merova/src/core/routes/app_router.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/core/themes/app_text_styles.dart';
import 'package:merova/src/core/themes/dimensions.dart';
import 'package:merova/src/core/widget/custom_button.dart';
import 'package:merova/src/core/widget/custom_text_form_field.dart';
import 'package:merova/src/core/widget/divider_with_text.dart';
import 'package:merova/src/core/widget/header_positioned.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import 'package:merova/src/core/enums/app_enum.dart';
import 'package:merova/src/core/constants/storage_keys.dart';
import 'package:merova/src/core/widget/biometric_sheet.dart';
import 'package:merova/src/core/service/security_service.dart';
import 'package:merova/src/init_dependencies.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isEmailSelected = true;
  bool isPhoneNumberSelected = true;
  bool rememberMe = false;

  String _countryCode = "+977";
  String _countryFlag = "🇳🇵";

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  Future<void> _loadSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final remember = prefs.getBool(StorageKeys.remember) ?? false;
    if (!remember) return;
    setState(() {
      final savedEmail = prefs.getString(StorageKeys.userEmail) ?? '';
      final savedPhone = prefs.getString(StorageKeys.phoneNumber) ?? '';

      if (savedEmail.isNotEmpty) emailController.text = savedEmail;
      if (savedPhone.isNotEmpty) phoneController.text = savedPhone;

      if (remember) {
        isEmailSelected = prefs.getBool(StorageKeys.isEmail) ?? true;
        isPhoneNumberSelected =
            prefs.getBool(StorageKeys.isPhoneNumberSelected) ?? true;
        //passwordController.text = prefs.getString(StorageKeys.userPassword) ?? '';
        _countryCode = prefs.getString(StorageKeys.countryCode) ?? "+977";
        _countryFlag = prefs.getString(StorageKeys.countryFlag) ?? "🇳🇵";
        rememberMe = true;
      }
    });
  }

  void _login() {
    if (!_formKey.currentState!.validate()) return;

    final identifier = isEmailSelected
        ? emailController.text.trim()
        : phoneController.text.trim();
    final password = passwordController.text.trim();

    final fullIdentifier = isEmailSelected
        ? identifier
        : _countryCode + identifier;

    context.read<AuthBloc>().add(
      AuthEvent.loginRequested(identifier: fullIdentifier, password: password),
    );
  }

  Future<void> _authenticationWithBiometrics(BuildContext blocContext) async {
    final securityService = sl<SecurityService>();
    final bool isBiometricEnabled = securityService.isBiometricLoginEnabled();

    if (!isBiometricEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Enable 'Biometric Login' in settings first"),
        ),
      );
      return;
    }

    final bool authenticated = await BiometricSheet.authenticatedBiometric(
      context,
      reason: 'Verify your identity to login',
    );

    if (!mounted) return;

    if (authenticated) {
      final credentials = await securityService.getCredentials();
      final String? savedUid = credentials['identifier'];
      final String? savedPassword = credentials['password'];

      if (savedUid != null &&
          savedPassword != null &&
          savedUid.isNotEmpty &&
          savedPassword.isNotEmpty) {
        setState(() {
          if (savedUid.contains("@")) {
            emailController.text = savedUid;
            isEmailSelected = true;
          } else {
            // Robust prefix handling: remove leading '+' and digits until we likely have the local number
            // or just use the savedUid if it's already what we need.
            // For now, replacing the current UI country code if it matches the start of savedUid
            if (savedUid.startsWith(_countryCode)) {
              phoneController.text = savedUid
                  .substring(_countryCode.length)
                  .trim();
            } else {
              // If it doesn't match the current UI prefix, just put the whole thing in or try to find where it starts
              phoneController.text = savedUid;
            }
            isEmailSelected = false;
          }
          passwordController.text = savedPassword;
        });

        // Perform Login with saved credentials
        blocContext.read<AuthBloc>().add(
          AuthEvent.loginRequested(
            identifier: savedUid,
            password: savedPassword,
          ),
        );
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "No saved credentials found. Login manually once to enable biometric login.",
              ),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    return AppBarBackground(
      title: tr.welcome,
      subtitle: tr.loginYourAccountToGetStarted,
      showBack: false,
      body: Stack(
        children: [
          BodyPositioned(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                padding: Dimensions.paddingDefault,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),

                      /// TOGGLE
                      _buildToggle(),
                      const SizedBox(height: 20),

                      /// EMAIL / PHONE FIELD
                      _buildUidField(context),
                      const SizedBox(height: 20),

                      /// PASSWORD
                      CustomTextFormField(
                        label: tr.password,
                        hint: tr.enterYourPassword,
                        controller: passwordController,
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
                      const SizedBox(height: 12),

                      /// REMEMBER / FORGOT
                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (v) {
                              setState(() {
                                rememberMe = v!;
                              });
                            },
                            activeColor: AppColors.primary,
                          ),
                          Text(tr.rememberMe),
                          const Spacer(),
                          TextButton(
                            onPressed: () => context.router.push(
                              const ForgotPasswordRoute(),
                            ),
                            child: Text(
                              tr.forgotPassword,
                              style: const TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      /// LOGIN BUTTON
                      BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) async {
                          if (state.status.isLoggedIn &&
                              state.flow == AuthFlow.login) {
                            final prefs = await SharedPreferences.getInstance();

                            /// Always save fullName and email for ProfilePage regardless of rememberMe for the session
                            if (state.user != null) {
                              if (state.user?.fullName != null &&
                                  state.user!.fullName.isNotEmpty) {
                                await prefs.setString(
                                  StorageKeys.fullName,
                                  state.user!.fullName,
                                );
                              }
                              if (state.user?.email != null &&
                                  state.user!.email.isNotEmpty) {
                                await prefs.setString(
                                  StorageKeys.userEmail,
                                  state.user!.email,
                                );
                              }
                            }

                            final securityService = sl<SecurityService>();
                            final fullUid = isEmailSelected
                                ? emailController.text.trim()
                                : _countryCode + phoneController.text.trim();
                            final password = passwordController.text.trim();

                            // Always save credentials securely if biometric login is enabled
                            if (securityService.isBiometricLoginEnabled() &&
                                fullUid.isNotEmpty &&
                                password.isNotEmpty) {
                              await securityService.saveCredentials(
                                fullUid,
                                password,
                              );
                            }

                            if (rememberMe) {
                              await prefs.setBool(StorageKeys.remember, true);
                              await prefs.setBool(
                                StorageKeys.isEmail,
                                isEmailSelected,
                              );
                              if (isEmailSelected) {
                                await prefs.setString(
                                  StorageKeys.userEmail,
                                  emailController.text.trim(),
                                );
                              } else {
                                await prefs.setString(
                                  StorageKeys.phoneNumber,
                                  phoneController.text.trim(),
                                );
                              }
                              await prefs.setString(
                                StorageKeys.userPassword,
                                passwordController.text.trim(),
                              );
                              await prefs.setString(
                                StorageKeys.countryCode,
                                _countryCode,
                              );
                              await prefs.setString(
                                StorageKeys.countryFlag,
                                _countryFlag,
                              );

                              await prefs.setString(
                                StorageKeys.userId,
                                fullUid,
                              );
                            } else {
                              await prefs.remove(StorageKeys.remember);
                              await prefs.remove(StorageKeys.isEmail);
                              await prefs.remove(StorageKeys.phoneNumber);
                              await prefs.remove(StorageKeys.userPassword);
                              await prefs.remove(StorageKeys.countryCode);
                              await prefs.remove(StorageKeys.countryFlag);
                              await prefs.remove(StorageKeys.userId);
                            }

                            context.router.replaceAll([const HomeRoute()]);
                          } else if (state.status.isError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  state.message ?? "Authentication failed",
                                ),
                                backgroundColor: Colors.redAccent,
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          return CustomButton(
                            title: state.status.displayLabel,
                            isLoading: state.status.isLoading,
                            onTap: _login,
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      DividerWithText(text: tr.orsignInWith),
                      const SizedBox(height: 24),

                      /// BIOMETRIC
                      Center(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 32,
                              backgroundColor: AppColors.primary.withOpacity(
                                0.1,
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.fingerprint,
                                  size: 36,
                                  color: AppColors.primary,
                                ),
                                onPressed: () =>
                                    _authenticationWithBiometrics(context),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text("Use biometric to login"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      /// REGISTER
                      Center(
                        child: GestureDetector(
                          onTap: () =>
                              context.router.push(const RegisterRoute()),
                          child: Text.rich(
                            TextSpan(
                              text: '${tr.dontHaveAnAccount}  ',
                              children: [
                                TextSpan(
                                  text: tr.register,
                                  style: const TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      /// FOOTER
                      Center(
                        child: Text(
                          context
                              .tr
                              .protectedByBankGradeEncryptionRegulatedByCentralBankOfNepal,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textLight,
                          ),
                        ),
                      ),
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

  /// TOGGLE BUTTON
  Widget _buildToggle() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.greyShade,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _toggleButton(context.tr.email, true),
          _toggleButton(context.tr.phone, false),
        ],
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

  /// UID FIELD
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

  /// COUNTRY PICKER
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
