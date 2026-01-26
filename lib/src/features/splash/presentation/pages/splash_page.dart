import 'package:auth/src/core/routes/app_router.dart';
import 'package:auth/src/core/themes/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  void _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      context.router.replace(const OnboardingRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: AppColors.linearGradient,
          ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/M_icon.png",
              width: 400.w,
              height: 400.h ,
            ).animate().fade(duration: 500.ms).scale(delay: 500.ms),
            SizedBox(height: 2.h),
            // Text(
            //   "Merova",
            //   textHeightBehavior: TextHeightBehavior(
            //     applyHeightToFirstAscent: false,
            //     applyHeightToLastDescent: false,
            //   ),
            //   style: TextStyle(
            //     fontSize: 30.sp,
            //     fontWeight: FontWeight.bold,
            //     color: AppColors.primary,
            //     height: 0.9,
            //   ),
            // ).animate().slideY(begin: 1.0, end: 0.0, delay: 1000.ms).fade(),
          ],
        ),
      ),
    ));
  }
}
