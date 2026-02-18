import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:merova/src/core/routes/app_router.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/features/onboarding/presentation/widgets/onboarding_body.dart';
import 'package:merova/src/features/onboarding/presentation/widgets/onboarding_footer.dart';
import 'package:merova/src/features/onboarding/presentation/widgets/onboarding_header.dart';

import 'onboarding_data.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _skip() {
    _pageController.animateToPage(
      OnboardingData.getItems(context).length - 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _getStarted() {
    context.router.replace(const LoginRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.onBoarding),
        child: SafeArea(
          child: Column(
            children: [
              const OnboardingHeader(),
              OnboardingBody(
                controller: _pageController,
                items: OnboardingData.getItems(context),
                onPageChanged: _onPageChanged,
              ),
              OnboardingFooter(
                currentPage: _currentPage,
                totalPages: OnboardingData.getItems(context).length,
                onNext: _nextPage,
                onSkip: _skip,
                onGetStarted: _getStarted,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
