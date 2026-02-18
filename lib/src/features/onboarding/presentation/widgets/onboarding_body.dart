import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/features/onboarding/domain/models/onboarding_item.dart';

class OnboardingBody extends StatelessWidget {
  final PageController controller;
  final List<OnboardingItem> items;
  final Function(int) onPageChanged;

  const OnboardingBody({
    super.key,
    required this.controller,
    required this.items,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: controller,
        itemCount: items.length,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset(item.image, height: 300.h, fit: BoxFit.contain),
                const Spacer(),
                Text(
                  item.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textWhite,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  item.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.textWhite.withOpacity(0.9),
                  ),
                ),
                const Spacer(),
              ],
            ),
          );
        },
      ),
    );
  }
}
