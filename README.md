# Merova

Merova is a Flutter fintech-style app scaffold using clean architecture, BLoC, dependency injection, feature flags, and multi-environment entrypoints.

## Project Concept

The app is organized by features (`auth`, `home`, `profile`, `payment`, `fund`, etc.) with each feature split into:
- `data` (remote/mock datasource + repository impl)
- `domain` (entities/repositories/use cases)
- `presentation` (UI + BLoC)

Core app-level concerns are centralized in `lib/src/core`:
- Routing: `auto_route`
- Networking: `dio` + interceptors
- Environment: dev/staging/prod configs
- Feature Flags: toggle behavior like mock data usage
- Shared services: storage, security, themes, localization

## Runtime Flow (High Level)

1. Entry file (`main_development.dart`, `main_staging.dart`, `main_production.dart`) sets environment + feature flags.
2. `initDependencies()` registers all dependencies in GetIt (`sl`).
3. `App` starts with router + global BLoCs.
4. Feature pages consume BLoCs/use cases wired from DI.

## Loyalty / Reward Concept

Reward integration uses the local `loyalty` SDK package:
- SDK initialization is done inside `initDependencies()`.
- Native channel initialization is attempted safely (`LoyaltyMethodChannel.initializeSDK`) with fallback logging if native layer is unavailable.
- `RewardPage` now loads reward/profile data from loyalty SDK on button click using:
  - `LoyaltyMethodChannel.getUserProfile()`
  - `LoyaltyMethodChannel.calculatePoints(...)`

This keeps Reward as an SDK-backed concept instead of static mock cards.

## Flavor Setup

Android product flavors are configured in `android/app/build.gradle.kts`:
- `dev`
- `staging`
- `prod`

Use these run/build commands:

```bash
flutter run --flavor dev --target lib/main_development.dart
flutter run --flavor staging --target lib/main_staging.dart
flutter run --flavor prod --target lib/main_production.dart
```

```bash
flutter build apk --debug --flavor dev --target lib/main_development.dart
flutter build apk --release --flavor prod --target lib/main_production.dart
```

## Important Notes

- Default `main.dart` points to development.
- Feature flags currently control mock vs remote behavior via `use_mock_data`.
- Loyalty dependency is vendored locally at `packages/loyalty` (path dependency) so plugin fixes are stable for this repo.

## Key Files To Remember

- `lib/src/init_dependencies.dart`
- `lib/src/core/environment/app_environment.dart`
- `lib/src/core/environment/default_flags.dart`
- `lib/src/features/profile/presentation/pages/sections/reward_page.dart`
- `lib/src/core/routes/app_router.dart`
- `android/app/build.gradle.kts`
- `pubspec.yaml`
