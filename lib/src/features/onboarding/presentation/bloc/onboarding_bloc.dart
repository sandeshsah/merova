import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingState(currentPage: 0)) {
    on<NextPageEvent>((event, emit) {
      int nextPage = state.currentPage + 1;
      if (nextPage >= 3) nextPage = 2;
      emit(OnboardingState(currentPage: nextPage));
    });

    on<PreviousPageEvent>((event, emit) {
      int prevPage = state.currentPage - 1;
      if (prevPage < 0) prevPage = 0;
      emit(OnboardingState(currentPage: prevPage));
    });

    on<GoToPageEvent>((event, emit) {
      emit(OnboardingState(currentPage: event.page));
    });
  }
}
