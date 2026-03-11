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
    required TResult Function(PaymentCategoryEntity category) selectCategory,
    required TResult Function(PaymentServiceEntity service) selectService,
    required TResult Function(double? amount, String? accountIdentifier)
        updatePaymentDetails,
    required TResult Function() nextStep,
    required TResult Function() previousStep,
    required TResult Function(PaymentRequestEntity request) pay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchCategories,
    TResult? Function(String categoryId)? fetchServices,
    TResult? Function(PaymentCategoryEntity category)? selectCategory,
    TResult? Function(PaymentServiceEntity service)? selectService,
    TResult? Function(double? amount, String? accountIdentifier)?
        updatePaymentDetails,
    TResult? Function()? nextStep,
    TResult? Function()? previousStep,
    TResult? Function(PaymentRequestEntity request)? pay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchCategories,
    TResult Function(String categoryId)? fetchServices,
    TResult Function(PaymentCategoryEntity category)? selectCategory,
    TResult Function(PaymentServiceEntity service)? selectService,
    TResult Function(double? amount, String? accountIdentifier)?
        updatePaymentDetails,
    TResult Function()? nextStep,
    TResult Function()? previousStep,
    TResult Function(PaymentRequestEntity request)? pay,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchCategories value) fetchCategories,
    required TResult Function(FetchServices value) fetchServices,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(SelectService value) selectService,
    required TResult Function(UpdatePaymentDetails value) updatePaymentDetails,
    required TResult Function(NextStep value) nextStep,
    required TResult Function(PreviousStep value) previousStep,
    required TResult Function(Pay value) pay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchCategories value)? fetchCategories,
    TResult? Function(FetchServices value)? fetchServices,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(SelectService value)? selectService,
    TResult? Function(UpdatePaymentDetails value)? updatePaymentDetails,
    TResult? Function(NextStep value)? nextStep,
    TResult? Function(PreviousStep value)? previousStep,
    TResult? Function(Pay value)? pay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(FetchServices value)? fetchServices,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(SelectService value)? selectService,
    TResult Function(UpdatePaymentDetails value)? updatePaymentDetails,
    TResult Function(NextStep value)? nextStep,
    TResult Function(PreviousStep value)? previousStep,
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
    required TResult Function(PaymentCategoryEntity category) selectCategory,
    required TResult Function(PaymentServiceEntity service) selectService,
    required TResult Function(double? amount, String? accountIdentifier)
        updatePaymentDetails,
    required TResult Function() nextStep,
    required TResult Function() previousStep,
    required TResult Function(PaymentRequestEntity request) pay,
  }) {
    return fetchCategories();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchCategories,
    TResult? Function(String categoryId)? fetchServices,
    TResult? Function(PaymentCategoryEntity category)? selectCategory,
    TResult? Function(PaymentServiceEntity service)? selectService,
    TResult? Function(double? amount, String? accountIdentifier)?
        updatePaymentDetails,
    TResult? Function()? nextStep,
    TResult? Function()? previousStep,
    TResult? Function(PaymentRequestEntity request)? pay,
  }) {
    return fetchCategories?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchCategories,
    TResult Function(String categoryId)? fetchServices,
    TResult Function(PaymentCategoryEntity category)? selectCategory,
    TResult Function(PaymentServiceEntity service)? selectService,
    TResult Function(double? amount, String? accountIdentifier)?
        updatePaymentDetails,
    TResult Function()? nextStep,
    TResult Function()? previousStep,
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
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(SelectService value) selectService,
    required TResult Function(UpdatePaymentDetails value) updatePaymentDetails,
    required TResult Function(NextStep value) nextStep,
    required TResult Function(PreviousStep value) previousStep,
    required TResult Function(Pay value) pay,
  }) {
    return fetchCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchCategories value)? fetchCategories,
    TResult? Function(FetchServices value)? fetchServices,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(SelectService value)? selectService,
    TResult? Function(UpdatePaymentDetails value)? updatePaymentDetails,
    TResult? Function(NextStep value)? nextStep,
    TResult? Function(PreviousStep value)? previousStep,
    TResult? Function(Pay value)? pay,
  }) {
    return fetchCategories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(FetchServices value)? fetchServices,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(SelectService value)? selectService,
    TResult Function(UpdatePaymentDetails value)? updatePaymentDetails,
    TResult Function(NextStep value)? nextStep,
    TResult Function(PreviousStep value)? previousStep,
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
    required TResult Function(PaymentCategoryEntity category) selectCategory,
    required TResult Function(PaymentServiceEntity service) selectService,
    required TResult Function(double? amount, String? accountIdentifier)
        updatePaymentDetails,
    required TResult Function() nextStep,
    required TResult Function() previousStep,
    required TResult Function(PaymentRequestEntity request) pay,
  }) {
    return fetchServices(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchCategories,
    TResult? Function(String categoryId)? fetchServices,
    TResult? Function(PaymentCategoryEntity category)? selectCategory,
    TResult? Function(PaymentServiceEntity service)? selectService,
    TResult? Function(double? amount, String? accountIdentifier)?
        updatePaymentDetails,
    TResult? Function()? nextStep,
    TResult? Function()? previousStep,
    TResult? Function(PaymentRequestEntity request)? pay,
  }) {
    return fetchServices?.call(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchCategories,
    TResult Function(String categoryId)? fetchServices,
    TResult Function(PaymentCategoryEntity category)? selectCategory,
    TResult Function(PaymentServiceEntity service)? selectService,
    TResult Function(double? amount, String? accountIdentifier)?
        updatePaymentDetails,
    TResult Function()? nextStep,
    TResult Function()? previousStep,
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
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(SelectService value) selectService,
    required TResult Function(UpdatePaymentDetails value) updatePaymentDetails,
    required TResult Function(NextStep value) nextStep,
    required TResult Function(PreviousStep value) previousStep,
    required TResult Function(Pay value) pay,
  }) {
    return fetchServices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchCategories value)? fetchCategories,
    TResult? Function(FetchServices value)? fetchServices,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(SelectService value)? selectService,
    TResult? Function(UpdatePaymentDetails value)? updatePaymentDetails,
    TResult? Function(NextStep value)? nextStep,
    TResult? Function(PreviousStep value)? previousStep,
    TResult? Function(Pay value)? pay,
  }) {
    return fetchServices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(FetchServices value)? fetchServices,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(SelectService value)? selectService,
    TResult Function(UpdatePaymentDetails value)? updatePaymentDetails,
    TResult Function(NextStep value)? nextStep,
    TResult Function(PreviousStep value)? previousStep,
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
abstract class _$$SelectCategoryImplCopyWith<$Res> {
  factory _$$SelectCategoryImplCopyWith(_$SelectCategoryImpl value,
          $Res Function(_$SelectCategoryImpl) then) =
      __$$SelectCategoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentCategoryEntity category});
}

/// @nodoc
class __$$SelectCategoryImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$SelectCategoryImpl>
    implements _$$SelectCategoryImplCopyWith<$Res> {
  __$$SelectCategoryImplCopyWithImpl(
      _$SelectCategoryImpl _value, $Res Function(_$SelectCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$SelectCategoryImpl(
      null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as PaymentCategoryEntity,
    ));
  }
}

/// @nodoc

class _$SelectCategoryImpl implements SelectCategory {
  const _$SelectCategoryImpl(this.category);

  @override
  final PaymentCategoryEntity category;

  @override
  String toString() {
    return 'PaymentEvent.selectCategory(category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectCategoryImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectCategoryImplCopyWith<_$SelectCategoryImpl> get copyWith =>
      __$$SelectCategoryImplCopyWithImpl<_$SelectCategoryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchCategories,
    required TResult Function(String categoryId) fetchServices,
    required TResult Function(PaymentCategoryEntity category) selectCategory,
    required TResult Function(PaymentServiceEntity service) selectService,
    required TResult Function(double? amount, String? accountIdentifier)
        updatePaymentDetails,
    required TResult Function() nextStep,
    required TResult Function() previousStep,
    required TResult Function(PaymentRequestEntity request) pay,
  }) {
    return selectCategory(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchCategories,
    TResult? Function(String categoryId)? fetchServices,
    TResult? Function(PaymentCategoryEntity category)? selectCategory,
    TResult? Function(PaymentServiceEntity service)? selectService,
    TResult? Function(double? amount, String? accountIdentifier)?
        updatePaymentDetails,
    TResult? Function()? nextStep,
    TResult? Function()? previousStep,
    TResult? Function(PaymentRequestEntity request)? pay,
  }) {
    return selectCategory?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchCategories,
    TResult Function(String categoryId)? fetchServices,
    TResult Function(PaymentCategoryEntity category)? selectCategory,
    TResult Function(PaymentServiceEntity service)? selectService,
    TResult Function(double? amount, String? accountIdentifier)?
        updatePaymentDetails,
    TResult Function()? nextStep,
    TResult Function()? previousStep,
    TResult Function(PaymentRequestEntity request)? pay,
    required TResult orElse(),
  }) {
    if (selectCategory != null) {
      return selectCategory(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchCategories value) fetchCategories,
    required TResult Function(FetchServices value) fetchServices,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(SelectService value) selectService,
    required TResult Function(UpdatePaymentDetails value) updatePaymentDetails,
    required TResult Function(NextStep value) nextStep,
    required TResult Function(PreviousStep value) previousStep,
    required TResult Function(Pay value) pay,
  }) {
    return selectCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchCategories value)? fetchCategories,
    TResult? Function(FetchServices value)? fetchServices,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(SelectService value)? selectService,
    TResult? Function(UpdatePaymentDetails value)? updatePaymentDetails,
    TResult? Function(NextStep value)? nextStep,
    TResult? Function(PreviousStep value)? previousStep,
    TResult? Function(Pay value)? pay,
  }) {
    return selectCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(FetchServices value)? fetchServices,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(SelectService value)? selectService,
    TResult Function(UpdatePaymentDetails value)? updatePaymentDetails,
    TResult Function(NextStep value)? nextStep,
    TResult Function(PreviousStep value)? previousStep,
    TResult Function(Pay value)? pay,
    required TResult orElse(),
  }) {
    if (selectCategory != null) {
      return selectCategory(this);
    }
    return orElse();
  }
}

abstract class SelectCategory implements PaymentEvent {
  const factory SelectCategory(final PaymentCategoryEntity category) =
      _$SelectCategoryImpl;

  PaymentCategoryEntity get category;
  @JsonKey(ignore: true)
  _$$SelectCategoryImplCopyWith<_$SelectCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectServiceImplCopyWith<$Res> {
  factory _$$SelectServiceImplCopyWith(
          _$SelectServiceImpl value, $Res Function(_$SelectServiceImpl) then) =
      __$$SelectServiceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentServiceEntity service});
}

/// @nodoc
class __$$SelectServiceImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$SelectServiceImpl>
    implements _$$SelectServiceImplCopyWith<$Res> {
  __$$SelectServiceImplCopyWithImpl(
      _$SelectServiceImpl _value, $Res Function(_$SelectServiceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = null,
  }) {
    return _then(_$SelectServiceImpl(
      null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as PaymentServiceEntity,
    ));
  }
}

/// @nodoc

class _$SelectServiceImpl implements SelectService {
  const _$SelectServiceImpl(this.service);

  @override
  final PaymentServiceEntity service;

  @override
  String toString() {
    return 'PaymentEvent.selectService(service: $service)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectServiceImpl &&
            (identical(other.service, service) || other.service == service));
  }

  @override
  int get hashCode => Object.hash(runtimeType, service);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectServiceImplCopyWith<_$SelectServiceImpl> get copyWith =>
      __$$SelectServiceImplCopyWithImpl<_$SelectServiceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchCategories,
    required TResult Function(String categoryId) fetchServices,
    required TResult Function(PaymentCategoryEntity category) selectCategory,
    required TResult Function(PaymentServiceEntity service) selectService,
    required TResult Function(double? amount, String? accountIdentifier)
        updatePaymentDetails,
    required TResult Function() nextStep,
    required TResult Function() previousStep,
    required TResult Function(PaymentRequestEntity request) pay,
  }) {
    return selectService(service);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchCategories,
    TResult? Function(String categoryId)? fetchServices,
    TResult? Function(PaymentCategoryEntity category)? selectCategory,
    TResult? Function(PaymentServiceEntity service)? selectService,
    TResult? Function(double? amount, String? accountIdentifier)?
        updatePaymentDetails,
    TResult? Function()? nextStep,
    TResult? Function()? previousStep,
    TResult? Function(PaymentRequestEntity request)? pay,
  }) {
    return selectService?.call(service);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchCategories,
    TResult Function(String categoryId)? fetchServices,
    TResult Function(PaymentCategoryEntity category)? selectCategory,
    TResult Function(PaymentServiceEntity service)? selectService,
    TResult Function(double? amount, String? accountIdentifier)?
        updatePaymentDetails,
    TResult Function()? nextStep,
    TResult Function()? previousStep,
    TResult Function(PaymentRequestEntity request)? pay,
    required TResult orElse(),
  }) {
    if (selectService != null) {
      return selectService(service);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchCategories value) fetchCategories,
    required TResult Function(FetchServices value) fetchServices,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(SelectService value) selectService,
    required TResult Function(UpdatePaymentDetails value) updatePaymentDetails,
    required TResult Function(NextStep value) nextStep,
    required TResult Function(PreviousStep value) previousStep,
    required TResult Function(Pay value) pay,
  }) {
    return selectService(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchCategories value)? fetchCategories,
    TResult? Function(FetchServices value)? fetchServices,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(SelectService value)? selectService,
    TResult? Function(UpdatePaymentDetails value)? updatePaymentDetails,
    TResult? Function(NextStep value)? nextStep,
    TResult? Function(PreviousStep value)? previousStep,
    TResult? Function(Pay value)? pay,
  }) {
    return selectService?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(FetchServices value)? fetchServices,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(SelectService value)? selectService,
    TResult Function(UpdatePaymentDetails value)? updatePaymentDetails,
    TResult Function(NextStep value)? nextStep,
    TResult Function(PreviousStep value)? previousStep,
    TResult Function(Pay value)? pay,
    required TResult orElse(),
  }) {
    if (selectService != null) {
      return selectService(this);
    }
    return orElse();
  }
}

abstract class SelectService implements PaymentEvent {
  const factory SelectService(final PaymentServiceEntity service) =
      _$SelectServiceImpl;

  PaymentServiceEntity get service;
  @JsonKey(ignore: true)
  _$$SelectServiceImplCopyWith<_$SelectServiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePaymentDetailsImplCopyWith<$Res> {
  factory _$$UpdatePaymentDetailsImplCopyWith(_$UpdatePaymentDetailsImpl value,
          $Res Function(_$UpdatePaymentDetailsImpl) then) =
      __$$UpdatePaymentDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double? amount, String? accountIdentifier});
}

/// @nodoc
class __$$UpdatePaymentDetailsImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$UpdatePaymentDetailsImpl>
    implements _$$UpdatePaymentDetailsImplCopyWith<$Res> {
  __$$UpdatePaymentDetailsImplCopyWithImpl(_$UpdatePaymentDetailsImpl _value,
      $Res Function(_$UpdatePaymentDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? accountIdentifier = freezed,
  }) {
    return _then(_$UpdatePaymentDetailsImpl(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      accountIdentifier: freezed == accountIdentifier
          ? _value.accountIdentifier
          : accountIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UpdatePaymentDetailsImpl implements UpdatePaymentDetails {
  const _$UpdatePaymentDetailsImpl({this.amount, this.accountIdentifier});

  @override
  final double? amount;
  @override
  final String? accountIdentifier;

  @override
  String toString() {
    return 'PaymentEvent.updatePaymentDetails(amount: $amount, accountIdentifier: $accountIdentifier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePaymentDetailsImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.accountIdentifier, accountIdentifier) ||
                other.accountIdentifier == accountIdentifier));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount, accountIdentifier);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePaymentDetailsImplCopyWith<_$UpdatePaymentDetailsImpl>
      get copyWith =>
          __$$UpdatePaymentDetailsImplCopyWithImpl<_$UpdatePaymentDetailsImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchCategories,
    required TResult Function(String categoryId) fetchServices,
    required TResult Function(PaymentCategoryEntity category) selectCategory,
    required TResult Function(PaymentServiceEntity service) selectService,
    required TResult Function(double? amount, String? accountIdentifier)
        updatePaymentDetails,
    required TResult Function() nextStep,
    required TResult Function() previousStep,
    required TResult Function(PaymentRequestEntity request) pay,
  }) {
    return updatePaymentDetails(amount, accountIdentifier);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchCategories,
    TResult? Function(String categoryId)? fetchServices,
    TResult? Function(PaymentCategoryEntity category)? selectCategory,
    TResult? Function(PaymentServiceEntity service)? selectService,
    TResult? Function(double? amount, String? accountIdentifier)?
        updatePaymentDetails,
    TResult? Function()? nextStep,
    TResult? Function()? previousStep,
    TResult? Function(PaymentRequestEntity request)? pay,
  }) {
    return updatePaymentDetails?.call(amount, accountIdentifier);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchCategories,
    TResult Function(String categoryId)? fetchServices,
    TResult Function(PaymentCategoryEntity category)? selectCategory,
    TResult Function(PaymentServiceEntity service)? selectService,
    TResult Function(double? amount, String? accountIdentifier)?
        updatePaymentDetails,
    TResult Function()? nextStep,
    TResult Function()? previousStep,
    TResult Function(PaymentRequestEntity request)? pay,
    required TResult orElse(),
  }) {
    if (updatePaymentDetails != null) {
      return updatePaymentDetails(amount, accountIdentifier);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchCategories value) fetchCategories,
    required TResult Function(FetchServices value) fetchServices,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(SelectService value) selectService,
    required TResult Function(UpdatePaymentDetails value) updatePaymentDetails,
    required TResult Function(NextStep value) nextStep,
    required TResult Function(PreviousStep value) previousStep,
    required TResult Function(Pay value) pay,
  }) {
    return updatePaymentDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchCategories value)? fetchCategories,
    TResult? Function(FetchServices value)? fetchServices,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(SelectService value)? selectService,
    TResult? Function(UpdatePaymentDetails value)? updatePaymentDetails,
    TResult? Function(NextStep value)? nextStep,
    TResult? Function(PreviousStep value)? previousStep,
    TResult? Function(Pay value)? pay,
  }) {
    return updatePaymentDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(FetchServices value)? fetchServices,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(SelectService value)? selectService,
    TResult Function(UpdatePaymentDetails value)? updatePaymentDetails,
    TResult Function(NextStep value)? nextStep,
    TResult Function(PreviousStep value)? previousStep,
    TResult Function(Pay value)? pay,
    required TResult orElse(),
  }) {
    if (updatePaymentDetails != null) {
      return updatePaymentDetails(this);
    }
    return orElse();
  }
}

abstract class UpdatePaymentDetails implements PaymentEvent {
  const factory UpdatePaymentDetails(
      {final double? amount,
      final String? accountIdentifier}) = _$UpdatePaymentDetailsImpl;

  double? get amount;
  String? get accountIdentifier;
  @JsonKey(ignore: true)
  _$$UpdatePaymentDetailsImplCopyWith<_$UpdatePaymentDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NextStepImplCopyWith<$Res> {
  factory _$$NextStepImplCopyWith(
          _$NextStepImpl value, $Res Function(_$NextStepImpl) then) =
      __$$NextStepImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NextStepImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$NextStepImpl>
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
    return 'PaymentEvent.nextStep()';
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
    required TResult Function() fetchCategories,
    required TResult Function(String categoryId) fetchServices,
    required TResult Function(PaymentCategoryEntity category) selectCategory,
    required TResult Function(PaymentServiceEntity service) selectService,
    required TResult Function(double? amount, String? accountIdentifier)
        updatePaymentDetails,
    required TResult Function() nextStep,
    required TResult Function() previousStep,
    required TResult Function(PaymentRequestEntity request) pay,
  }) {
    return nextStep();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchCategories,
    TResult? Function(String categoryId)? fetchServices,
    TResult? Function(PaymentCategoryEntity category)? selectCategory,
    TResult? Function(PaymentServiceEntity service)? selectService,
    TResult? Function(double? amount, String? accountIdentifier)?
        updatePaymentDetails,
    TResult? Function()? nextStep,
    TResult? Function()? previousStep,
    TResult? Function(PaymentRequestEntity request)? pay,
  }) {
    return nextStep?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchCategories,
    TResult Function(String categoryId)? fetchServices,
    TResult Function(PaymentCategoryEntity category)? selectCategory,
    TResult Function(PaymentServiceEntity service)? selectService,
    TResult Function(double? amount, String? accountIdentifier)?
        updatePaymentDetails,
    TResult Function()? nextStep,
    TResult Function()? previousStep,
    TResult Function(PaymentRequestEntity request)? pay,
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
    required TResult Function(FetchCategories value) fetchCategories,
    required TResult Function(FetchServices value) fetchServices,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(SelectService value) selectService,
    required TResult Function(UpdatePaymentDetails value) updatePaymentDetails,
    required TResult Function(NextStep value) nextStep,
    required TResult Function(PreviousStep value) previousStep,
    required TResult Function(Pay value) pay,
  }) {
    return nextStep(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchCategories value)? fetchCategories,
    TResult? Function(FetchServices value)? fetchServices,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(SelectService value)? selectService,
    TResult? Function(UpdatePaymentDetails value)? updatePaymentDetails,
    TResult? Function(NextStep value)? nextStep,
    TResult? Function(PreviousStep value)? previousStep,
    TResult? Function(Pay value)? pay,
  }) {
    return nextStep?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(FetchServices value)? fetchServices,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(SelectService value)? selectService,
    TResult Function(UpdatePaymentDetails value)? updatePaymentDetails,
    TResult Function(NextStep value)? nextStep,
    TResult Function(PreviousStep value)? previousStep,
    TResult Function(Pay value)? pay,
    required TResult orElse(),
  }) {
    if (nextStep != null) {
      return nextStep(this);
    }
    return orElse();
  }
}

abstract class NextStep implements PaymentEvent {
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
    extends _$PaymentEventCopyWithImpl<$Res, _$PreviousStepImpl>
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
    return 'PaymentEvent.previousStep()';
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
    required TResult Function() fetchCategories,
    required TResult Function(String categoryId) fetchServices,
    required TResult Function(PaymentCategoryEntity category) selectCategory,
    required TResult Function(PaymentServiceEntity service) selectService,
    required TResult Function(double? amount, String? accountIdentifier)
        updatePaymentDetails,
    required TResult Function() nextStep,
    required TResult Function() previousStep,
    required TResult Function(PaymentRequestEntity request) pay,
  }) {
    return previousStep();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchCategories,
    TResult? Function(String categoryId)? fetchServices,
    TResult? Function(PaymentCategoryEntity category)? selectCategory,
    TResult? Function(PaymentServiceEntity service)? selectService,
    TResult? Function(double? amount, String? accountIdentifier)?
        updatePaymentDetails,
    TResult? Function()? nextStep,
    TResult? Function()? previousStep,
    TResult? Function(PaymentRequestEntity request)? pay,
  }) {
    return previousStep?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchCategories,
    TResult Function(String categoryId)? fetchServices,
    TResult Function(PaymentCategoryEntity category)? selectCategory,
    TResult Function(PaymentServiceEntity service)? selectService,
    TResult Function(double? amount, String? accountIdentifier)?
        updatePaymentDetails,
    TResult Function()? nextStep,
    TResult Function()? previousStep,
    TResult Function(PaymentRequestEntity request)? pay,
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
    required TResult Function(FetchCategories value) fetchCategories,
    required TResult Function(FetchServices value) fetchServices,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(SelectService value) selectService,
    required TResult Function(UpdatePaymentDetails value) updatePaymentDetails,
    required TResult Function(NextStep value) nextStep,
    required TResult Function(PreviousStep value) previousStep,
    required TResult Function(Pay value) pay,
  }) {
    return previousStep(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchCategories value)? fetchCategories,
    TResult? Function(FetchServices value)? fetchServices,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(SelectService value)? selectService,
    TResult? Function(UpdatePaymentDetails value)? updatePaymentDetails,
    TResult? Function(NextStep value)? nextStep,
    TResult? Function(PreviousStep value)? previousStep,
    TResult? Function(Pay value)? pay,
  }) {
    return previousStep?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(FetchServices value)? fetchServices,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(SelectService value)? selectService,
    TResult Function(UpdatePaymentDetails value)? updatePaymentDetails,
    TResult Function(NextStep value)? nextStep,
    TResult Function(PreviousStep value)? previousStep,
    TResult Function(Pay value)? pay,
    required TResult orElse(),
  }) {
    if (previousStep != null) {
      return previousStep(this);
    }
    return orElse();
  }
}

abstract class PreviousStep implements PaymentEvent {
  const factory PreviousStep() = _$PreviousStepImpl;
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
    required TResult Function(PaymentCategoryEntity category) selectCategory,
    required TResult Function(PaymentServiceEntity service) selectService,
    required TResult Function(double? amount, String? accountIdentifier)
        updatePaymentDetails,
    required TResult Function() nextStep,
    required TResult Function() previousStep,
    required TResult Function(PaymentRequestEntity request) pay,
  }) {
    return pay(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchCategories,
    TResult? Function(String categoryId)? fetchServices,
    TResult? Function(PaymentCategoryEntity category)? selectCategory,
    TResult? Function(PaymentServiceEntity service)? selectService,
    TResult? Function(double? amount, String? accountIdentifier)?
        updatePaymentDetails,
    TResult? Function()? nextStep,
    TResult? Function()? previousStep,
    TResult? Function(PaymentRequestEntity request)? pay,
  }) {
    return pay?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchCategories,
    TResult Function(String categoryId)? fetchServices,
    TResult Function(PaymentCategoryEntity category)? selectCategory,
    TResult Function(PaymentServiceEntity service)? selectService,
    TResult Function(double? amount, String? accountIdentifier)?
        updatePaymentDetails,
    TResult Function()? nextStep,
    TResult Function()? previousStep,
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
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(SelectService value) selectService,
    required TResult Function(UpdatePaymentDetails value) updatePaymentDetails,
    required TResult Function(NextStep value) nextStep,
    required TResult Function(PreviousStep value) previousStep,
    required TResult Function(Pay value) pay,
  }) {
    return pay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchCategories value)? fetchCategories,
    TResult? Function(FetchServices value)? fetchServices,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(SelectService value)? selectService,
    TResult? Function(UpdatePaymentDetails value)? updatePaymentDetails,
    TResult? Function(NextStep value)? nextStep,
    TResult? Function(PreviousStep value)? previousStep,
    TResult? Function(Pay value)? pay,
  }) {
    return pay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(FetchServices value)? fetchServices,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(SelectService value)? selectService,
    TResult Function(UpdatePaymentDetails value)? updatePaymentDetails,
    TResult Function(NextStep value)? nextStep,
    TResult Function(PreviousStep value)? previousStep,
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
