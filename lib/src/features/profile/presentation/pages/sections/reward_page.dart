import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loyalty/loyalty.dart';

import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/core/widget/header_positioned.dart';

@RoutePage()
class RewardPage extends StatelessWidget {
  const RewardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const HeaderPositioned(
            title: "Rewards",
          ),

          const SizedBox(height: 20),

          Center(
            child: ElevatedButton(
              onPressed: () {
                LoyaltySDK.open(context);
              },
              child: const Text("Open Loyalty Rewards"),
            ),
          ),
        ],
      ),
    );
  }
} 
