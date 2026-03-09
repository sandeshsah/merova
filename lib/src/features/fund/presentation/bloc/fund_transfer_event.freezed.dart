// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fund_transfer_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FundTransferEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRecentContacts,
    required TResult Function() nextStep,
    required TResult Function() previousStep,
    required TResult Function(TransferType type) selectTransferType,
    required TResult Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)
        updateDetails,
    required TResult Function(VerificationMethod method)
        selectVerificationMethod,
    required TResult Function(String pin) updatePin,
    required TResult Function(TransferRequestEntity request) performTransfer,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRecentContacts,
    TResult? Function()? nextStep,
    TResult? Function()? previousStep,
    TResult? Function(TransferType type)? selectTransferType,
    TResult? Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)?
        updateDetails,
    TResult? Function(VerificationMethod method)? selectVerificationMethod,
    TResult? Function(String pin)? updatePin,
    TResult? Function(TransferRequestEntity request)? performTransfer,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRecentContacts,
    TResult Function()? nextStep,
    TResult Function()? previousStep,
    TResult Function(TransferType type)? selectTransferType,
    TResult Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)?
        updateDetails,
    TResult Function(VerificationMethod method)? selectVerificationMethod,
    TResult Function(String pin)? updatePin,
    TResult Function(TransferRequestEntity request)? performTransfer,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchRecentContacts value) fetchRecentContacts,
    required TResult Function(NextStep value) nextStep,
    required TResult Function(PreviousStep value) previousStep,
    required TResult Function(SelectTransferType value) selectTransferType,
    required TResult Function(UpdateDetails value) updateDetails,
    required TResult Function(SelectVerificationMethod value)
        selectVerificationMethod,
    required TResult Function(UpdatePin value) updatePin,
    required TResult Function(PerformTransfer value) performTransfer,
    required TResult Function(ResetTransfer value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchRecentContacts value)? fetchRecentContacts,
    TResult? Function(NextStep value)? nextStep,
    TResult? Function(PreviousStep value)? previousStep,
    TResult? Function(SelectTransferType value)? selectTransferType,
    TResult? Function(UpdateDetails value)? updateDetails,
    TResult? Function(SelectVerificationMethod value)? selectVerificationMethod,
    TResult? Function(UpdatePin value)? updatePin,
    TResult? Function(PerformTransfer value)? performTransfer,
    TResult? Function(ResetTransfer value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchRecentContacts value)? fetchRecentContacts,
    TResult Function(NextStep value)? nextStep,
    TResult Function(PreviousStep value)? previousStep,
    TResult Function(SelectTransferType value)? selectTransferType,
    TResult Function(UpdateDetails value)? updateDetails,
    TResult Function(SelectVerificationMethod value)? selectVerificationMethod,
    TResult Function(UpdatePin value)? updatePin,
    TResult Function(PerformTransfer value)? performTransfer,
    TResult Function(ResetTransfer value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FundTransferEventCopyWith<$Res> {
  factory $FundTransferEventCopyWith(
          FundTransferEvent value, $Res Function(FundTransferEvent) then) =
      _$FundTransferEventCopyWithImpl<$Res, FundTransferEvent>;
}

/// @nodoc
class _$FundTransferEventCopyWithImpl<$Res, $Val extends FundTransferEvent>
    implements $FundTransferEventCopyWith<$Res> {
  _$FundTransferEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchRecentContactsImplCopyWith<$Res> {
  factory _$$FetchRecentContactsImplCopyWith(_$FetchRecentContactsImpl value,
          $Res Function(_$FetchRecentContactsImpl) then) =
      __$$FetchRecentContactsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchRecentContactsImplCopyWithImpl<$Res>
    extends _$FundTransferEventCopyWithImpl<$Res, _$FetchRecentContactsImpl>
    implements _$$FetchRecentContactsImplCopyWith<$Res> {
  __$$FetchRecentContactsImplCopyWithImpl(_$FetchRecentContactsImpl _value,
      $Res Function(_$FetchRecentContactsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchRecentContactsImpl implements FetchRecentContacts {
  const _$FetchRecentContactsImpl();

  @override
  String toString() {
    return 'FundTransferEvent.fetchRecentContacts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchRecentContactsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRecentContacts,
    required TResult Function() nextStep,
    required TResult Function() previousStep,
    required TResult Function(TransferType type) selectTransferType,
    required TResult Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)
        updateDetails,
    required TResult Function(VerificationMethod method)
        selectVerificationMethod,
    required TResult Function(String pin) updatePin,
    required TResult Function(TransferRequestEntity request) performTransfer,
    required TResult Function() reset,
  }) {
    return fetchRecentContacts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRecentContacts,
    TResult? Function()? nextStep,
    TResult? Function()? previousStep,
    TResult? Function(TransferType type)? selectTransferType,
    TResult? Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)?
        updateDetails,
    TResult? Function(VerificationMethod method)? selectVerificationMethod,
    TResult? Function(String pin)? updatePin,
    TResult? Function(TransferRequestEntity request)? performTransfer,
    TResult? Function()? reset,
  }) {
    return fetchRecentContacts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRecentContacts,
    TResult Function()? nextStep,
    TResult Function()? previousStep,
    TResult Function(TransferType type)? selectTransferType,
    TResult Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)?
        updateDetails,
    TResult Function(VerificationMethod method)? selectVerificationMethod,
    TResult Function(String pin)? updatePin,
    TResult Function(TransferRequestEntity request)? performTransfer,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (fetchRecentContacts != null) {
      return fetchRecentContacts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchRecentContacts value) fetchRecentContacts,
    required TResult Function(NextStep value) nextStep,
    required TResult Function(PreviousStep value) previousStep,
    required TResult Function(SelectTransferType value) selectTransferType,
    required TResult Function(UpdateDetails value) updateDetails,
    required TResult Function(SelectVerificationMethod value)
        selectVerificationMethod,
    required TResult Function(UpdatePin value) updatePin,
    required TResult Function(PerformTransfer value) performTransfer,
    required TResult Function(ResetTransfer value) reset,
  }) {
    return fetchRecentContacts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchRecentContacts value)? fetchRecentContacts,
    TResult? Function(NextStep value)? nextStep,
    TResult? Function(PreviousStep value)? previousStep,
    TResult? Function(SelectTransferType value)? selectTransferType,
    TResult? Function(UpdateDetails value)? updateDetails,
    TResult? Function(SelectVerificationMethod value)? selectVerificationMethod,
    TResult? Function(UpdatePin value)? updatePin,
    TResult? Function(PerformTransfer value)? performTransfer,
    TResult? Function(ResetTransfer value)? reset,
  }) {
    return fetchRecentContacts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchRecentContacts value)? fetchRecentContacts,
    TResult Function(NextStep value)? nextStep,
    TResult Function(PreviousStep value)? previousStep,
    TResult Function(SelectTransferType value)? selectTransferType,
    TResult Function(UpdateDetails value)? updateDetails,
    TResult Function(SelectVerificationMethod value)? selectVerificationMethod,
    TResult Function(UpdatePin value)? updatePin,
    TResult Function(PerformTransfer value)? performTransfer,
    TResult Function(ResetTransfer value)? reset,
    required TResult orElse(),
  }) {
    if (fetchRecentContacts != null) {
      return fetchRecentContacts(this);
    }
    return orElse();
  }
}

abstract class FetchRecentContacts implements FundTransferEvent {
  const factory FetchRecentContacts() = _$FetchRecentContactsImpl;
}

/// @nodoc
abstract class _$$NextStepImplCopyWith<$Res> {
  factory _$$NextStepImplCopyWith(
          _$NextStepImpl value, $Res Function(_$NextStepImpl) then) =
      __$$NextStepImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NextStepImplCopyWithImpl<$Res>
    extends _$FundTransferEventCopyWithImpl<$Res, _$NextStepImpl>
    implements _$$NextStepImplCopyWith<$Res> {
  __$$NextStepImplCopyWithImpl(
      _$NextStepImpl _value, $Res Function(_$NextStepImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NextStepImpl implements NextStep {
  const _$NextStepImpl();

  @override
  String toString() {
    return 'FundTransferEvent.nextStep()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NextStepImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRecentContacts,
    required TResult Function() nextStep,
    required TResult Function() previousStep,
    required TResult Function(TransferType type) selectTransferType,
    required TResult Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)
        updateDetails,
    required TResult Function(VerificationMethod method)
        selectVerificationMethod,
    required TResult Function(String pin) updatePin,
    required TResult Function(TransferRequestEntity request) performTransfer,
    required TResult Function() reset,
  }) {
    return nextStep();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRecentContacts,
    TResult? Function()? nextStep,
    TResult? Function()? previousStep,
    TResult? Function(TransferType type)? selectTransferType,
    TResult? Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)?
        updateDetails,
    TResult? Function(VerificationMethod method)? selectVerificationMethod,
    TResult? Function(String pin)? updatePin,
    TResult? Function(TransferRequestEntity request)? performTransfer,
    TResult? Function()? reset,
  }) {
    return nextStep?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRecentContacts,
    TResult Function()? nextStep,
    TResult Function()? previousStep,
    TResult Function(TransferType type)? selectTransferType,
    TResult Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)?
        updateDetails,
    TResult Function(VerificationMethod method)? selectVerificationMethod,
    TResult Function(String pin)? updatePin,
    TResult Function(TransferRequestEntity request)? performTransfer,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (nextStep != null) {
      return nextStep();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchRecentContacts value) fetchRecentContacts,
    required TResult Function(NextStep value) nextStep,
    required TResult Function(PreviousStep value) previousStep,
    required TResult Function(SelectTransferType value) selectTransferType,
    required TResult Function(UpdateDetails value) updateDetails,
    required TResult Function(SelectVerificationMethod value)
        selectVerificationMethod,
    required TResult Function(UpdatePin value) updatePin,
    required TResult Function(PerformTransfer value) performTransfer,
    required TResult Function(ResetTransfer value) reset,
  }) {
    return nextStep(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchRecentContacts value)? fetchRecentContacts,
    TResult? Function(NextStep value)? nextStep,
    TResult? Function(PreviousStep value)? previousStep,
    TResult? Function(SelectTransferType value)? selectTransferType,
    TResult? Function(UpdateDetails value)? updateDetails,
    TResult? Function(SelectVerificationMethod value)? selectVerificationMethod,
    TResult? Function(UpdatePin value)? updatePin,
    TResult? Function(PerformTransfer value)? performTransfer,
    TResult? Function(ResetTransfer value)? reset,
  }) {
    return nextStep?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchRecentContacts value)? fetchRecentContacts,
    TResult Function(NextStep value)? nextStep,
    TResult Function(PreviousStep value)? previousStep,
    TResult Function(SelectTransferType value)? selectTransferType,
    TResult Function(UpdateDetails value)? updateDetails,
    TResult Function(SelectVerificationMethod value)? selectVerificationMethod,
    TResult Function(UpdatePin value)? updatePin,
    TResult Function(PerformTransfer value)? performTransfer,
    TResult Function(ResetTransfer value)? reset,
    required TResult orElse(),
  }) {
    if (nextStep != null) {
      return nextStep(this);
    }
    return orElse();
  }
}

abstract class NextStep implements FundTransferEvent {
  const factory NextStep() = _$NextStepImpl;
}

/// @nodoc
abstract class _$$PreviousStepImplCopyWith<$Res> {
  factory _$$PreviousStepImplCopyWith(
          _$PreviousStepImpl value, $Res Function(_$PreviousStepImpl) then) =
      __$$PreviousStepImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PreviousStepImplCopyWithImpl<$Res>
    extends _$FundTransferEventCopyWithImpl<$Res, _$PreviousStepImpl>
    implements _$$PreviousStepImplCopyWith<$Res> {
  __$$PreviousStepImplCopyWithImpl(
      _$PreviousStepImpl _value, $Res Function(_$PreviousStepImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PreviousStepImpl implements PreviousStep {
  const _$PreviousStepImpl();

  @override
  String toString() {
    return 'FundTransferEvent.previousStep()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PreviousStepImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRecentContacts,
    required TResult Function() nextStep,
    required TResult Function() previousStep,
    required TResult Function(TransferType type) selectTransferType,
    required TResult Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)
        updateDetails,
    required TResult Function(VerificationMethod method)
        selectVerificationMethod,
    required TResult Function(String pin) updatePin,
    required TResult Function(TransferRequestEntity request) performTransfer,
    required TResult Function() reset,
  }) {
    return previousStep();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRecentContacts,
    TResult? Function()? nextStep,
    TResult? Function()? previousStep,
    TResult? Function(TransferType type)? selectTransferType,
    TResult? Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)?
        updateDetails,
    TResult? Function(VerificationMethod method)? selectVerificationMethod,
    TResult? Function(String pin)? updatePin,
    TResult? Function(TransferRequestEntity request)? performTransfer,
    TResult? Function()? reset,
  }) {
    return previousStep?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRecentContacts,
    TResult Function()? nextStep,
    TResult Function()? previousStep,
    TResult Function(TransferType type)? selectTransferType,
    TResult Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)?
        updateDetails,
    TResult Function(VerificationMethod method)? selectVerificationMethod,
    TResult Function(String pin)? updatePin,
    TResult Function(TransferRequestEntity request)? performTransfer,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (previousStep != null) {
      return previousStep();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchRecentContacts value) fetchRecentContacts,
    required TResult Function(NextStep value) nextStep,
    required TResult Function(PreviousStep value) previousStep,
    required TResult Function(SelectTransferType value) selectTransferType,
    required TResult Function(UpdateDetails value) updateDetails,
    required TResult Function(SelectVerificationMethod value)
        selectVerificationMethod,
    required TResult Function(UpdatePin value) updatePin,
    required TResult Function(PerformTransfer value) performTransfer,
    required TResult Function(ResetTransfer value) reset,
  }) {
    return previousStep(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchRecentContacts value)? fetchRecentContacts,
    TResult? Function(NextStep value)? nextStep,
    TResult? Function(PreviousStep value)? previousStep,
    TResult? Function(SelectTransferType value)? selectTransferType,
    TResult? Function(UpdateDetails value)? updateDetails,
    TResult? Function(SelectVerificationMethod value)? selectVerificationMethod,
    TResult? Function(UpdatePin value)? updatePin,
    TResult? Function(PerformTransfer value)? performTransfer,
    TResult? Function(ResetTransfer value)? reset,
  }) {
    return previousStep?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchRecentContacts value)? fetchRecentContacts,
    TResult Function(NextStep value)? nextStep,
    TResult Function(PreviousStep value)? previousStep,
    TResult Function(SelectTransferType value)? selectTransferType,
    TResult Function(UpdateDetails value)? updateDetails,
    TResult Function(SelectVerificationMethod value)? selectVerificationMethod,
    TResult Function(UpdatePin value)? updatePin,
    TResult Function(PerformTransfer value)? performTransfer,
    TResult Function(ResetTransfer value)? reset,
    required TResult orElse(),
  }) {
    if (previousStep != null) {
      return previousStep(this);
    }
    return orElse();
  }
}

abstract class PreviousStep implements FundTransferEvent {
  const factory PreviousStep() = _$PreviousStepImpl;
}

/// @nodoc
abstract class _$$SelectTransferTypeImplCopyWith<$Res> {
  factory _$$SelectTransferTypeImplCopyWith(_$SelectTransferTypeImpl value,
          $Res Function(_$SelectTransferTypeImpl) then) =
      __$$SelectTransferTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TransferType type});
}

/// @nodoc
class __$$SelectTransferTypeImplCopyWithImpl<$Res>
    extends _$FundTransferEventCopyWithImpl<$Res, _$SelectTransferTypeImpl>
    implements _$$SelectTransferTypeImplCopyWith<$Res> {
  __$$SelectTransferTypeImplCopyWithImpl(_$SelectTransferTypeImpl _value,
      $Res Function(_$SelectTransferTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$SelectTransferTypeImpl(
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransferType,
    ));
  }
}

/// @nodoc

class _$SelectTransferTypeImpl implements SelectTransferType {
  const _$SelectTransferTypeImpl(this.type);

  @override
  final TransferType type;

  @override
  String toString() {
    return 'FundTransferEvent.selectTransferType(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectTransferTypeImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectTransferTypeImplCopyWith<_$SelectTransferTypeImpl> get copyWith =>
      __$$SelectTransferTypeImplCopyWithImpl<_$SelectTransferTypeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRecentContacts,
    required TResult Function() nextStep,
    required TResult Function() previousStep,
    required TResult Function(TransferType type) selectTransferType,
    required TResult Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)
        updateDetails,
    required TResult Function(VerificationMethod method)
        selectVerificationMethod,
    required TResult Function(String pin) updatePin,
    required TResult Function(TransferRequestEntity request) performTransfer,
    required TResult Function() reset,
  }) {
    return selectTransferType(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRecentContacts,
    TResult? Function()? nextStep,
    TResult? Function()? previousStep,
    TResult? Function(TransferType type)? selectTransferType,
    TResult? Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)?
        updateDetails,
    TResult? Function(VerificationMethod method)? selectVerificationMethod,
    TResult? Function(String pin)? updatePin,
    TResult? Function(TransferRequestEntity request)? performTransfer,
    TResult? Function()? reset,
  }) {
    return selectTransferType?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRecentContacts,
    TResult Function()? nextStep,
    TResult Function()? previousStep,
    TResult Function(TransferType type)? selectTransferType,
    TResult Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)?
        updateDetails,
    TResult Function(VerificationMethod method)? selectVerificationMethod,
    TResult Function(String pin)? updatePin,
    TResult Function(TransferRequestEntity request)? performTransfer,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (selectTransferType != null) {
      return selectTransferType(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchRecentContacts value) fetchRecentContacts,
    required TResult Function(NextStep value) nextStep,
    required TResult Function(PreviousStep value) previousStep,
    required TResult Function(SelectTransferType value) selectTransferType,
    required TResult Function(UpdateDetails value) updateDetails,
    required TResult Function(SelectVerificationMethod value)
        selectVerificationMethod,
    required TResult Function(UpdatePin value) updatePin,
    required TResult Function(PerformTransfer value) performTransfer,
    required TResult Function(ResetTransfer value) reset,
  }) {
    return selectTransferType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchRecentContacts value)? fetchRecentContacts,
    TResult? Function(NextStep value)? nextStep,
    TResult? Function(PreviousStep value)? previousStep,
    TResult? Function(SelectTransferType value)? selectTransferType,
    TResult? Function(UpdateDetails value)? updateDetails,
    TResult? Function(SelectVerificationMethod value)? selectVerificationMethod,
    TResult? Function(UpdatePin value)? updatePin,
    TResult? Function(PerformTransfer value)? performTransfer,
    TResult? Function(ResetTransfer value)? reset,
  }) {
    return selectTransferType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchRecentContacts value)? fetchRecentContacts,
    TResult Function(NextStep value)? nextStep,
    TResult Function(PreviousStep value)? previousStep,
    TResult Function(SelectTransferType value)? selectTransferType,
    TResult Function(UpdateDetails value)? updateDetails,
    TResult Function(SelectVerificationMethod value)? selectVerificationMethod,
    TResult Function(UpdatePin value)? updatePin,
    TResult Function(PerformTransfer value)? performTransfer,
    TResult Function(ResetTransfer value)? reset,
    required TResult orElse(),
  }) {
    if (selectTransferType != null) {
      return selectTransferType(this);
    }
    return orElse();
  }
}

abstract class SelectTransferType implements FundTransferEvent {
  const factory SelectTransferType(final TransferType type) =
      _$SelectTransferTypeImpl;

  TransferType get type;
  @JsonKey(ignore: true)
  _$$SelectTransferTypeImplCopyWith<_$SelectTransferTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateDetailsImplCopyWith<$Res> {
  factory _$$UpdateDetailsImplCopyWith(
          _$UpdateDetailsImpl value, $Res Function(_$UpdateDetailsImpl) then) =
      __$$UpdateDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? sourceAccount,
      TransferContactEntity? selectedBeneficiary,
      String? accountNumber,
      double? amount,
      String? remarks,
      String? bankName,
      String? otherBankMethod});
}

/// @nodoc
class __$$UpdateDetailsImplCopyWithImpl<$Res>
    extends _$FundTransferEventCopyWithImpl<$Res, _$UpdateDetailsImpl>
    implements _$$UpdateDetailsImplCopyWith<$Res> {
  __$$UpdateDetailsImplCopyWithImpl(
      _$UpdateDetailsImpl _value, $Res Function(_$UpdateDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceAccount = freezed,
    Object? selectedBeneficiary = freezed,
    Object? accountNumber = freezed,
    Object? amount = freezed,
    Object? remarks = freezed,
    Object? bankName = freezed,
    Object? otherBankMethod = freezed,
  }) {
    return _then(_$UpdateDetailsImpl(
      sourceAccount: freezed == sourceAccount
          ? _value.sourceAccount
          : sourceAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedBeneficiary: freezed == selectedBeneficiary
          ? _value.selectedBeneficiary
          : selectedBeneficiary // ignore: cast_nullable_to_non_nullable
              as TransferContactEntity?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      otherBankMethod: freezed == otherBankMethod
          ? _value.otherBankMethod
          : otherBankMethod // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UpdateDetailsImpl implements UpdateDetails {
  const _$UpdateDetailsImpl(
      {this.sourceAccount,
      this.selectedBeneficiary,
      this.accountNumber,
      this.amount,
      this.remarks,
      this.bankName,
      this.otherBankMethod});

  @override
  final String? sourceAccount;
  @override
  final TransferContactEntity? selectedBeneficiary;
  @override
  final String? accountNumber;
  @override
  final double? amount;
  @override
  final String? remarks;
  @override
  final String? bankName;
  @override
  final String? otherBankMethod;

  @override
  String toString() {
    return 'FundTransferEvent.updateDetails(sourceAccount: $sourceAccount, selectedBeneficiary: $selectedBeneficiary, accountNumber: $accountNumber, amount: $amount, remarks: $remarks, bankName: $bankName, otherBankMethod: $otherBankMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDetailsImpl &&
            (identical(other.sourceAccount, sourceAccount) ||
                other.sourceAccount == sourceAccount) &&
            (identical(other.selectedBeneficiary, selectedBeneficiary) ||
                other.selectedBeneficiary == selectedBeneficiary) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.otherBankMethod, otherBankMethod) ||
                other.otherBankMethod == otherBankMethod));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sourceAccount,
      selectedBeneficiary,
      accountNumber,
      amount,
      remarks,
      bankName,
      otherBankMethod);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateDetailsImplCopyWith<_$UpdateDetailsImpl> get copyWith =>
      __$$UpdateDetailsImplCopyWithImpl<_$UpdateDetailsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRecentContacts,
    required TResult Function() nextStep,
    required TResult Function() previousStep,
    required TResult Function(TransferType type) selectTransferType,
    required TResult Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)
        updateDetails,
    required TResult Function(VerificationMethod method)
        selectVerificationMethod,
    required TResult Function(String pin) updatePin,
    required TResult Function(TransferRequestEntity request) performTransfer,
    required TResult Function() reset,
  }) {
    return updateDetails(sourceAccount, selectedBeneficiary, accountNumber,
        amount, remarks, bankName, otherBankMethod);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRecentContacts,
    TResult? Function()? nextStep,
    TResult? Function()? previousStep,
    TResult? Function(TransferType type)? selectTransferType,
    TResult? Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)?
        updateDetails,
    TResult? Function(VerificationMethod method)? selectVerificationMethod,
    TResult? Function(String pin)? updatePin,
    TResult? Function(TransferRequestEntity request)? performTransfer,
    TResult? Function()? reset,
  }) {
    return updateDetails?.call(sourceAccount, selectedBeneficiary,
        accountNumber, amount, remarks, bankName, otherBankMethod);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRecentContacts,
    TResult Function()? nextStep,
    TResult Function()? previousStep,
    TResult Function(TransferType type)? selectTransferType,
    TResult Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)?
        updateDetails,
    TResult Function(VerificationMethod method)? selectVerificationMethod,
    TResult Function(String pin)? updatePin,
    TResult Function(TransferRequestEntity request)? performTransfer,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (updateDetails != null) {
      return updateDetails(sourceAccount, selectedBeneficiary, accountNumber,
          amount, remarks, bankName, otherBankMethod);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchRecentContacts value) fetchRecentContacts,
    required TResult Function(NextStep value) nextStep,
    required TResult Function(PreviousStep value) previousStep,
    required TResult Function(SelectTransferType value) selectTransferType,
    required TResult Function(UpdateDetails value) updateDetails,
    required TResult Function(SelectVerificationMethod value)
        selectVerificationMethod,
    required TResult Function(UpdatePin value) updatePin,
    required TResult Function(PerformTransfer value) performTransfer,
    required TResult Function(ResetTransfer value) reset,
  }) {
    return updateDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchRecentContacts value)? fetchRecentContacts,
    TResult? Function(NextStep value)? nextStep,
    TResult? Function(PreviousStep value)? previousStep,
    TResult? Function(SelectTransferType value)? selectTransferType,
    TResult? Function(UpdateDetails value)? updateDetails,
    TResult? Function(SelectVerificationMethod value)? selectVerificationMethod,
    TResult? Function(UpdatePin value)? updatePin,
    TResult? Function(PerformTransfer value)? performTransfer,
    TResult? Function(ResetTransfer value)? reset,
  }) {
    return updateDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchRecentContacts value)? fetchRecentContacts,
    TResult Function(NextStep value)? nextStep,
    TResult Function(PreviousStep value)? previousStep,
    TResult Function(SelectTransferType value)? selectTransferType,
    TResult Function(UpdateDetails value)? updateDetails,
    TResult Function(SelectVerificationMethod value)? selectVerificationMethod,
    TResult Function(UpdatePin value)? updatePin,
    TResult Function(PerformTransfer value)? performTransfer,
    TResult Function(ResetTransfer value)? reset,
    required TResult orElse(),
  }) {
    if (updateDetails != null) {
      return updateDetails(this);
    }
    return orElse();
  }
}

abstract class UpdateDetails implements FundTransferEvent {
  const factory UpdateDetails(
      {final String? sourceAccount,
      final TransferContactEntity? selectedBeneficiary,
      final String? accountNumber,
      final double? amount,
      final String? remarks,
      final String? bankName,
      final String? otherBankMethod}) = _$UpdateDetailsImpl;

  String? get sourceAccount;
  TransferContactEntity? get selectedBeneficiary;
  String? get accountNumber;
  double? get amount;
  String? get remarks;
  String? get bankName;
  String? get otherBankMethod;
  @JsonKey(ignore: true)
  _$$UpdateDetailsImplCopyWith<_$UpdateDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectVerificationMethodImplCopyWith<$Res> {
  factory _$$SelectVerificationMethodImplCopyWith(
          _$SelectVerificationMethodImpl value,
          $Res Function(_$SelectVerificationMethodImpl) then) =
      __$$SelectVerificationMethodImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VerificationMethod method});
}

/// @nodoc
class __$$SelectVerificationMethodImplCopyWithImpl<$Res>
    extends _$FundTransferEventCopyWithImpl<$Res,
        _$SelectVerificationMethodImpl>
    implements _$$SelectVerificationMethodImplCopyWith<$Res> {
  __$$SelectVerificationMethodImplCopyWithImpl(
      _$SelectVerificationMethodImpl _value,
      $Res Function(_$SelectVerificationMethodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
  }) {
    return _then(_$SelectVerificationMethodImpl(
      null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as VerificationMethod,
    ));
  }
}

/// @nodoc

class _$SelectVerificationMethodImpl implements SelectVerificationMethod {
  const _$SelectVerificationMethodImpl(this.method);

  @override
  final VerificationMethod method;

  @override
  String toString() {
    return 'FundTransferEvent.selectVerificationMethod(method: $method)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectVerificationMethodImpl &&
            (identical(other.method, method) || other.method == method));
  }

  @override
  int get hashCode => Object.hash(runtimeType, method);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectVerificationMethodImplCopyWith<_$SelectVerificationMethodImpl>
      get copyWith => __$$SelectVerificationMethodImplCopyWithImpl<
          _$SelectVerificationMethodImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRecentContacts,
    required TResult Function() nextStep,
    required TResult Function() previousStep,
    required TResult Function(TransferType type) selectTransferType,
    required TResult Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)
        updateDetails,
    required TResult Function(VerificationMethod method)
        selectVerificationMethod,
    required TResult Function(String pin) updatePin,
    required TResult Function(TransferRequestEntity request) performTransfer,
    required TResult Function() reset,
  }) {
    return selectVerificationMethod(method);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRecentContacts,
    TResult? Function()? nextStep,
    TResult? Function()? previousStep,
    TResult? Function(TransferType type)? selectTransferType,
    TResult? Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)?
        updateDetails,
    TResult? Function(VerificationMethod method)? selectVerificationMethod,
    TResult? Function(String pin)? updatePin,
    TResult? Function(TransferRequestEntity request)? performTransfer,
    TResult? Function()? reset,
  }) {
    return selectVerificationMethod?.call(method);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRecentContacts,
    TResult Function()? nextStep,
    TResult Function()? previousStep,
    TResult Function(TransferType type)? selectTransferType,
    TResult Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)?
        updateDetails,
    TResult Function(VerificationMethod method)? selectVerificationMethod,
    TResult Function(String pin)? updatePin,
    TResult Function(TransferRequestEntity request)? performTransfer,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (selectVerificationMethod != null) {
      return selectVerificationMethod(method);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchRecentContacts value) fetchRecentContacts,
    required TResult Function(NextStep value) nextStep,
    required TResult Function(PreviousStep value) previousStep,
    required TResult Function(SelectTransferType value) selectTransferType,
    required TResult Function(UpdateDetails value) updateDetails,
    required TResult Function(SelectVerificationMethod value)
        selectVerificationMethod,
    required TResult Function(UpdatePin value) updatePin,
    required TResult Function(PerformTransfer value) performTransfer,
    required TResult Function(ResetTransfer value) reset,
  }) {
    return selectVerificationMethod(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchRecentContacts value)? fetchRecentContacts,
    TResult? Function(NextStep value)? nextStep,
    TResult? Function(PreviousStep value)? previousStep,
    TResult? Function(SelectTransferType value)? selectTransferType,
    TResult? Function(UpdateDetails value)? updateDetails,
    TResult? Function(SelectVerificationMethod value)? selectVerificationMethod,
    TResult? Function(UpdatePin value)? updatePin,
    TResult? Function(PerformTransfer value)? performTransfer,
    TResult? Function(ResetTransfer value)? reset,
  }) {
    return selectVerificationMethod?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchRecentContacts value)? fetchRecentContacts,
    TResult Function(NextStep value)? nextStep,
    TResult Function(PreviousStep value)? previousStep,
    TResult Function(SelectTransferType value)? selectTransferType,
    TResult Function(UpdateDetails value)? updateDetails,
    TResult Function(SelectVerificationMethod value)? selectVerificationMethod,
    TResult Function(UpdatePin value)? updatePin,
    TResult Function(PerformTransfer value)? performTransfer,
    TResult Function(ResetTransfer value)? reset,
    required TResult orElse(),
  }) {
    if (selectVerificationMethod != null) {
      return selectVerificationMethod(this);
    }
    return orElse();
  }
}

abstract class SelectVerificationMethod implements FundTransferEvent {
  const factory SelectVerificationMethod(final VerificationMethod method) =
      _$SelectVerificationMethodImpl;

  VerificationMethod get method;
  @JsonKey(ignore: true)
  _$$SelectVerificationMethodImplCopyWith<_$SelectVerificationMethodImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePinImplCopyWith<$Res> {
  factory _$$UpdatePinImplCopyWith(
          _$UpdatePinImpl value, $Res Function(_$UpdatePinImpl) then) =
      __$$UpdatePinImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String pin});
}

/// @nodoc
class __$$UpdatePinImplCopyWithImpl<$Res>
    extends _$FundTransferEventCopyWithImpl<$Res, _$UpdatePinImpl>
    implements _$$UpdatePinImplCopyWith<$Res> {
  __$$UpdatePinImplCopyWithImpl(
      _$UpdatePinImpl _value, $Res Function(_$UpdatePinImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pin = null,
  }) {
    return _then(_$UpdatePinImpl(
      null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdatePinImpl implements UpdatePin {
  const _$UpdatePinImpl(this.pin);

  @override
  final String pin;

  @override
  String toString() {
    return 'FundTransferEvent.updatePin(pin: $pin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePinImpl &&
            (identical(other.pin, pin) || other.pin == pin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePinImplCopyWith<_$UpdatePinImpl> get copyWith =>
      __$$UpdatePinImplCopyWithImpl<_$UpdatePinImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRecentContacts,
    required TResult Function() nextStep,
    required TResult Function() previousStep,
    required TResult Function(TransferType type) selectTransferType,
    required TResult Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)
        updateDetails,
    required TResult Function(VerificationMethod method)
        selectVerificationMethod,
    required TResult Function(String pin) updatePin,
    required TResult Function(TransferRequestEntity request) performTransfer,
    required TResult Function() reset,
  }) {
    return updatePin(pin);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRecentContacts,
    TResult? Function()? nextStep,
    TResult? Function()? previousStep,
    TResult? Function(TransferType type)? selectTransferType,
    TResult? Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)?
        updateDetails,
    TResult? Function(VerificationMethod method)? selectVerificationMethod,
    TResult? Function(String pin)? updatePin,
    TResult? Function(TransferRequestEntity request)? performTransfer,
    TResult? Function()? reset,
  }) {
    return updatePin?.call(pin);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRecentContacts,
    TResult Function()? nextStep,
    TResult Function()? previousStep,
    TResult Function(TransferType type)? selectTransferType,
    TResult Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)?
        updateDetails,
    TResult Function(VerificationMethod method)? selectVerificationMethod,
    TResult Function(String pin)? updatePin,
    TResult Function(TransferRequestEntity request)? performTransfer,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (updatePin != null) {
      return updatePin(pin);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchRecentContacts value) fetchRecentContacts,
    required TResult Function(NextStep value) nextStep,
    required TResult Function(PreviousStep value) previousStep,
    required TResult Function(SelectTransferType value) selectTransferType,
    required TResult Function(UpdateDetails value) updateDetails,
    required TResult Function(SelectVerificationMethod value)
        selectVerificationMethod,
    required TResult Function(UpdatePin value) updatePin,
    required TResult Function(PerformTransfer value) performTransfer,
    required TResult Function(ResetTransfer value) reset,
  }) {
    return updatePin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchRecentContacts value)? fetchRecentContacts,
    TResult? Function(NextStep value)? nextStep,
    TResult? Function(PreviousStep value)? previousStep,
    TResult? Function(SelectTransferType value)? selectTransferType,
    TResult? Function(UpdateDetails value)? updateDetails,
    TResult? Function(SelectVerificationMethod value)? selectVerificationMethod,
    TResult? Function(UpdatePin value)? updatePin,
    TResult? Function(PerformTransfer value)? performTransfer,
    TResult? Function(ResetTransfer value)? reset,
  }) {
    return updatePin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchRecentContacts value)? fetchRecentContacts,
    TResult Function(NextStep value)? nextStep,
    TResult Function(PreviousStep value)? previousStep,
    TResult Function(SelectTransferType value)? selectTransferType,
    TResult Function(UpdateDetails value)? updateDetails,
    TResult Function(SelectVerificationMethod value)? selectVerificationMethod,
    TResult Function(UpdatePin value)? updatePin,
    TResult Function(PerformTransfer value)? performTransfer,
    TResult Function(ResetTransfer value)? reset,
    required TResult orElse(),
  }) {
    if (updatePin != null) {
      return updatePin(this);
    }
    return orElse();
  }
}

abstract class UpdatePin implements FundTransferEvent {
  const factory UpdatePin(final String pin) = _$UpdatePinImpl;

  String get pin;
  @JsonKey(ignore: true)
  _$$UpdatePinImplCopyWith<_$UpdatePinImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PerformTransferImplCopyWith<$Res> {
  factory _$$PerformTransferImplCopyWith(_$PerformTransferImpl value,
          $Res Function(_$PerformTransferImpl) then) =
      __$$PerformTransferImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TransferRequestEntity request});
}

/// @nodoc
class __$$PerformTransferImplCopyWithImpl<$Res>
    extends _$FundTransferEventCopyWithImpl<$Res, _$PerformTransferImpl>
    implements _$$PerformTransferImplCopyWith<$Res> {
  __$$PerformTransferImplCopyWithImpl(
      _$PerformTransferImpl _value, $Res Function(_$PerformTransferImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$PerformTransferImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as TransferRequestEntity,
    ));
  }
}

/// @nodoc

class _$PerformTransferImpl implements PerformTransfer {
  const _$PerformTransferImpl({required this.request});

  @override
  final TransferRequestEntity request;

  @override
  String toString() {
    return 'FundTransferEvent.performTransfer(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformTransferImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformTransferImplCopyWith<_$PerformTransferImpl> get copyWith =>
      __$$PerformTransferImplCopyWithImpl<_$PerformTransferImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRecentContacts,
    required TResult Function() nextStep,
    required TResult Function() previousStep,
    required TResult Function(TransferType type) selectTransferType,
    required TResult Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)
        updateDetails,
    required TResult Function(VerificationMethod method)
        selectVerificationMethod,
    required TResult Function(String pin) updatePin,
    required TResult Function(TransferRequestEntity request) performTransfer,
    required TResult Function() reset,
  }) {
    return performTransfer(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRecentContacts,
    TResult? Function()? nextStep,
    TResult? Function()? previousStep,
    TResult? Function(TransferType type)? selectTransferType,
    TResult? Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)?
        updateDetails,
    TResult? Function(VerificationMethod method)? selectVerificationMethod,
    TResult? Function(String pin)? updatePin,
    TResult? Function(TransferRequestEntity request)? performTransfer,
    TResult? Function()? reset,
  }) {
    return performTransfer?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRecentContacts,
    TResult Function()? nextStep,
    TResult Function()? previousStep,
    TResult Function(TransferType type)? selectTransferType,
    TResult Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)?
        updateDetails,
    TResult Function(VerificationMethod method)? selectVerificationMethod,
    TResult Function(String pin)? updatePin,
    TResult Function(TransferRequestEntity request)? performTransfer,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (performTransfer != null) {
      return performTransfer(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchRecentContacts value) fetchRecentContacts,
    required TResult Function(NextStep value) nextStep,
    required TResult Function(PreviousStep value) previousStep,
    required TResult Function(SelectTransferType value) selectTransferType,
    required TResult Function(UpdateDetails value) updateDetails,
    required TResult Function(SelectVerificationMethod value)
        selectVerificationMethod,
    required TResult Function(UpdatePin value) updatePin,
    required TResult Function(PerformTransfer value) performTransfer,
    required TResult Function(ResetTransfer value) reset,
  }) {
    return performTransfer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchRecentContacts value)? fetchRecentContacts,
    TResult? Function(NextStep value)? nextStep,
    TResult? Function(PreviousStep value)? previousStep,
    TResult? Function(SelectTransferType value)? selectTransferType,
    TResult? Function(UpdateDetails value)? updateDetails,
    TResult? Function(SelectVerificationMethod value)? selectVerificationMethod,
    TResult? Function(UpdatePin value)? updatePin,
    TResult? Function(PerformTransfer value)? performTransfer,
    TResult? Function(ResetTransfer value)? reset,
  }) {
    return performTransfer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchRecentContacts value)? fetchRecentContacts,
    TResult Function(NextStep value)? nextStep,
    TResult Function(PreviousStep value)? previousStep,
    TResult Function(SelectTransferType value)? selectTransferType,
    TResult Function(UpdateDetails value)? updateDetails,
    TResult Function(SelectVerificationMethod value)? selectVerificationMethod,
    TResult Function(UpdatePin value)? updatePin,
    TResult Function(PerformTransfer value)? performTransfer,
    TResult Function(ResetTransfer value)? reset,
    required TResult orElse(),
  }) {
    if (performTransfer != null) {
      return performTransfer(this);
    }
    return orElse();
  }
}

abstract class PerformTransfer implements FundTransferEvent {
  const factory PerformTransfer(
      {required final TransferRequestEntity request}) = _$PerformTransferImpl;

  TransferRequestEntity get request;
  @JsonKey(ignore: true)
  _$$PerformTransferImplCopyWith<_$PerformTransferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetTransferImplCopyWith<$Res> {
  factory _$$ResetTransferImplCopyWith(
          _$ResetTransferImpl value, $Res Function(_$ResetTransferImpl) then) =
      __$$ResetTransferImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetTransferImplCopyWithImpl<$Res>
    extends _$FundTransferEventCopyWithImpl<$Res, _$ResetTransferImpl>
    implements _$$ResetTransferImplCopyWith<$Res> {
  __$$ResetTransferImplCopyWithImpl(
      _$ResetTransferImpl _value, $Res Function(_$ResetTransferImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetTransferImpl implements ResetTransfer {
  const _$ResetTransferImpl();

  @override
  String toString() {
    return 'FundTransferEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetTransferImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRecentContacts,
    required TResult Function() nextStep,
    required TResult Function() previousStep,
    required TResult Function(TransferType type) selectTransferType,
    required TResult Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)
        updateDetails,
    required TResult Function(VerificationMethod method)
        selectVerificationMethod,
    required TResult Function(String pin) updatePin,
    required TResult Function(TransferRequestEntity request) performTransfer,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRecentContacts,
    TResult? Function()? nextStep,
    TResult? Function()? previousStep,
    TResult? Function(TransferType type)? selectTransferType,
    TResult? Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)?
        updateDetails,
    TResult? Function(VerificationMethod method)? selectVerificationMethod,
    TResult? Function(String pin)? updatePin,
    TResult? Function(TransferRequestEntity request)? performTransfer,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRecentContacts,
    TResult Function()? nextStep,
    TResult Function()? previousStep,
    TResult Function(TransferType type)? selectTransferType,
    TResult Function(
            String? sourceAccount,
            TransferContactEntity? selectedBeneficiary,
            String? accountNumber,
            double? amount,
            String? remarks,
            String? bankName,
            String? otherBankMethod)?
        updateDetails,
    TResult Function(VerificationMethod method)? selectVerificationMethod,
    TResult Function(String pin)? updatePin,
    TResult Function(TransferRequestEntity request)? performTransfer,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchRecentContacts value) fetchRecentContacts,
    required TResult Function(NextStep value) nextStep,
    required TResult Function(PreviousStep value) previousStep,
    required TResult Function(SelectTransferType value) selectTransferType,
    required TResult Function(UpdateDetails value) updateDetails,
    required TResult Function(SelectVerificationMethod value)
        selectVerificationMethod,
    required TResult Function(UpdatePin value) updatePin,
    required TResult Function(PerformTransfer value) performTransfer,
    required TResult Function(ResetTransfer value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchRecentContacts value)? fetchRecentContacts,
    TResult? Function(NextStep value)? nextStep,
    TResult? Function(PreviousStep value)? previousStep,
    TResult? Function(SelectTransferType value)? selectTransferType,
    TResult? Function(UpdateDetails value)? updateDetails,
    TResult? Function(SelectVerificationMethod value)? selectVerificationMethod,
    TResult? Function(UpdatePin value)? updatePin,
    TResult? Function(PerformTransfer value)? performTransfer,
    TResult? Function(ResetTransfer value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchRecentContacts value)? fetchRecentContacts,
    TResult Function(NextStep value)? nextStep,
    TResult Function(PreviousStep value)? previousStep,
    TResult Function(SelectTransferType value)? selectTransferType,
    TResult Function(UpdateDetails value)? updateDetails,
    TResult Function(SelectVerificationMethod value)? selectVerificationMethod,
    TResult Function(UpdatePin value)? updatePin,
    TResult Function(PerformTransfer value)? performTransfer,
    TResult Function(ResetTransfer value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class ResetTransfer implements FundTransferEvent {
  const factory ResetTransfer() = _$ResetTransferImpl;
}
