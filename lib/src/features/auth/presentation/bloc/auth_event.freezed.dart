// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String identifier, String password)
        loginRequested,
    required TResult Function(
            String fullName, String phoneNumber, String email, String password)
        registerRequested,
    required TResult Function(String identifier, String phoneNumber,
            String email, String phone_otp, String email_otp)
        verifyOtpRequested,
    required TResult Function(String identifier) forgotPasswordRequested,
    required TResult Function(String identifier, String password)
        resetPasswordRequested,
    required TResult Function() logoutRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String identifier, String password)? loginRequested,
    TResult? Function(
            String fullName, String phoneNumber, String email, String password)?
        registerRequested,
    TResult? Function(String identifier, String phoneNumber, String email,
            String phone_otp, String email_otp)?
        verifyOtpRequested,
    TResult? Function(String identifier)? forgotPasswordRequested,
    TResult? Function(String identifier, String password)?
        resetPasswordRequested,
    TResult? Function()? logoutRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String identifier, String password)? loginRequested,
    TResult Function(
            String fullName, String phoneNumber, String email, String password)?
        registerRequested,
    TResult Function(String identifier, String phoneNumber, String email,
            String phone_otp, String email_otp)?
        verifyOtpRequested,
    TResult Function(String identifier)? forgotPasswordRequested,
    TResult Function(String identifier, String password)?
        resetPasswordRequested,
    TResult Function()? logoutRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginRequested value) loginRequested,
    required TResult Function(_RegisterRequested value) registerRequested,
    required TResult Function(_VerifyOtpRequested value) verifyOtpRequested,
    required TResult Function(_ForgotPasswordRequested value)
        forgotPasswordRequested,
    required TResult Function(_ResetPasswordRequested value)
        resetPasswordRequested,
    required TResult Function(_LogoutRequested value) logoutRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginRequested value)? loginRequested,
    TResult? Function(_RegisterRequested value)? registerRequested,
    TResult? Function(_VerifyOtpRequested value)? verifyOtpRequested,
    TResult? Function(_ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult? Function(_ResetPasswordRequested value)? resetPasswordRequested,
    TResult? Function(_LogoutRequested value)? logoutRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegisterRequested value)? registerRequested,
    TResult Function(_VerifyOtpRequested value)? verifyOtpRequested,
    TResult Function(_ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult Function(_ResetPasswordRequested value)? resetPasswordRequested,
    TResult Function(_LogoutRequested value)? logoutRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoginRequestedImplCopyWith<$Res> {
  factory _$$LoginRequestedImplCopyWith(_$LoginRequestedImpl value,
          $Res Function(_$LoginRequestedImpl) then) =
      __$$LoginRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String identifier, String password});
}

/// @nodoc
class __$$LoginRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LoginRequestedImpl>
    implements _$$LoginRequestedImplCopyWith<$Res> {
  __$$LoginRequestedImplCopyWithImpl(
      _$LoginRequestedImpl _value, $Res Function(_$LoginRequestedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? password = null,
  }) {
    return _then(_$LoginRequestedImpl(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginRequestedImpl implements _LoginRequested {
  const _$LoginRequestedImpl(
      {required this.identifier, required this.password});

  @override
  final String identifier;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.loginRequested(identifier: $identifier, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginRequestedImpl &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, identifier, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginRequestedImplCopyWith<_$LoginRequestedImpl> get copyWith =>
      __$$LoginRequestedImplCopyWithImpl<_$LoginRequestedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String identifier, String password)
        loginRequested,
    required TResult Function(
            String fullName, String phoneNumber, String email, String password)
        registerRequested,
    required TResult Function(String identifier, String phoneNumber,
            String email, String phone_otp, String email_otp)
        verifyOtpRequested,
    required TResult Function(String identifier) forgotPasswordRequested,
    required TResult Function(String identifier, String password)
        resetPasswordRequested,
    required TResult Function() logoutRequested,
  }) {
    return loginRequested(identifier, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String identifier, String password)? loginRequested,
    TResult? Function(
            String fullName, String phoneNumber, String email, String password)?
        registerRequested,
    TResult? Function(String identifier, String phoneNumber, String email,
            String phone_otp, String email_otp)?
        verifyOtpRequested,
    TResult? Function(String identifier)? forgotPasswordRequested,
    TResult? Function(String identifier, String password)?
        resetPasswordRequested,
    TResult? Function()? logoutRequested,
  }) {
    return loginRequested?.call(identifier, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String identifier, String password)? loginRequested,
    TResult Function(
            String fullName, String phoneNumber, String email, String password)?
        registerRequested,
    TResult Function(String identifier, String phoneNumber, String email,
            String phone_otp, String email_otp)?
        verifyOtpRequested,
    TResult Function(String identifier)? forgotPasswordRequested,
    TResult Function(String identifier, String password)?
        resetPasswordRequested,
    TResult Function()? logoutRequested,
    required TResult orElse(),
  }) {
    if (loginRequested != null) {
      return loginRequested(identifier, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginRequested value) loginRequested,
    required TResult Function(_RegisterRequested value) registerRequested,
    required TResult Function(_VerifyOtpRequested value) verifyOtpRequested,
    required TResult Function(_ForgotPasswordRequested value)
        forgotPasswordRequested,
    required TResult Function(_ResetPasswordRequested value)
        resetPasswordRequested,
    required TResult Function(_LogoutRequested value) logoutRequested,
  }) {
    return loginRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginRequested value)? loginRequested,
    TResult? Function(_RegisterRequested value)? registerRequested,
    TResult? Function(_VerifyOtpRequested value)? verifyOtpRequested,
    TResult? Function(_ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult? Function(_ResetPasswordRequested value)? resetPasswordRequested,
    TResult? Function(_LogoutRequested value)? logoutRequested,
  }) {
    return loginRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegisterRequested value)? registerRequested,
    TResult Function(_VerifyOtpRequested value)? verifyOtpRequested,
    TResult Function(_ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult Function(_ResetPasswordRequested value)? resetPasswordRequested,
    TResult Function(_LogoutRequested value)? logoutRequested,
    required TResult orElse(),
  }) {
    if (loginRequested != null) {
      return loginRequested(this);
    }
    return orElse();
  }
}

abstract class _LoginRequested implements AuthEvent {
  const factory _LoginRequested(
      {required final String identifier,
      required final String password}) = _$LoginRequestedImpl;

  String get identifier;
  String get password;
  @JsonKey(ignore: true)
  _$$LoginRequestedImplCopyWith<_$LoginRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterRequestedImplCopyWith<$Res> {
  factory _$$RegisterRequestedImplCopyWith(_$RegisterRequestedImpl value,
          $Res Function(_$RegisterRequestedImpl) then) =
      __$$RegisterRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String fullName, String phoneNumber, String email, String password});
}

/// @nodoc
class __$$RegisterRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$RegisterRequestedImpl>
    implements _$$RegisterRequestedImplCopyWith<$Res> {
  __$$RegisterRequestedImplCopyWithImpl(_$RegisterRequestedImpl _value,
      $Res Function(_$RegisterRequestedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$RegisterRequestedImpl(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterRequestedImpl implements _RegisterRequested {
  const _$RegisterRequestedImpl(
      {required this.fullName,
      required this.phoneNumber,
      required this.email,
      required this.password});

  @override
  final String fullName;
  @override
  final String phoneNumber;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.registerRequested(fullName: $fullName, phoneNumber: $phoneNumber, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterRequestedImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, fullName, phoneNumber, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterRequestedImplCopyWith<_$RegisterRequestedImpl> get copyWith =>
      __$$RegisterRequestedImplCopyWithImpl<_$RegisterRequestedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String identifier, String password)
        loginRequested,
    required TResult Function(
            String fullName, String phoneNumber, String email, String password)
        registerRequested,
    required TResult Function(String identifier, String phoneNumber,
            String email, String phone_otp, String email_otp)
        verifyOtpRequested,
    required TResult Function(String identifier) forgotPasswordRequested,
    required TResult Function(String identifier, String password)
        resetPasswordRequested,
    required TResult Function() logoutRequested,
  }) {
    return registerRequested(fullName, phoneNumber, email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String identifier, String password)? loginRequested,
    TResult? Function(
            String fullName, String phoneNumber, String email, String password)?
        registerRequested,
    TResult? Function(String identifier, String phoneNumber, String email,
            String phone_otp, String email_otp)?
        verifyOtpRequested,
    TResult? Function(String identifier)? forgotPasswordRequested,
    TResult? Function(String identifier, String password)?
        resetPasswordRequested,
    TResult? Function()? logoutRequested,
  }) {
    return registerRequested?.call(fullName, phoneNumber, email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String identifier, String password)? loginRequested,
    TResult Function(
            String fullName, String phoneNumber, String email, String password)?
        registerRequested,
    TResult Function(String identifier, String phoneNumber, String email,
            String phone_otp, String email_otp)?
        verifyOtpRequested,
    TResult Function(String identifier)? forgotPasswordRequested,
    TResult Function(String identifier, String password)?
        resetPasswordRequested,
    TResult Function()? logoutRequested,
    required TResult orElse(),
  }) {
    if (registerRequested != null) {
      return registerRequested(fullName, phoneNumber, email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginRequested value) loginRequested,
    required TResult Function(_RegisterRequested value) registerRequested,
    required TResult Function(_VerifyOtpRequested value) verifyOtpRequested,
    required TResult Function(_ForgotPasswordRequested value)
        forgotPasswordRequested,
    required TResult Function(_ResetPasswordRequested value)
        resetPasswordRequested,
    required TResult Function(_LogoutRequested value) logoutRequested,
  }) {
    return registerRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginRequested value)? loginRequested,
    TResult? Function(_RegisterRequested value)? registerRequested,
    TResult? Function(_VerifyOtpRequested value)? verifyOtpRequested,
    TResult? Function(_ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult? Function(_ResetPasswordRequested value)? resetPasswordRequested,
    TResult? Function(_LogoutRequested value)? logoutRequested,
  }) {
    return registerRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegisterRequested value)? registerRequested,
    TResult Function(_VerifyOtpRequested value)? verifyOtpRequested,
    TResult Function(_ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult Function(_ResetPasswordRequested value)? resetPasswordRequested,
    TResult Function(_LogoutRequested value)? logoutRequested,
    required TResult orElse(),
  }) {
    if (registerRequested != null) {
      return registerRequested(this);
    }
    return orElse();
  }
}

abstract class _RegisterRequested implements AuthEvent {
  const factory _RegisterRequested(
      {required final String fullName,
      required final String phoneNumber,
      required final String email,
      required final String password}) = _$RegisterRequestedImpl;

  String get fullName;
  String get phoneNumber;
  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$RegisterRequestedImplCopyWith<_$RegisterRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyOtpRequestedImplCopyWith<$Res> {
  factory _$$VerifyOtpRequestedImplCopyWith(_$VerifyOtpRequestedImpl value,
          $Res Function(_$VerifyOtpRequestedImpl) then) =
      __$$VerifyOtpRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String identifier,
      String phoneNumber,
      String email,
      String phone_otp,
      String email_otp});
}

/// @nodoc
class __$$VerifyOtpRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$VerifyOtpRequestedImpl>
    implements _$$VerifyOtpRequestedImplCopyWith<$Res> {
  __$$VerifyOtpRequestedImplCopyWithImpl(_$VerifyOtpRequestedImpl _value,
      $Res Function(_$VerifyOtpRequestedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? phone_otp = null,
    Object? email_otp = null,
  }) {
    return _then(_$VerifyOtpRequestedImpl(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone_otp: null == phone_otp
          ? _value.phone_otp
          : phone_otp // ignore: cast_nullable_to_non_nullable
              as String,
      email_otp: null == email_otp
          ? _value.email_otp
          : email_otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VerifyOtpRequestedImpl implements _VerifyOtpRequested {
  const _$VerifyOtpRequestedImpl(
      {required this.identifier,
      required this.phoneNumber,
      required this.email,
      required this.phone_otp,
      required this.email_otp});

  @override
  final String identifier;
  @override
  final String phoneNumber;
  @override
  final String email;
  @override
  final String phone_otp;
  @override
  final String email_otp;

  @override
  String toString() {
    return 'AuthEvent.verifyOtpRequested(identifier: $identifier, phoneNumber: $phoneNumber, email: $email, phone_otp: $phone_otp, email_otp: $email_otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpRequestedImpl &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone_otp, phone_otp) ||
                other.phone_otp == phone_otp) &&
            (identical(other.email_otp, email_otp) ||
                other.email_otp == email_otp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, identifier, phoneNumber, email, phone_otp, email_otp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpRequestedImplCopyWith<_$VerifyOtpRequestedImpl> get copyWith =>
      __$$VerifyOtpRequestedImplCopyWithImpl<_$VerifyOtpRequestedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String identifier, String password)
        loginRequested,
    required TResult Function(
            String fullName, String phoneNumber, String email, String password)
        registerRequested,
    required TResult Function(String identifier, String phoneNumber,
            String email, String phone_otp, String email_otp)
        verifyOtpRequested,
    required TResult Function(String identifier) forgotPasswordRequested,
    required TResult Function(String identifier, String password)
        resetPasswordRequested,
    required TResult Function() logoutRequested,
  }) {
    return verifyOtpRequested(
        identifier, phoneNumber, email, phone_otp, email_otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String identifier, String password)? loginRequested,
    TResult? Function(
            String fullName, String phoneNumber, String email, String password)?
        registerRequested,
    TResult? Function(String identifier, String phoneNumber, String email,
            String phone_otp, String email_otp)?
        verifyOtpRequested,
    TResult? Function(String identifier)? forgotPasswordRequested,
    TResult? Function(String identifier, String password)?
        resetPasswordRequested,
    TResult? Function()? logoutRequested,
  }) {
    return verifyOtpRequested?.call(
        identifier, phoneNumber, email, phone_otp, email_otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String identifier, String password)? loginRequested,
    TResult Function(
            String fullName, String phoneNumber, String email, String password)?
        registerRequested,
    TResult Function(String identifier, String phoneNumber, String email,
            String phone_otp, String email_otp)?
        verifyOtpRequested,
    TResult Function(String identifier)? forgotPasswordRequested,
    TResult Function(String identifier, String password)?
        resetPasswordRequested,
    TResult Function()? logoutRequested,
    required TResult orElse(),
  }) {
    if (verifyOtpRequested != null) {
      return verifyOtpRequested(
          identifier, phoneNumber, email, phone_otp, email_otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginRequested value) loginRequested,
    required TResult Function(_RegisterRequested value) registerRequested,
    required TResult Function(_VerifyOtpRequested value) verifyOtpRequested,
    required TResult Function(_ForgotPasswordRequested value)
        forgotPasswordRequested,
    required TResult Function(_ResetPasswordRequested value)
        resetPasswordRequested,
    required TResult Function(_LogoutRequested value) logoutRequested,
  }) {
    return verifyOtpRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginRequested value)? loginRequested,
    TResult? Function(_RegisterRequested value)? registerRequested,
    TResult? Function(_VerifyOtpRequested value)? verifyOtpRequested,
    TResult? Function(_ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult? Function(_ResetPasswordRequested value)? resetPasswordRequested,
    TResult? Function(_LogoutRequested value)? logoutRequested,
  }) {
    return verifyOtpRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegisterRequested value)? registerRequested,
    TResult Function(_VerifyOtpRequested value)? verifyOtpRequested,
    TResult Function(_ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult Function(_ResetPasswordRequested value)? resetPasswordRequested,
    TResult Function(_LogoutRequested value)? logoutRequested,
    required TResult orElse(),
  }) {
    if (verifyOtpRequested != null) {
      return verifyOtpRequested(this);
    }
    return orElse();
  }
}

abstract class _VerifyOtpRequested implements AuthEvent {
  const factory _VerifyOtpRequested(
      {required final String identifier,
      required final String phoneNumber,
      required final String email,
      required final String phone_otp,
      required final String email_otp}) = _$VerifyOtpRequestedImpl;

  String get identifier;
  String get phoneNumber;
  String get email;
  String get phone_otp;
  String get email_otp;
  @JsonKey(ignore: true)
  _$$VerifyOtpRequestedImplCopyWith<_$VerifyOtpRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ForgotPasswordRequestedImplCopyWith<$Res> {
  factory _$$ForgotPasswordRequestedImplCopyWith(
          _$ForgotPasswordRequestedImpl value,
          $Res Function(_$ForgotPasswordRequestedImpl) then) =
      __$$ForgotPasswordRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String identifier});
}

/// @nodoc
class __$$ForgotPasswordRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ForgotPasswordRequestedImpl>
    implements _$$ForgotPasswordRequestedImplCopyWith<$Res> {
  __$$ForgotPasswordRequestedImplCopyWithImpl(
      _$ForgotPasswordRequestedImpl _value,
      $Res Function(_$ForgotPasswordRequestedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
  }) {
    return _then(_$ForgotPasswordRequestedImpl(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ForgotPasswordRequestedImpl implements _ForgotPasswordRequested {
  const _$ForgotPasswordRequestedImpl({required this.identifier});

  @override
  final String identifier;

  @override
  String toString() {
    return 'AuthEvent.forgotPasswordRequested(identifier: $identifier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordRequestedImpl &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier));
  }

  @override
  int get hashCode => Object.hash(runtimeType, identifier);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordRequestedImplCopyWith<_$ForgotPasswordRequestedImpl>
      get copyWith => __$$ForgotPasswordRequestedImplCopyWithImpl<
          _$ForgotPasswordRequestedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String identifier, String password)
        loginRequested,
    required TResult Function(
            String fullName, String phoneNumber, String email, String password)
        registerRequested,
    required TResult Function(String identifier, String phoneNumber,
            String email, String phone_otp, String email_otp)
        verifyOtpRequested,
    required TResult Function(String identifier) forgotPasswordRequested,
    required TResult Function(String identifier, String password)
        resetPasswordRequested,
    required TResult Function() logoutRequested,
  }) {
    return forgotPasswordRequested(identifier);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String identifier, String password)? loginRequested,
    TResult? Function(
            String fullName, String phoneNumber, String email, String password)?
        registerRequested,
    TResult? Function(String identifier, String phoneNumber, String email,
            String phone_otp, String email_otp)?
        verifyOtpRequested,
    TResult? Function(String identifier)? forgotPasswordRequested,
    TResult? Function(String identifier, String password)?
        resetPasswordRequested,
    TResult? Function()? logoutRequested,
  }) {
    return forgotPasswordRequested?.call(identifier);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String identifier, String password)? loginRequested,
    TResult Function(
            String fullName, String phoneNumber, String email, String password)?
        registerRequested,
    TResult Function(String identifier, String phoneNumber, String email,
            String phone_otp, String email_otp)?
        verifyOtpRequested,
    TResult Function(String identifier)? forgotPasswordRequested,
    TResult Function(String identifier, String password)?
        resetPasswordRequested,
    TResult Function()? logoutRequested,
    required TResult orElse(),
  }) {
    if (forgotPasswordRequested != null) {
      return forgotPasswordRequested(identifier);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginRequested value) loginRequested,
    required TResult Function(_RegisterRequested value) registerRequested,
    required TResult Function(_VerifyOtpRequested value) verifyOtpRequested,
    required TResult Function(_ForgotPasswordRequested value)
        forgotPasswordRequested,
    required TResult Function(_ResetPasswordRequested value)
        resetPasswordRequested,
    required TResult Function(_LogoutRequested value) logoutRequested,
  }) {
    return forgotPasswordRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginRequested value)? loginRequested,
    TResult? Function(_RegisterRequested value)? registerRequested,
    TResult? Function(_VerifyOtpRequested value)? verifyOtpRequested,
    TResult? Function(_ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult? Function(_ResetPasswordRequested value)? resetPasswordRequested,
    TResult? Function(_LogoutRequested value)? logoutRequested,
  }) {
    return forgotPasswordRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegisterRequested value)? registerRequested,
    TResult Function(_VerifyOtpRequested value)? verifyOtpRequested,
    TResult Function(_ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult Function(_ResetPasswordRequested value)? resetPasswordRequested,
    TResult Function(_LogoutRequested value)? logoutRequested,
    required TResult orElse(),
  }) {
    if (forgotPasswordRequested != null) {
      return forgotPasswordRequested(this);
    }
    return orElse();
  }
}

abstract class _ForgotPasswordRequested implements AuthEvent {
  const factory _ForgotPasswordRequested({required final String identifier}) =
      _$ForgotPasswordRequestedImpl;

  String get identifier;
  @JsonKey(ignore: true)
  _$$ForgotPasswordRequestedImplCopyWith<_$ForgotPasswordRequestedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetPasswordRequestedImplCopyWith<$Res> {
  factory _$$ResetPasswordRequestedImplCopyWith(
          _$ResetPasswordRequestedImpl value,
          $Res Function(_$ResetPasswordRequestedImpl) then) =
      __$$ResetPasswordRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String identifier, String password});
}

/// @nodoc
class __$$ResetPasswordRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ResetPasswordRequestedImpl>
    implements _$$ResetPasswordRequestedImplCopyWith<$Res> {
  __$$ResetPasswordRequestedImplCopyWithImpl(
      _$ResetPasswordRequestedImpl _value,
      $Res Function(_$ResetPasswordRequestedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? password = null,
  }) {
    return _then(_$ResetPasswordRequestedImpl(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ResetPasswordRequestedImpl implements _ResetPasswordRequested {
  const _$ResetPasswordRequestedImpl(
      {required this.identifier, required this.password});

  @override
  final String identifier;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.resetPasswordRequested(identifier: $identifier, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordRequestedImpl &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, identifier, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordRequestedImplCopyWith<_$ResetPasswordRequestedImpl>
      get copyWith => __$$ResetPasswordRequestedImplCopyWithImpl<
          _$ResetPasswordRequestedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String identifier, String password)
        loginRequested,
    required TResult Function(
            String fullName, String phoneNumber, String email, String password)
        registerRequested,
    required TResult Function(String identifier, String phoneNumber,
            String email, String phone_otp, String email_otp)
        verifyOtpRequested,
    required TResult Function(String identifier) forgotPasswordRequested,
    required TResult Function(String identifier, String password)
        resetPasswordRequested,
    required TResult Function() logoutRequested,
  }) {
    return resetPasswordRequested(identifier, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String identifier, String password)? loginRequested,
    TResult? Function(
            String fullName, String phoneNumber, String email, String password)?
        registerRequested,
    TResult? Function(String identifier, String phoneNumber, String email,
            String phone_otp, String email_otp)?
        verifyOtpRequested,
    TResult? Function(String identifier)? forgotPasswordRequested,
    TResult? Function(String identifier, String password)?
        resetPasswordRequested,
    TResult? Function()? logoutRequested,
  }) {
    return resetPasswordRequested?.call(identifier, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String identifier, String password)? loginRequested,
    TResult Function(
            String fullName, String phoneNumber, String email, String password)?
        registerRequested,
    TResult Function(String identifier, String phoneNumber, String email,
            String phone_otp, String email_otp)?
        verifyOtpRequested,
    TResult Function(String identifier)? forgotPasswordRequested,
    TResult Function(String identifier, String password)?
        resetPasswordRequested,
    TResult Function()? logoutRequested,
    required TResult orElse(),
  }) {
    if (resetPasswordRequested != null) {
      return resetPasswordRequested(identifier, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginRequested value) loginRequested,
    required TResult Function(_RegisterRequested value) registerRequested,
    required TResult Function(_VerifyOtpRequested value) verifyOtpRequested,
    required TResult Function(_ForgotPasswordRequested value)
        forgotPasswordRequested,
    required TResult Function(_ResetPasswordRequested value)
        resetPasswordRequested,
    required TResult Function(_LogoutRequested value) logoutRequested,
  }) {
    return resetPasswordRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginRequested value)? loginRequested,
    TResult? Function(_RegisterRequested value)? registerRequested,
    TResult? Function(_VerifyOtpRequested value)? verifyOtpRequested,
    TResult? Function(_ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult? Function(_ResetPasswordRequested value)? resetPasswordRequested,
    TResult? Function(_LogoutRequested value)? logoutRequested,
  }) {
    return resetPasswordRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegisterRequested value)? registerRequested,
    TResult Function(_VerifyOtpRequested value)? verifyOtpRequested,
    TResult Function(_ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult Function(_ResetPasswordRequested value)? resetPasswordRequested,
    TResult Function(_LogoutRequested value)? logoutRequested,
    required TResult orElse(),
  }) {
    if (resetPasswordRequested != null) {
      return resetPasswordRequested(this);
    }
    return orElse();
  }
}

abstract class _ResetPasswordRequested implements AuthEvent {
  const factory _ResetPasswordRequested(
      {required final String identifier,
      required final String password}) = _$ResetPasswordRequestedImpl;

  String get identifier;
  String get password;
  @JsonKey(ignore: true)
  _$$ResetPasswordRequestedImplCopyWith<_$ResetPasswordRequestedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutRequestedImplCopyWith<$Res> {
  factory _$$LogoutRequestedImplCopyWith(_$LogoutRequestedImpl value,
          $Res Function(_$LogoutRequestedImpl) then) =
      __$$LogoutRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LogoutRequestedImpl>
    implements _$$LogoutRequestedImplCopyWith<$Res> {
  __$$LogoutRequestedImplCopyWithImpl(
      _$LogoutRequestedImpl _value, $Res Function(_$LogoutRequestedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogoutRequestedImpl implements _LogoutRequested {
  const _$LogoutRequestedImpl();

  @override
  String toString() {
    return 'AuthEvent.logoutRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String identifier, String password)
        loginRequested,
    required TResult Function(
            String fullName, String phoneNumber, String email, String password)
        registerRequested,
    required TResult Function(String identifier, String phoneNumber,
            String email, String phone_otp, String email_otp)
        verifyOtpRequested,
    required TResult Function(String identifier) forgotPasswordRequested,
    required TResult Function(String identifier, String password)
        resetPasswordRequested,
    required TResult Function() logoutRequested,
  }) {
    return logoutRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String identifier, String password)? loginRequested,
    TResult? Function(
            String fullName, String phoneNumber, String email, String password)?
        registerRequested,
    TResult? Function(String identifier, String phoneNumber, String email,
            String phone_otp, String email_otp)?
        verifyOtpRequested,
    TResult? Function(String identifier)? forgotPasswordRequested,
    TResult? Function(String identifier, String password)?
        resetPasswordRequested,
    TResult? Function()? logoutRequested,
  }) {
    return logoutRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String identifier, String password)? loginRequested,
    TResult Function(
            String fullName, String phoneNumber, String email, String password)?
        registerRequested,
    TResult Function(String identifier, String phoneNumber, String email,
            String phone_otp, String email_otp)?
        verifyOtpRequested,
    TResult Function(String identifier)? forgotPasswordRequested,
    TResult Function(String identifier, String password)?
        resetPasswordRequested,
    TResult Function()? logoutRequested,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginRequested value) loginRequested,
    required TResult Function(_RegisterRequested value) registerRequested,
    required TResult Function(_VerifyOtpRequested value) verifyOtpRequested,
    required TResult Function(_ForgotPasswordRequested value)
        forgotPasswordRequested,
    required TResult Function(_ResetPasswordRequested value)
        resetPasswordRequested,
    required TResult Function(_LogoutRequested value) logoutRequested,
  }) {
    return logoutRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginRequested value)? loginRequested,
    TResult? Function(_RegisterRequested value)? registerRequested,
    TResult? Function(_VerifyOtpRequested value)? verifyOtpRequested,
    TResult? Function(_ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult? Function(_ResetPasswordRequested value)? resetPasswordRequested,
    TResult? Function(_LogoutRequested value)? logoutRequested,
  }) {
    return logoutRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegisterRequested value)? registerRequested,
    TResult Function(_VerifyOtpRequested value)? verifyOtpRequested,
    TResult Function(_ForgotPasswordRequested value)? forgotPasswordRequested,
    TResult Function(_ResetPasswordRequested value)? resetPasswordRequested,
    TResult Function(_LogoutRequested value)? logoutRequested,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested(this);
    }
    return orElse();
  }
}

abstract class _LogoutRequested implements AuthEvent {
  const factory _LogoutRequested() = _$LogoutRequestedImpl;
}
