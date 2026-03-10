import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merova/src/core/enums/app_enum.dart';
import '../../domain/usescase/get_payment_categories_usecase.dart';
import '../../domain/usescase/get_payment_services_usecase.dart';
import '../../domain/usescase/process_payment_usecase.dart';
import 'payment_event.dart';
import 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final GetPaymentCategoriesUseCase getCategoriesUseCase;
  final GetPaymentServicesUseCase getServicesUseCase;
  final ProcessPaymentUseCase processPaymentUseCase;

  PaymentBloc({
    required this.getCategoriesUseCase,
    required this.getServicesUseCase,
    required this.processPaymentUseCase,
  }) : super(PaymentState.initial()) {
    on<FetchCategories>(_onFetchCategories);
    on<FetchServices>(_onFetchServices);
    on<SelectCategory>(_onSelectCategory);
    on<SelectService>(_onSelectService);
    on<UpdatePaymentDetails>(_onUpdatePaymentDetails);
    on<NextStep>(_onNextStep);
    on<PreviousStep>(_onPreviousStep);
    on<Pay>(_onPay);
  }

  void _onSelectCategory(SelectCategory event, Emitter<PaymentState> emit) {
    debugPrint("PaymentBloc: SelectCategory triggered for ${event.category.name}");
    emit(state.copyWith(
      selectedCategory: event.category,
      currentStep: PaymentStep.selectService,
      status: PaymentStatus.loaded,
    ));
    add(FetchServices(categoryId: event.category.id));
  }

  void _onSelectService(SelectService event, Emitter<PaymentState> emit) {
    emit(state.copyWith(
      selectedService: event.service,
      currentStep: PaymentStep.enterDetails,
    ));
  }

  void _onUpdatePaymentDetails(
    UpdatePaymentDetails event,
    Emitter<PaymentState> emit,
  ) {
    emit(state.copyWith(
      amount: event.amount ?? state.amount,
      accountIdentifier: event.accountIdentifier ?? state.accountIdentifier,
    ));
  }

  void _onNextStep(NextStep event, Emitter<PaymentState> emit) {
    final nextStep = _getNextStep(state.currentStep);
    emit(state.copyWith(currentStep: nextStep));
  }

  void _onPreviousStep(PreviousStep event, Emitter<PaymentState> emit) {
    final prevStep = _getPreviousStep(state.currentStep);
    emit(state.copyWith(currentStep: prevStep));
  }

  PaymentStep _getNextStep(PaymentStep current) {
    switch (current) {
      case PaymentStep.selectCategory:
        return PaymentStep.selectService;
      case PaymentStep.selectService:
        return PaymentStep.enterDetails;
      case PaymentStep.enterDetails:
        return PaymentStep.overview;
      case PaymentStep.overview:
        return PaymentStep.pinVerification;
      case PaymentStep.pinVerification:
        return PaymentStep.success;
      case PaymentStep.success:
        return PaymentStep.success;
    }
  }

  PaymentStep _getPreviousStep(PaymentStep current) {
    switch (current) {
      case PaymentStep.selectCategory:
        return PaymentStep.selectCategory;
      case PaymentStep.selectService:
        return PaymentStep.selectCategory;
      case PaymentStep.enterDetails:
        return PaymentStep.selectService;
      case PaymentStep.overview:
        return PaymentStep.enterDetails;
      case PaymentStep.pinVerification:
        return PaymentStep.overview;
      case PaymentStep.success:
        return PaymentStep.overview;
    }
  }

  Future<void> _onFetchCategories(
    FetchCategories event,
    Emitter<PaymentState> emit,
  ) async {
    emit(state.copyWith(status: PaymentStatus.loading));
    try {
      final categories = await getCategoriesUseCase();
      emit(
        state.copyWith(status: PaymentStatus.loaded, categories: categories),
      );
    } catch (e) {
      emit(state.copyWith(status: PaymentStatus.error, message: e.toString()));
    }
  }

  Future<void> _onFetchServices(
    FetchServices event,
    Emitter<PaymentState> emit,
  ) async {
    emit(state.copyWith(status: PaymentStatus.loading));
    try {
      final services = await getServicesUseCase(event.categoryId);
      emit(state.copyWith(status: PaymentStatus.loaded, services: services));
    } catch (e) {
      emit(state.copyWith(status: PaymentStatus.error, message: e.toString()));
    }
  }

  Future<void> _onPay(Pay event, Emitter<PaymentState> emit) async {
    debugPrint("PaymentBloc: Processing payment for request: ${event.request}");
    emit(state.copyWith(status: PaymentStatus.loading));
    try {
      final result = await processPaymentUseCase(event.request);
      emit(
        state.copyWith(status: PaymentStatus.success, paymentResult: result),
      );
    } catch (e) {
      emit(state.copyWith(status: PaymentStatus.error, message: e.toString()));
    }
  }
}
