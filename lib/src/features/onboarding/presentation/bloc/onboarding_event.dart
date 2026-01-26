part of 'onboarding_bloc.dart';

abstract class OnboardingEvent {}

class NextPageEvent extends OnboardingEvent {}

class PreviousPageEvent extends OnboardingEvent {}

class GoToPageEvent extends OnboardingEvent {
  final int page;
  GoToPageEvent({required this.page});
}
