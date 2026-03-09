import 'package:flutter_bloc/flutter_bloc.dart';
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
    on<Pay>(_onPay);
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
