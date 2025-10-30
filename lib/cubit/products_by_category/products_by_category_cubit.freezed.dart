// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_by_category_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductsByCategoryState {

 List<ProductModel>? get listProduct; ProductsByCategoryStatus get status; String get messages;
/// Create a copy of ProductsByCategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsByCategoryStateCopyWith<ProductsByCategoryState> get copyWith => _$ProductsByCategoryStateCopyWithImpl<ProductsByCategoryState>(this as ProductsByCategoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsByCategoryState&&const DeepCollectionEquality().equals(other.listProduct, listProduct)&&(identical(other.status, status) || other.status == status)&&(identical(other.messages, messages) || other.messages == messages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(listProduct),status,messages);

@override
String toString() {
  return 'ProductsByCategoryState(listProduct: $listProduct, status: $status, messages: $messages)';
}


}

/// @nodoc
abstract mixin class $ProductsByCategoryStateCopyWith<$Res>  {
  factory $ProductsByCategoryStateCopyWith(ProductsByCategoryState value, $Res Function(ProductsByCategoryState) _then) = _$ProductsByCategoryStateCopyWithImpl;
@useResult
$Res call({
 List<ProductModel>? listProduct, ProductsByCategoryStatus status, String messages
});




}
/// @nodoc
class _$ProductsByCategoryStateCopyWithImpl<$Res>
    implements $ProductsByCategoryStateCopyWith<$Res> {
  _$ProductsByCategoryStateCopyWithImpl(this._self, this._then);

  final ProductsByCategoryState _self;
  final $Res Function(ProductsByCategoryState) _then;

/// Create a copy of ProductsByCategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? listProduct = freezed,Object? status = null,Object? messages = null,}) {
  return _then(_self.copyWith(
listProduct: freezed == listProduct ? _self.listProduct : listProduct // ignore: cast_nullable_to_non_nullable
as List<ProductModel>?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProductsByCategoryStatus,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductsByCategoryState].
extension ProductsByCategoryStatePatterns on ProductsByCategoryState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<ProductModel>? listProduct,  ProductsByCategoryStatus status,  String messages)?  initial,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.listProduct,_that.status,_that.messages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<ProductModel>? listProduct,  ProductsByCategoryStatus status,  String messages)  initial,}) {final _that = this;
switch (_that) {
case Initial():
return initial(_that.listProduct,_that.status,_that.messages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<ProductModel>? listProduct,  ProductsByCategoryStatus status,  String messages)?  initial,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.listProduct,_that.status,_that.messages);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements ProductsByCategoryState {
  const Initial({final  List<ProductModel>? listProduct, this.status = ProductsByCategoryStatus.initial, this.messages = ''}): _listProduct = listProduct;
  

 final  List<ProductModel>? _listProduct;
@override List<ProductModel>? get listProduct {
  final value = _listProduct;
  if (value == null) return null;
  if (_listProduct is EqualUnmodifiableListView) return _listProduct;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  ProductsByCategoryStatus status;
@override@JsonKey() final  String messages;

/// Create a copy of ProductsByCategoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitialCopyWith<Initial> get copyWith => _$InitialCopyWithImpl<Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial&&const DeepCollectionEquality().equals(other._listProduct, _listProduct)&&(identical(other.status, status) || other.status == status)&&(identical(other.messages, messages) || other.messages == messages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_listProduct),status,messages);

@override
String toString() {
  return 'ProductsByCategoryState.initial(listProduct: $listProduct, status: $status, messages: $messages)';
}


}

/// @nodoc
abstract mixin class $InitialCopyWith<$Res> implements $ProductsByCategoryStateCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) _then) = _$InitialCopyWithImpl;
@override @useResult
$Res call({
 List<ProductModel>? listProduct, ProductsByCategoryStatus status, String messages
});




}
/// @nodoc
class _$InitialCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(this._self, this._then);

  final Initial _self;
  final $Res Function(Initial) _then;

/// Create a copy of ProductsByCategoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? listProduct = freezed,Object? status = null,Object? messages = null,}) {
  return _then(Initial(
listProduct: freezed == listProduct ? _self._listProduct : listProduct // ignore: cast_nullable_to_non_nullable
as List<ProductModel>?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProductsByCategoryStatus,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
