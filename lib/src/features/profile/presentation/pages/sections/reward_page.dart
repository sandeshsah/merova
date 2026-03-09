import 'package:flutter/material.dart';
import 'package:merova/src/core/enums/app_enum.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/core/widget/header_positioned.dart';

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
            alignment: HeaderAlignment.center,
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star_rounded, size: 80, color: AppColors.primary),
                  const SizedBox(height: 16),
                  const Text(
                    "Your Rewards",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text("View and redeem your rewards here."),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
