import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:merova/src/core/enums/app_enum.dart';
import 'fund_transfer_state.dart';
import '../../domain/entity/transfer_entity.dart';

part 'fund_transfer_event.freezed.dart';

@freezed
class FundTransferEvent with _$FundTransferEvent {
  const factory FundTransferEvent.fetchRecentContacts() = FetchRecentContacts;

  const factory FundTransferEvent.nextStep() = NextStep;
  const factory FundTransferEvent.previousStep() = PreviousStep;
  const factory FundTransferEvent.selectTransferType(TransferType type) =
      SelectTransferType;

  const factory FundTransferEvent.updateDetails({
    String? sourceAccount,
    TransferContactEntity? selectedBeneficiary,
    String? accountNumber,
    double? amount,
    String? remarks,
    String? bankName,
    String? otherBankMethod,
  }) = UpdateDetails;

  const factory FundTransferEvent.selectVerificationMethod(
    VerificationMethod method,
  ) = SelectVerificationMethod;
  const factory FundTransferEvent.updatePin(String pin) = UpdatePin;

  const factory FundTransferEvent.performTransfer({
    required TransferRequestEntity request,
  }) = PerformTransfer;
  const factory FundTransferEvent.reset() = ResetTransfer;
}
