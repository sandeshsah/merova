import 'package:auth/generated/app_localizations.dart';
import 'package:auth/src/features/onboarding/domain/models/onboarding_item.dart';
import 'package:flutter/material.dart';

class OnboardingData {
  static List<OnboardingItem> getItems(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      OnboardingItem(
        title: l10n.onboardingTitle1,
        description: l10n.onboardingDesc1,
        image: "assets/images/onBoarding.png",
      ),
      OnboardingItem(
        title: l10n.onboardingTitle2,
        description: l10n.onboardingDesc2,
        image: "assets/images/onBoarding.png",
      ),
      OnboardingItem(
        title: l10n.onboardingTitle3,
        description: l10n.onboardingDesc3,
        image: "assets/images/onBoarding.png",
      ),
    ];
  }
}
