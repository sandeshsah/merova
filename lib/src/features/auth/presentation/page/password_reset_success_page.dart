import 'package:flutter/material.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/widget/padding_provider_widget.dart';
import 'login_page.dart';

class PasswordResetSuccessPage extends StatelessWidget {
  const PasswordResetSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        foregroundColor: Colors.white,
        toolbarHeight: 100,
        centerTitle: true,
        title: const Text(
          "Reset Password",
          style: TextStyle(color: AppColors.white),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
        ),
      ),

      body: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: Container(
          color: AppColors.white,
          width: double.infinity,
          height: double.infinity,
          child: PaddingProviderWidget(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),

                  // Success tick with stars
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      // Decorative stars
                      Positioned(
                        top: 0,
                        left: 100,
                        child: Icon(Icons.star, color: Colors.green, size: 24),
                      ),
                      Positioned(
                        top: 0,
                        right: 100,
                        child: Icon(Icons.star, color: Colors.green, size: 24),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 100,
                        child: Icon(Icons.star, color: Colors.green, size: 18),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 0,
                        child: Icon(Icons.star, color: Colors.green, size: 18),
                      ),
                      // Tick icon
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 48,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    "Success!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Password changed successfully! You can use new password to login",
                    style: TextStyle(fontSize: 16, color: AppColors.grey),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 50),

                  // Back to login button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginPage()),
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Back to Login ->",
                        style: TextStyle(color: AppColors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
