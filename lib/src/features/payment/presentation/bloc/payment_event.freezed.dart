// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchCategories,
    required TResult Function(String categoryId) fetchServices,
    required TResult Function(PaymentRequestEntity request) pay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchCategories,
    TResult? Function(String categoryId)? fetchServices,
    TResult? Function(PaymentRequestEntity request)? pay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchCategories,
    TResult Function(String categoryId)? fetchServices,
    TResult Function(PaymentRequestEntity request)? pay,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchCategories value) fetchCategories,
    required TResult Function(FetchServices value) fetchServices,
    required TResult Function(Pay value) pay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchCategories value)? fetchCategories,
    TResult? Function(FetchServices value)? fetchServices,
    TResult? Function(Pay value)? pay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(FetchServices value)? fetchServices,
    TResult Function(Pay value)? pay,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentEventCopyWith<$Res> {
  factory $PaymentEventCopyWith(
          PaymentEvent value, $Res Function(PaymentEvent) then) =
      _$PaymentEventCopyWithImpl<$Res, PaymentEvent>;
}

/// @nodoc
class _$PaymentEventCopyWithImpl<$Res, $Val extends PaymentEvent>
    implements $PaymentEventCopyWith<$Res> {
  _$PaymentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchCategoriesImplCopyWith<$Res> {
  factory _$$FetchCategoriesImplCopyWith(_$FetchCategoriesImpl value,
          $Res Function(_$FetchCategoriesImpl) then) =
      __$$FetchCategoriesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchCategoriesImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$FetchCategoriesImpl>
    implements _$$FetchCategoriesImplCopyWith<$Res> {
  __$$FetchCategoriesImplCopyWithImpl(
      _$FetchCategoriesImpl _value, $Res Function(_$FetchCategoriesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchCategoriesImpl implements FetchCategories {
  const _$FetchCategoriesImpl();

  @override
  String toString() {
    return 'PaymentEvent.fetchCategories()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchCategoriesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchCategories,
    required TResult Function(String categoryId) fetchServices,
    required TResult Function(PaymentRequestEntity request) pay,
  }) {
    return fetchCategories();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchCategories,
    TResult? Function(String categoryId)? fetchServices,
    TResult? Function(PaymentRequestEntity request)? pay,
  }) {
    return fetchCategories?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchCategories,
    TResult Function(String categoryId)? fetchServices,
    TResult Function(PaymentRequestEntity request)? pay,
    required TResult orElse(),
  }) {
    if (fetchCategories != null) {
      return fetchCategories();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchCategories value) fetchCategories,
    required TResult Function(FetchServices value) fetchServices,
    required TResult Function(Pay value) pay,
  }) {
    return fetchCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchCategories value)? fetchCategories,
    TResult? Function(FetchServices value)? fetchServices,
    TResult? Function(Pay value)? pay,
  }) {
    return fetchCategories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(FetchServices value)? fetchServices,
    TResult Function(Pay value)? pay,
    required TResult orElse(),
  }) {
    if (fetchCategories != null) {
      return fetchCategories(this);
    }
    return orElse();
  }
}

abstract class FetchCategories implements PaymentEvent {
  const factory FetchCategories() = _$FetchCategoriesImpl;
}

/// @nodoc
abstract class _$$FetchServicesImplCopyWith<$Res> {
  factory _$$FetchServicesImplCopyWith(
          _$FetchServicesImpl value, $Res Function(_$FetchServicesImpl) then) =
      __$$FetchServicesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String categoryId});
}

/// @nodoc
class __$$FetchServicesImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$FetchServicesImpl>
    implements _$$FetchServicesImplCopyWith<$Res> {
  __$$FetchServicesImplCopyWithImpl(
      _$FetchServicesImpl _value, $Res Function(_$FetchServicesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
  }) {
    return _then(_$FetchServicesImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchServicesImpl implements FetchServices {
  const _$FetchServicesImpl({required this.categoryId});

  @override
  final String categoryId;

  @override
  String toString() {
    return 'PaymentEvent.fetchServices(categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchServicesImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchServicesImplCopyWith<_$FetchServicesImpl> get copyWith =>
      __$$FetchServicesImplCopyWithImpl<_$FetchServicesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchCategories,
    required TResult Function(String categoryId) fetchServices,
    required TResult Function(PaymentRequestEntity request) pay,
  }) {
    return fetchServices(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchCategories,
    TResult? Function(String categoryId)? fetchServices,
    TResult? Function(PaymentRequestEntity request)? pay,
  }) {
    return fetchServices?.call(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchCategories,
    TResult Function(String categoryId)? fetchServices,
    TResult Function(PaymentRequestEntity request)? pay,
    required TResult orElse(),
  }) {
    if (fetchServices != null) {
      return fetchServices(categoryId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchCategories value) fetchCategories,
    required TResult Function(FetchServices value) fetchServices,
    required TResult Function(Pay value) pay,
  }) {
    return fetchServices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchCategories value)? fetchCategories,
    TResult? Function(FetchServices value)? fetchServices,
    TResult? Function(Pay value)? pay,
  }) {
    return fetchServices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(FetchServices value)? fetchServices,
    TResult Function(Pay value)? pay,
    required TResult orElse(),
  }) {
    if (fetchServices != null) {
      return fetchServices(this);
    }
    return orElse();
  }
}

abstract class FetchServices implements PaymentEvent {
  const factory FetchServices({required final String categoryId}) =
      _$FetchServicesImpl;

  String get categoryId;
  @JsonKey(ignore: true)
  _$$FetchServicesImplCopyWith<_$FetchServicesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PayImplCopyWith<$Res> {
  factory _$$PayImplCopyWith(_$PayImpl value, $Res Function(_$PayImpl) then) =
      __$$PayImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentRequestEntity request});
}

/// @nodoc
class __$$PayImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$PayImpl>
    implements _$$PayImplCopyWith<$Res> {
  __$$PayImplCopyWithImpl(_$PayImpl _value, $Res Function(_$PayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$PayImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as PaymentRequestEntity,
    ));
  }
}

/// @nodoc

class _$PayImpl implements Pay {
  const _$PayImpl({required this.request});

  @override
  final PaymentRequestEntity request;

  @override
  String toString() {
    return 'PaymentEvent.pay(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PayImplCopyWith<_$PayImpl> get copyWith =>
      __$$PayImplCopyWithImpl<_$PayImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchCategories,
    required TResult Function(String categoryId) fetchServices,
    required TResult Function(PaymentRequestEntity request) pay,
  }) {
    return pay(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchCategories,
    TResult? Function(String categoryId)? fetchServices,
    TResult? Function(PaymentRequestEntity request)? pay,
  }) {
    return pay?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchCategories,
    TResult Function(String categoryId)? fetchServices,
    TResult Function(PaymentRequestEntity request)? pay,
    required TResult orElse(),
  }) {
    if (pay != null) {
      return pay(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchCategories value) fetchCategories,
    required TResult Function(FetchServices value) fetchServices,
    required TResult Function(Pay value) pay,
  }) {
    return pay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchCategories value)? fetchCategories,
    TResult? Function(FetchServices value)? fetchServices,
    TResult? Function(Pay value)? pay,
  }) {
    return pay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(FetchServices value)? fetchServices,
    TResult Function(Pay value)? pay,
    required TResult orElse(),
  }) {
    if (pay != null) {
      return pay(this);
    }
    return orElse();
  }
}

abstract class Pay implements PaymentEvent {
  const factory Pay({required final PaymentRequestEntity request}) = _$PayImpl;

  PaymentRequestEntity get request;
  @JsonKey(ignore: true)
  _$$PayImplCopyWith<_$PayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
