// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_product_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DetailProductState {

 ProductModel? get product; DetailProductStatus get status; String get messages;
/// Create a copy of DetailProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailProductStateCopyWith<DetailProductState> get copyWith => _$DetailProductStateCopyWithImpl<DetailProductState>(this as DetailProductState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailProductState&&(identical(other.product, product) || other.product == product)&&(identical(other.status, status) || other.status == status)&&(identical(other.messages, messages) || other.messages == messages));
}


@override
int get hashCode => Object.hash(runtimeType,product,status,messages);

@override
String toString() {
  return 'DetailProductState(product: $product, status: $status, messages: $messages)';
}


}

/// @nodoc
abstract mixin class $DetailProductStateCopyWith<$Res>  {
  factory $DetailProductStateCopyWith(DetailProductState value, $Res Function(DetailProductState) _then) = _$DetailProductStateCopyWithImpl;
@useResult
$Res call({
 ProductModel? product, DetailProductStatus status, String messages
});


$ProductModelCopyWith<$Res>? get product;

}
/// @nodoc
class _$DetailProductStateCopyWithImpl<$Res>
    implements $DetailProductStateCopyWith<$Res> {
  _$DetailProductStateCopyWithImpl(this._self, this._then);

  final DetailProductState _self;
  final $Res Function(DetailProductState) _then;

/// Create a copy of DetailProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? product = freezed,Object? status = null,Object? messages = null,}) {
  return _then(_self.copyWith(
product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductModel?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DetailProductStatus,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of DetailProductState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductModelCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductModelCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [DetailProductState].
extension DetailProductStatePatterns on DetailProductState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ProductModel? product,  DetailProductStatus status,  String messages)?  initial,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.product,_that.status,_that.messages);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ProductModel? product,  DetailProductStatus status,  String messages)  initial,}) {final _that = this;
switch (_that) {
case Initial():
return initial(_that.product,_that.status,_that.messages);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ProductModel? product,  DetailProductStatus status,  String messages)?  initial,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.product,_that.status,_that.messages);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements DetailProductState {
  const Initial({this.product, this.status = DetailProductStatus.initial, this.messages = ''});
  

@override final  ProductModel? product;
@override@JsonKey() final  DetailProductStatus status;
@override@JsonKey() final  String messages;

/// Create a copy of DetailProductState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitialCopyWith<Initial> get copyWith => _$InitialCopyWithImpl<Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial&&(identical(other.product, product) || other.product == product)&&(identical(other.status, status) || other.status == status)&&(identical(other.messages, messages) || other.messages == messages));
}


@override
int get hashCode => Object.hash(runtimeType,product,status,messages);

@override
String toString() {
  return 'DetailProductState.initial(product: $product, status: $status, messages: $messages)';
}


}

/// @nodoc
abstract mixin class $InitialCopyWith<$Res> implements $DetailProductStateCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) _then) = _$InitialCopyWithImpl;
@override @useResult
$Res call({
 ProductModel? product, DetailProductStatus status, String messages
});


@override $ProductModelCopyWith<$Res>? get product;

}
/// @nodoc
class _$InitialCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(this._self, this._then);

  final Initial _self;
  final $Res Function(Initial) _then;

/// Create a copy of DetailProductState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? product = freezed,Object? status = null,Object? messages = null,}) {
  return _then(Initial(
product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductModel?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DetailProductStatus,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of DetailProductState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductModelCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductModelCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}

// dart format on
