import 'package:flutter/material.dart';
import 'package:merova/src/core/service/security_service.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/core/themes/dimensions.dart';
import 'package:merova/src/init_dependencies.dart';

class BiometricSheet extends StatelessWidget {
  final String title;
  final String reason;

  const BiometricSheet({
    super.key,
    this.title = 'Authentication Required',
    this.reason = 'Verify your identity to proceed',
  });

  /// Static method to trigger the full flow: Support Check -> UI -> Result
  static Future<bool> authenticatedBiometric(
    BuildContext context, {
    String? title,
    String? reason,
  }) async {
    final securityService = sl<SecurityService>();

    // 1. Check support first
    final bool canAuthenticate = await securityService.canCheckBiometrics();
    if (!canAuthenticate) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Biometric Authentication not available"),
          ),
        );
      }
      return false;
    }

    // 2. Show the BottomSheet
    final bool? result = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => BiometricSheet(
        title: title ?? 'Authentication Required',
        reason: reason ?? 'Verify your identity',
      ),
    );

    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    // Trigger biometric automatically after sheet enters
    Future.delayed(const Duration(milliseconds: 500), () async {
      final success = await sl<SecurityService>().authenticateBiometric(
        reason: reason,
      );
      if (context.mounted) {
        Navigator.pop(context, success);
      }
    });

    return Padding(
      padding: Dimensions.paddingDefault,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),
          const Icon(Icons.fingerprint, size: 70, color: Colors.blue),
          const SizedBox(height: 24),
          const Text(
            "Touch the fingerprint sensor",
            style: TextStyle(color: AppColors.grey, fontSize: 14),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () => Navigator.pop(context, false),
              child:  Text(
                "CANCEL",
                style: TextStyle(
                  color: AppColors.error,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
