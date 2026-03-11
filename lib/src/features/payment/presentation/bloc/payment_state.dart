import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:merova/src/core/enums/app_enum.dart';
import '../../domain/entity/payment_entity.dart';

part 'payment_state.freezed.dart';

enum PaymentStatus { initial, loading, loaded, success, error }

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState({
    required PaymentStatus status,
    @Default(PaymentStep.selectCategory) PaymentStep currentStep,
    List<PaymentCategoryEntity>? categories,
    List<PaymentServiceEntity>? services,
    PaymentCategoryEntity? selectedCategory,
    PaymentServiceEntity? selectedService,
    double? amount,
    String? accountIdentifier,
    Map<String, dynamic>? paymentResult,
    String? message,
  }) = _PaymentState;

  factory PaymentState.initial() =>
      const PaymentState(status: PaymentStatus.initial);
}
