import 'package:flutter/material.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import '../bloc/fund_transfer_state.dart';

class TransferPinVerification extends StatelessWidget {
  final FundTransferState state;
  final Widget actionButton;

  const TransferPinVerification({
    super.key,
    required this.state,
    required this.actionButton,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "Please wait while verify your mobile number.",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const Text(
            "An OTP has been sent to your registered mobile number.",
            style: TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 60),
          const Text(
            "Enter Your PIN",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Please enter your PIN to confirm payment",
            style: TextStyle(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                4,
                (index) => Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.greyShade.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "120 seconds left to expire.",
            style: TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            "Don't receive the code?",
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textPrimary,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Resend",
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 40),
          actionButton,
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
