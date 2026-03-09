import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usescase/get_recent_contacts_usecase.dart';
import '../../domain/usescase/perform_transfer_usecase.dart';
import 'fund_transfer_event.dart';
import 'fund_transfer_state.dart';
import '../../domain/entity/transfer_entity.dart';

class FundTransferBloc extends Bloc<FundTransferEvent, FundTransferState> {
  final GetRecentContactsUseCase getRecentContactsUseCase;
  final PerformTransferUseCase performTransferUseCase;

  FundTransferBloc({
    required this.getRecentContactsUseCase,
    required this.performTransferUseCase,
  }) : super(FundTransferState.initial()) {
    on<FetchRecentContacts>(_onFetchRecentContacts);
    on<NextStep>(_onNextStep);
    on<PreviousStep>(_onPreviousStep);
    on<SelectTransferType>(_onSelectTransferType);
    on<UpdateDetails>(_onUpdateDetails);
    on<SelectVerificationMethod>(_onSelectVerificationMethod);
    on<UpdatePin>(_onUpdatePin);
    on<PerformTransfer>(_onPerformTransfer);
    on<ResetTransfer>(_onResetTransfer);
  }

  Future<void> _onFetchRecentContacts(
    FetchRecentContacts event,
    Emitter<FundTransferState> emit,
  ) async {
    emit(state.copyWith(status: FundTransferStatus.loading));
    try {
      final contacts = await getRecentContactsUseCase();
      emit(
        state.copyWith(status: FundTransferStatus.loaded, contacts: contacts),
      );
    } catch (e) {
      emit(
        state.copyWith(status: FundTransferStatus.error, message: e.toString()),
      );
    }
  }

  void _onNextStep(NextStep event, Emitter<FundTransferState> emit) {
    final nextStep = _getNextStep(state.currentStep);
    emit(state.copyWith(currentStep: nextStep));
  }

  void _onPreviousStep(PreviousStep event, Emitter<FundTransferState> emit) {
    final prevStep = _getPreviousStep(state.currentStep);
    emit(state.copyWith(currentStep: prevStep));
  }

  void _onSelectTransferType(
    SelectTransferType event,
    Emitter<FundTransferState> emit,
  ) {
    emit(
      state.copyWith(
        selectedType: event.type,
        currentStep: TransferStep.enterDetails,
      ),
    );
  }

  void _onUpdateDetails(UpdateDetails event, Emitter<FundTransferState> emit) {
    emit(
      state.copyWith(
        sourceAccount: event.sourceAccount ?? state.sourceAccount,
        selectedBeneficiary:
            event.selectedBeneficiary ?? state.selectedBeneficiary,
        accountNumber: event.accountNumber ?? state.accountNumber,
        amount: event.amount ?? state.amount,
        remarks: event.remarks ?? state.remarks,
        bankName: event.bankName ?? state.bankName,
        otherBankMethod: event.otherBankMethod ?? state.otherBankMethod,
      ),
    );
  }

  void _onSelectVerificationMethod(
    SelectVerificationMethod event,
    Emitter<FundTransferState> emit,
  ) {
    emit(state.copyWith(verificationMethod: event.method));
  }

  void _onUpdatePin(UpdatePin event, Emitter<FundTransferState> emit) {
    emit(state.copyWith(pin: event.pin));
  }

  Future<void> _onPerformTransfer(
    PerformTransfer event,
    Emitter<FundTransferState> emit,
  ) async {
    emit(state.copyWith(status: FundTransferStatus.loading));
    try {
      final result = await performTransferUseCase(event.request);
      emit(
        state.copyWith(
          status: FundTransferStatus.success,
          result: result,
          currentStep: TransferStep.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: FundTransferStatus.error, message: e.toString()),
      );
    }
  }

  void _onResetTransfer(ResetTransfer event, Emitter<FundTransferState> emit) {
    emit(FundTransferState.initial());
  }

  TransferStep _getNextStep(TransferStep current) {
    switch (current) {
      case TransferStep.selectOption:
        return TransferStep.enterDetails;
      case TransferStep.enterDetails:
        return TransferStep.overview;
      case TransferStep.overview:
        return TransferStep.pinVerification;
      case TransferStep.pinVerification:
        return TransferStep.success;
      case TransferStep.success:
        return TransferStep.success;
    }
  }

  TransferStep _getPreviousStep(TransferStep current) {
    switch (current) {
      case TransferStep.selectOption:
        return TransferStep.selectOption;
      case TransferStep.enterDetails:
        return TransferStep.selectOption;
      case TransferStep.overview:
        return TransferStep.enterDetails;
      case TransferStep.pinVerification:
        return TransferStep.overview;
      case TransferStep.success:
        return TransferStep.overview;
    }
  }
}
