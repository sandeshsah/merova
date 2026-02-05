import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:merova/src/core/routes/app_router.dart';
import 'package:merova/src/core/widget/header_positioned.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/enums/app_enum.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/widget/custom_button.dart';

@RoutePage()
class OtpPage extends StatefulWidget {
  final String? emailOrPhone;
  final String flow;

  const OtpPage({required this.flow, this.emailOrPhone});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  Timer? _timer;
  int _seconds = 30;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _seconds = 30;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        timer.cancel();
      } else {
        setState(() => _seconds--);
      }
    });
  }

  String get otp => _controllers.map((c) => c.text).join();

  void _checkAndVerifyOtp() {
    if (otp.length == 4) {
      _verifyOtp();
    }
  }

  void _verifyOtp() {
    final enteredOtp = otp.trim();

    if (enteredOtp.length < 4) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Enter complete OTP")));
      return;
    }

    context.read<AuthBloc>().add(
      AuthEvent.verifyOtpRequested(
        phoneNumber: widget.emailOrPhone ?? "",
        otp: enteredOtp,
      ),
    );
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBarBackground(
      title: "OTP",
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
              child: SafeArea(
                top: false,
                child: BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state.status == AuthStatus.authenticated) {
                      if (widget.flow == "register") {
                        context.router.replace(
                          WelcomeRoute(uid: widget.emailOrPhone ?? "UNKNOWN"),
                        );
                      } else if (widget.flow == "forgotPassword") {
                        context.router.replace(const ResetPasswordRoute());
                      }
                    } else if (state.status == AuthStatus.error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message ?? "Verification failed"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "OTP Verification",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  "We have sent an OTP code to",
                                  style: TextStyle(color: AppColors.textLight),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  widget.emailOrPhone ?? widget.flow,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 32),

                                /// OTP INPUTS
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                    4,
                                    (i) => _OtpBox(
                                      controller: _controllers[i],
                                      autoFocus: i == 0,
                                      onChanged: _checkAndVerifyOtp,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 32),

                                /// RESEND
                                Row(
                                  children: [
                                    const Text(
                                      "Didn't receive code? ",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.textLight,
                                      ),
                                    ),
                                    _seconds == 0
                                        ? TextButton(
                                            onPressed: _startTimer,
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              minimumSize: Size.zero,
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                            ),
                                            child: const Text(
                                              "Send again",
                                              style: TextStyle(
                                                color: AppColors.primary,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                              ),
                                            ),
                                          )
                                        : Text(
                                            "Send again in (${_seconds.toString().padLeft(2, '0')}.00)",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: AppColors.textLight,
                                            ),
                                          ),
                                  ],
                                ),

                                const SizedBox(height: 24),

                                /// VERIFY BUTTON
                                CustomButton(
                                  title: "Verify",
                                  isLoading: state.status == AuthStatus.loading,
                                  onTap: _verifyOtp,
                                ),
                              ],
                            ),
                          ),
                        ),

                        /// HOME INDICATOR
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Container(
                            width: 120,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
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
}

/// OTP BOX (UNDERLINE STYLE)
class _OtpBox extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final VoidCallback onChanged;

  const _OtpBox({
    required this.controller,
    required this.onChanged,
    this.autoFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      child: TextField(
        controller: controller,
        autofocus: autoFocus,
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          counterText: "",
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.border, width: 2),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 3),
          ),
        ),
        onChanged: (v) {
          if (v.isNotEmpty) {
            FocusScope.of(context).nextFocus();
            onChanged();
          }
        },
      ),
    );
  }
}
