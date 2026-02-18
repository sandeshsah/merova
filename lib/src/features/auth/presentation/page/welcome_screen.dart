import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:merova/src/core/routes/app_router.dart';
import 'package:merova/src/core/widget/header_positioned.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/widget/custom_button.dart';
import 'login_page.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  final String uid; // Pass the UID from your OTP verification screen

  const WelcomePage({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBarBackground(
      title: "Success",
      centerTitle: true,
      body: Stack(
        children: [
          BodyPositioned(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: SafeArea(
                top: false,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 40.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
            
                      // Green Checkmark Icon
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.check, size: 60, color: Colors.white),
                      ),
                      const SizedBox(height: 20),
            
                      // Welcome Text
                      const Text(
                        'Welcome onboard!',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Your account has been successfully created and below is your UID',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
            
                      // UID Box with Copy Icon
                      GestureDetector(
                        onTap: () async {
                          await Clipboard.setData(ClipboardData(text: uid));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('UID copied to clipboard!')),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Account UID: ',
                                style: TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              Text(
                                uid,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(Icons.copy, color: Colors.grey, size: 20),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
            
                      // Instruction Text
                      const Text(
                        'Use this UID to login to your account',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
            
                      // Feature List
                      const Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.check_circle_outline,
                              size: 20,
                              color: Colors.green,
                            ),
                            title: Text(
                              'Unified Notifications',
                              style: TextStyle(fontSize: 16),
                            ),
                            subtitle: Text(
                              'All your bank notifications in one place',
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.check_circle_outline,
                              size: 20,
                              color: Colors.green,
                            ),
                            title: Text(
                              'Multi-Device Sync',
                              style: TextStyle(fontSize: 16),
                            ),
                            subtitle: Text('Access your messages from any device'),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.check_circle_outline,
                              size: 20,
                              color: Colors.green,
                            ),
                            title: Text(
                              'Secure & Private',
                              style: TextStyle(fontSize: 16),
                            ),
                            subtitle: Text('Bank-grade security for your data'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
            
                      // Back to login Button
                      CustomButton(
                        title: "Back to login →",
                        onTap: () {
                          context.router.replace(const LoginRoute());
                        },
                      ),
                      const SizedBox(height: 20),
            
                      // Bottom Indicator
                      Center(
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
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
