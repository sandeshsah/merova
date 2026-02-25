import 'package:flutter/material.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/core/themes/dimensions.dart';
import 'package:merova/src/core/widget/header_positioned.dart';

class TermsConditionsPage extends StatefulWidget {
  const TermsConditionsPage({super.key});

  @override
  State<TermsConditionsPage> createState() => _TermsConditionsPageState();
}

class _TermsConditionsPageState extends State<TermsConditionsPage> {
  bool isAccepted = false;

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 6),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget sectionContent(String content) {
    return Text(
      content,
      style: const TextStyle(
        fontSize: 14,
        height: 1.6,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  AppBarBackground(
      title: "Personal Information",
      centerTitle: true,
      body:  Stack(
        children: [
      BodyPositioned(
      child: Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: Dimensions.paddingDefault,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sectionTitle("1. Acceptance of Terms"),
                    sectionContent(
                        "By accessing or using this Digital Banking Application (the “App”), you acknowledge that you have read, understood, and agreed to be bound by these Terms and Conditions."),

                    sectionTitle("2. Account Security"),
                    sectionContent(
                        "You are solely responsible for maintaining the confidentiality of your password, PIN, OTP, and other authentication credentials, and for all activities conducted under your account."),

                    sectionTitle("3. Transactions"),
                    sectionContent(
                        "All transactions initiated through the App are subject to verification, applicable transaction limits, regulatory requirements, and system availability."),

                    sectionTitle("4. Fees & Charges"),
                    sectionContent(
                        "Certain services provided through the App may be subject to applicable fees and charges as outlined in the Bank’s prevailing schedule of fees."),

                    sectionTitle("5. Suspension or Termination"),
                    sectionContent(
                        "The Bank reserves the right to suspend, restrict, or terminate access to any account in cases of suspected fraudulent, unauthorized, or unlawful activity, or as required by applicable laws and regulations."),

                    sectionTitle("6. Limitation of Liability"),
                    sectionContent(
                        "The Bank shall not be liable for any loss, damage, or delay arising from user negligence, unauthorized access, system failure, network disruption, or circumstances beyond its reasonable control."),

                    sectionTitle("7. Amendments"),
                    sectionContent(
                        "The Bank may amend these Terms and Conditions at any time. Continued use of the App following such amendments constitutes acceptance of the updated Terms."),

                    sectionTitle("8. Governing Law"),
                    sectionContent(
                        "These Terms and Conditions shall be governed by and construed in accordance with the laws of Nepal."),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // Checkbox Section
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: Row(
            //     children: [
            //       Checkbox(
            //         value: isAccepted,
            //         onChanged: (value) {
            //           setState(() {
            //             isAccepted = value ?? false;
            //           });
            //         },
            //       ),
            //       const Expanded(
            //         child: Text(
            //           "I have read and agree to the Terms & Conditions",
            //           style: TextStyle(fontSize: 13),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            // Continue Button
            // Padding(
            //   padding: const EdgeInsets.all(16),
            //   child: SizedBox(
            //     width: double.infinity,
            //     child: ElevatedButton(
            //       onPressed: isAccepted
            //           ? () {
            //         Navigator.pop(context, true);
            //       }
            //           : null,
            //       child: const Text("Accept & Continue"),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    )]));
  }
}