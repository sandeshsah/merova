import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/payment_entity.dart';

part 'payment_event.freezed.dart';

@freezed
class PaymentEvent with _$PaymentEvent {
  const factory PaymentEvent.fetchCategories() = FetchCategories;
  const factory PaymentEvent.fetchServices({required String categoryId}) =
      FetchServices;
  const factory PaymentEvent.pay({required PaymentRequestEntity request}) = Pay;
}
