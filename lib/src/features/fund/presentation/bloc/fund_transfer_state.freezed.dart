// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fund_transfer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FundTransferState {
  FundTransferStatus get status => throw _privateConstructorUsedError;
  TransferStep get currentStep => throw _privateConstructorUsedError;
  TransferType? get selectedType => throw _privateConstructorUsedError;
  List<TransferContactEntity>? get contacts =>
      throw _privateConstructorUsedError;
  TransferResponseEntity? get result => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError; // Transfer Details
  String? get sourceAccount => throw _privateConstructorUsedError;
  TransferContactEntity? get selectedBeneficiary =>
      throw _privateConstructorUsedError;
  String? get accountNumber => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  String? get remarks => throw _privateConstructorUsedError;
  String? get bankName => throw _privateConstructorUsedError;
  String? get otherBankMethod =>
      throw _privateConstructorUsedError; // BEFTN, NPSB, RTGS
// Verification
  VerificationMethod? get verificationMethod =>
      throw _privateConstructorUsedError;
  String get pin => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FundTransferStateCopyWith<FundTransferState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FundTransferStateCopyWith<$Res> {
  factory $FundTransferStateCopyWith(
          FundTransferState value, $Res Function(FundTransferState) then) =
      _$FundTransferStateCopyWithImpl<$Res, FundTransferState>;
  @useResult
  $Res call(
      {FundTransferStatus status,
      TransferStep currentStep,
      TransferType? selectedType,
      List<TransferContactEntity>? contacts,
      TransferResponseEntity? result,
      String? message,
      String? sourceAccount,
      TransferContactEntity? selectedBeneficiary,
      String? accountNumber,
      double? amount,
      String? remarks,
      String? bankName,
      String? otherBankMethod,
      VerificationMethod? verificationMethod,
      String pin});
}

/// @nodoc
class _$FundTransferStateCopyWithImpl<$Res, $Val extends FundTransferState>
    implements $FundTransferStateCopyWith<$Res> {
  _$FundTransferStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? currentStep = null,
    Object? selectedType = freezed,
    Object? contacts = freezed,
    Object? result = freezed,
    Object? message = freezed,
    Object? sourceAccount = freezed,
    Object? selectedBeneficiary = freezed,
    Object? accountNumber = freezed,
    Object? amount = freezed,
    Object? remarks = freezed,
    Object? bankName = freezed,
    Object? otherBankMethod = freezed,
    Object? verificationMethod = freezed,
    Object? pin = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FundTransferStatus,
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as TransferStep,
      selectedType: freezed == selectedType
          ? _value.selectedType
          : selectedType // ignore: cast_nullable_to_non_nullable
              as TransferType?,
      contacts: freezed == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<TransferContactEntity>?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as TransferResponseEntity?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
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
      verificationMethod: freezed == verificationMethod
          ? _value.verificationMethod
          : verificationMethod // ignore: cast_nullable_to_non_nullable
              as VerificationMethod?,
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FundTransferStateImplCopyWith<$Res>
    implements $FundTransferStateCopyWith<$Res> {
  factory _$$FundTransferStateImplCopyWith(_$FundTransferStateImpl value,
          $Res Function(_$FundTransferStateImpl) then) =
      __$$FundTransferStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FundTransferStatus status,
      TransferStep currentStep,
      TransferType? selectedType,
      List<TransferContactEntity>? contacts,
      TransferResponseEntity? result,
      String? message,
      String? sourceAccount,
      TransferContactEntity? selectedBeneficiary,
      String? accountNumber,
      double? amount,
      String? remarks,
      String? bankName,
      String? otherBankMethod,
      VerificationMethod? verificationMethod,
      String pin});
}

/// @nodoc
class __$$FundTransferStateImplCopyWithImpl<$Res>
    extends _$FundTransferStateCopyWithImpl<$Res, _$FundTransferStateImpl>
    implements _$$FundTransferStateImplCopyWith<$Res> {
  __$$FundTransferStateImplCopyWithImpl(_$FundTransferStateImpl _value,
      $Res Function(_$FundTransferStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? currentStep = null,
    Object? selectedType = freezed,
    Object? contacts = freezed,
    Object? result = freezed,
    Object? message = freezed,
    Object? sourceAccount = freezed,
    Object? selectedBeneficiary = freezed,
    Object? accountNumber = freezed,
    Object? amount = freezed,
    Object? remarks = freezed,
    Object? bankName = freezed,
    Object? otherBankMethod = freezed,
    Object? verificationMethod = freezed,
    Object? pin = null,
  }) {
    return _then(_$FundTransferStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FundTransferStatus,
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as TransferStep,
      selectedType: freezed == selectedType
          ? _value.selectedType
          : selectedType // ignore: cast_nullable_to_non_nullable
              as TransferType?,
      contacts: freezed == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<TransferContactEntity>?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as TransferResponseEntity?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
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
      verificationMethod: freezed == verificationMethod
          ? _value.verificationMethod
          : verificationMethod // ignore: cast_nullable_to_non_nullable
              as VerificationMethod?,
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FundTransferStateImpl implements _FundTransferState {
  const _$FundTransferStateImpl(
      {required this.status,
      required this.currentStep,
      this.selectedType,
      final List<TransferContactEntity>? contacts,
      this.result,
      this.message,
      this.sourceAccount,
      this.selectedBeneficiary,
      this.accountNumber,
      this.amount,
      this.remarks,
      this.bankName,
      this.otherBankMethod,
      this.verificationMethod,
      this.pin = ''})
      : _contacts = contacts;

  @override
  final FundTransferStatus status;
  @override
  final TransferStep currentStep;
  @override
  final TransferType? selectedType;
  final List<TransferContactEntity>? _contacts;
  @override
  List<TransferContactEntity>? get contacts {
    final value = _contacts;
    if (value == null) return null;
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final TransferResponseEntity? result;
  @override
  final String? message;
// Transfer Details
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
// BEFTN, NPSB, RTGS
// Verification
  @override
  final VerificationMethod? verificationMethod;
  @override
  @JsonKey()
  final String pin;

  @override
  String toString() {
    return 'FundTransferState(status: $status, currentStep: $currentStep, selectedType: $selectedType, contacts: $contacts, result: $result, message: $message, sourceAccount: $sourceAccount, selectedBeneficiary: $selectedBeneficiary, accountNumber: $accountNumber, amount: $amount, remarks: $remarks, bankName: $bankName, otherBankMethod: $otherBankMethod, verificationMethod: $verificationMethod, pin: $pin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FundTransferStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.selectedType, selectedType) ||
                other.selectedType == selectedType) &&
            const DeepCollectionEquality().equals(other._contacts, _contacts) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.message, message) || other.message == message) &&
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
                other.otherBankMethod == otherBankMethod) &&
            (identical(other.verificationMethod, verificationMethod) ||
                other.verificationMethod == verificationMethod) &&
            (identical(other.pin, pin) || other.pin == pin));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      currentStep,
      selectedType,
      const DeepCollectionEquality().hash(_contacts),
      result,
      message,
      sourceAccount,
      selectedBeneficiary,
      accountNumber,
      amount,
      remarks,
      bankName,
      otherBankMethod,
      verificationMethod,
      pin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FundTransferStateImplCopyWith<_$FundTransferStateImpl> get copyWith =>
      __$$FundTransferStateImplCopyWithImpl<_$FundTransferStateImpl>(
          this, _$identity);
}

abstract class _FundTransferState implements FundTransferState {
  const factory _FundTransferState(
      {required final FundTransferStatus status,
      required final TransferStep currentStep,
      final TransferType? selectedType,
      final List<TransferContactEntity>? contacts,
      final TransferResponseEntity? result,
      final String? message,
      final String? sourceAccount,
      final TransferContactEntity? selectedBeneficiary,
      final String? accountNumber,
      final double? amount,
      final String? remarks,
      final String? bankName,
      final String? otherBankMethod,
      final VerificationMethod? verificationMethod,
      final String pin}) = _$FundTransferStateImpl;

  @override
  FundTransferStatus get status;
  @override
  TransferStep get currentStep;
  @override
  TransferType? get selectedType;
  @override
  List<TransferContactEntity>? get contacts;
  @override
  TransferResponseEntity? get result;
  @override
  String? get message;
  @override // Transfer Details
  String? get sourceAccount;
  @override
  TransferContactEntity? get selectedBeneficiary;
  @override
  String? get accountNumber;
  @override
  double? get amount;
  @override
  String? get remarks;
  @override
  String? get bankName;
  @override
  String? get otherBankMethod;
  @override // BEFTN, NPSB, RTGS
// Verification
  VerificationMethod? get verificationMethod;
  @override
  String get pin;
  @override
  @JsonKey(ignore: true)
  _$$FundTransferStateImplCopyWith<_$FundTransferStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
