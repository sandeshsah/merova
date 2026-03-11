import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:merova/src/core/enums/app_enum.dart';
import '../../domain/entity/transfer_entity.dart';

part 'fund_transfer_state.freezed.dart';


@freezed
class FundTransferState with _$FundTransferState {
  const factory FundTransferState({
    required FundTransferStatus status,
    required TransferStep currentStep,
    TransferType? selectedType,
    List<TransferContactEntity>? contacts,
    TransferResponseEntity? result,
    String? message,

    // Transfer Details
    String? sourceAccount,
    TransferContactEntity? selectedBeneficiary,
    String? accountNumber,
    double? amount,
    String? remarks,
    String? bankName,
    String? otherBankMethod, // BEFTN, NPSB, RTGS
    // Verification
    VerificationMethod? verificationMethod,
    @Default('') String pin,
  }) = _FundTransferState;

  factory FundTransferState.initial() => const FundTransferState(
    status: FundTransferStatus.initial,
    currentStep: TransferStep.selectOption,
  );
}
