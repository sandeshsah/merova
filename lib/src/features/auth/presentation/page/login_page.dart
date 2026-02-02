import 'package:auth/src/core/extension/context_extensions.dart';
import 'package:auth/src/core/themes/dimensions.dart';
import 'package:auth/src/core/widget/custom_button.dart';
import 'package:auth/src/core/widget/custom_text_form_field.dart';
import 'package:auth/src/core/widget/divider_with_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auth/src/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:country_picker/country_picker.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/widget/padding_provider_widget.dart';
import '../../../../init_dependencies.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import 'forgot_password.dart';
import 'register_page.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController UIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LocalAuthentication auth = LocalAuthentication();

  String _countryCode = "+977";
  String _countryFlag = "";

  bool _rememberMe = false;
  String _selectedLanguage = "English";

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  Future<void> _loadSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final remember = prefs.getBool('remember') ?? false;
    final savedCountryCode = prefs.getString('countryCode') ?? "+977";

    if (remember) {
      final savedUid = prefs.getString('userId') ?? '';
      final savedPassword = prefs.getString('userPassword');

      String displayUid = savedUid;
      if (savedUid.startsWith(savedCountryCode)) {
        displayUid = savedUid.substring(savedCountryCode.length);
      }

      setState(() {
        _rememberMe = true;
        UIdController.text = displayUid;
        passwordController.text = savedPassword ?? '';
        _countryCode = "+977"; // default
        _countryFlag = "🇳🇵";
      });
    } else {
      setState(() {
        _rememberMe = false;
        UIdController.clear();
        passwordController.clear();
        _countryCode = "+977";
        _countryFlag = "🇳🇵";
      });
    }
  }

  Future<void> _authenticationWithBiometrics(BuildContext blocContext) async {
    try {
      final bool canCheckBiometrics = await auth.canCheckBiometrics;
      final bool isDeviceSupported = await auth.isDeviceSupported();
      final bool canAuthenticate = canCheckBiometrics || isDeviceSupported;

      if (!canAuthenticate) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Biometric Authentication not available on this device",
              ),
            ),
          );
        }
        return;
      }

      final bool authenticated = await auth.authenticate(
        localizedReason: 'Verify your identity to login',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );

      if (!mounted) return;

      if (authenticated) {
        final prefs = await SharedPreferences.getInstance();
        final bool remember = prefs.getBool('remember') ?? false;

        if (remember) {
          final String? savedUid = prefs.getString('userId');
          final String? savedPassword = prefs.getString('userPassword');

          if (savedUid != null && savedPassword != null) {
            UIdController.text = savedUid.replaceAll(_countryCode, " ");
            passwordController.text = savedPassword;
            if (mounted) {
              // Close bottom sheet if open
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
              // Use the passed blocContext here
              blocContext.read<AuthBloc>().add(
                AuthEvent.loginRequested(
                  UId: savedUid,
                  email: "",
                  password: savedPassword,
                ),
              );
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "No saved credentials found. Please login manually first.",
                ),
              ),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Enable 'Remember me' first to use biometrics"),
            ),
          );
        }
      }
    } catch (e) {
      debugPrint("Biometric Error: $e");
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Authentication error: $e")));
    }
  }

  void _showFingerprintBottomSheet(BuildContext blocContext) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Authentication required',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Verify identity',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Icon(Icons.fingerprint, size: 60, color: Colors.blue),
                const SizedBox(height: 10),
                Text(
                  "Touch the fingerprint sensor",
                  style: TextStyle(color: AppColors.textLight),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(ctx); // Just close bottom sheet
                      },
                      child: const Text(
                        "CANCEL",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
    // Trigger biometric after sheet is shown
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) _authenticationWithBiometrics(blocContext);
    });
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: Builder(
        builder: (blocContext) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 100,
              centerTitle: false,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(context.tr.welcome, style: AppTextStyles.title),
                  const SizedBox(height: 4),
                  Text(
                    context.tr.loginYourAccountToGetStarted,
                    style: AppTextStyles.subtitle,
                  ),
                ],
              ),
              actions: [
                // Message Icon
                IconButton(
                  icon: const Icon(Icons.message_outlined),
                  onPressed: () {

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Messages coming soon!")),
                    );
                  },
                ),
                const SizedBox(width: 8),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: Dimensions.paddingLarge,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        label: tr.uid,
                        hint: tr.enterYourNumber,
                        controller: UIdController,
                        keyboardType: TextInputType.number,
                        prefix: Padding(
                          padding: Dimensions.countryCode,
                          child: countryCode(),
                        ),
                        maxLength: 10,
                      ),

                      const SizedBox(height: 20),
                      CustomTextFormField(
                        label: tr.password,
                        hint: tr.enterYourPassword,
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        isPassword: true,
                        prefixIcon: Icons.lock_outline,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Checkbox(
                            value: _rememberMe,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value!;
                              });
                            },
                            activeColor: AppColors.primary,
                          ),
                           Text(tr.rememberMe),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPasswordPage(),
                                ),
                              );
                            },
                            child:  Text(
                             tr.forgotPassword,
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) async {
                          if (state.status.isLoggedIn) {
                            final prefs = await SharedPreferences.getInstance();
                            if (_rememberMe) {
                              await prefs.setBool('remember', true);
                              await prefs.setString(
                                'userId',
                                _countryCode + UIdController.text,
                              );
                              await prefs.setString(
                                'userPassword',
                                passwordController.text,
                              );
                              await prefs.setString(
                                'countryCode',
                                _countryCode,
                              );
                            } else {
                              await prefs.setBool('remember', false);
                              await prefs.remove('userId');
                              await prefs.remove('userPassword');
                              await prefs.remove('countryCode');
                            }

                            if (mounted) {
                              context.router.replaceAll([const HomeRoute()]);
                            }
                          } else if (state.status.isError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message ?? "Error")),
                            );
                          }
                        },
                        builder: (context, state) {
                          return CustomButton(
                            title: state.status.displayLabel,
                            isLoading: state.status.isLoading,
                            onTap: () {
                              final uid = UIdController.text.trim();
                              final pass = passwordController.text.trim();

                              if (uid.isEmpty || pass.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(
                                    content: Text(
                                      tr.pleaseEnterUIDAndPassword,
                                    ),
                                  ),
                                );
                                return;
                              }
                              blocContext.read<AuthBloc>().add(
                                AuthEvent.loginRequested(
                                  UId: _countryCode + UIdController.text,
                                  email: "",
                                  password: passwordController.text,
                                ),
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                       DividerWithText(text: tr.orsignInWith),
                      const SizedBox(height: 24),
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
                                    _showFingerprintBottomSheet(blocContext),
                              ),
                            ),
                            const SizedBox(height: 8),
                             Text(context.tr.useBiometricToLogin),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const RegisterPage(),
                              ),
                            );
                          },
                          child: Text.rich(
                            TextSpan(
                              text: tr.dontHaveAnAccount,
                              children: [
                                TextSpan(
                                  text: tr.register,
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
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

          );
        },
      ),
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
            _countryFlag.isEmpty ? '🇧🇭 +973' : '$_countryFlag $_countryCode',
            style: AppTextStyles.label,
          ),
          const Icon(Icons.arrow_drop_down),
          const SizedBox(width: 6),
        ],
      ),
    );
  }
}
