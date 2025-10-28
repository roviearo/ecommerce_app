// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent()';
}


}

/// @nodoc
class $ProductEventCopyWith<$Res>  {
$ProductEventCopyWith(ProductEvent _, $Res Function(ProductEvent) __);
}


/// Adds pattern-matching-related methods to [ProductEvent].
extension ProductEventPatterns on ProductEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadAllProductsEvent value)?  loadAllProducts,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadAllProductsEvent() when loadAllProducts != null:
return loadAllProducts(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadAllProductsEvent value)  loadAllProducts,}){
final _that = this;
switch (_that) {
case LoadAllProductsEvent():
return loadAllProducts(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadAllProductsEvent value)?  loadAllProducts,}){
final _that = this;
switch (_that) {
case LoadAllProductsEvent() when loadAllProducts != null:
return loadAllProducts(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadAllProducts,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadAllProductsEvent() when loadAllProducts != null:
return loadAllProducts();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadAllProducts,}) {final _that = this;
switch (_that) {
case LoadAllProductsEvent():
return loadAllProducts();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadAllProducts,}) {final _that = this;
switch (_that) {
case LoadAllProductsEvent() when loadAllProducts != null:
return loadAllProducts();case _:
  return null;

}
}

}

/// @nodoc


class LoadAllProductsEvent implements ProductEvent {
  const LoadAllProductsEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadAllProductsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent.loadAllProducts()';
}


}




/// @nodoc
mixin _$ProductState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState()';
}


}

/// @nodoc
class $ProductStateCopyWith<$Res>  {
$ProductStateCopyWith(ProductState _, $Res Function(ProductState) __);
}


/// Adds pattern-matching-related methods to [ProductState].
extension ProductStatePatterns on ProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( ProductLoading value)?  loading,TResult Function( AllProductsLoaded value)?  allProductsLoaded,TResult Function( ProductError value)?  productError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case ProductLoading() when loading != null:
return loading(_that);case AllProductsLoaded() when allProductsLoaded != null:
return allProductsLoaded(_that);case ProductError() when productError != null:
return productError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( ProductLoading value)  loading,required TResult Function( AllProductsLoaded value)  allProductsLoaded,required TResult Function( ProductError value)  productError,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case ProductLoading():
return loading(_that);case AllProductsLoaded():
return allProductsLoaded(_that);case ProductError():
return productError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( ProductLoading value)?  loading,TResult? Function( AllProductsLoaded value)?  allProductsLoaded,TResult? Function( ProductError value)?  productError,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case ProductLoading() when loading != null:
return loading(_that);case AllProductsLoaded() when allProductsLoaded != null:
return allProductsLoaded(_that);case ProductError() when productError != null:
return productError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ProductModel> listProduct)?  allProductsLoaded,TResult Function( String messages)?  productError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case ProductLoading() when loading != null:
return loading();case AllProductsLoaded() when allProductsLoaded != null:
return allProductsLoaded(_that.listProduct);case ProductError() when productError != null:
return productError(_that.messages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ProductModel> listProduct)  allProductsLoaded,required TResult Function( String messages)  productError,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case ProductLoading():
return loading();case AllProductsLoaded():
return allProductsLoaded(_that.listProduct);case ProductError():
return productError(_that.messages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ProductModel> listProduct)?  allProductsLoaded,TResult? Function( String messages)?  productError,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case ProductLoading() when loading != null:
return loading();case AllProductsLoaded() when allProductsLoaded != null:
return allProductsLoaded(_that.listProduct);case ProductError() when productError != null:
return productError(_that.messages);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements ProductState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState.initial()';
}


}




/// @nodoc


class ProductLoading implements ProductState {
  const ProductLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState.loading()';
}


}




/// @nodoc


class AllProductsLoaded implements ProductState {
  const AllProductsLoaded({required final  List<ProductModel> listProduct}): _listProduct = listProduct;
  

 final  List<ProductModel> _listProduct;
 List<ProductModel> get listProduct {
  if (_listProduct is EqualUnmodifiableListView) return _listProduct;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_listProduct);
}


/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AllProductsLoadedCopyWith<AllProductsLoaded> get copyWith => _$AllProductsLoadedCopyWithImpl<AllProductsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllProductsLoaded&&const DeepCollectionEquality().equals(other._listProduct, _listProduct));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_listProduct));

@override
String toString() {
  return 'ProductState.allProductsLoaded(listProduct: $listProduct)';
}


}

/// @nodoc
abstract mixin class $AllProductsLoadedCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory $AllProductsLoadedCopyWith(AllProductsLoaded value, $Res Function(AllProductsLoaded) _then) = _$AllProductsLoadedCopyWithImpl;
@useResult
$Res call({
 List<ProductModel> listProduct
});




}
/// @nodoc
class _$AllProductsLoadedCopyWithImpl<$Res>
    implements $AllProductsLoadedCopyWith<$Res> {
  _$AllProductsLoadedCopyWithImpl(this._self, this._then);

  final AllProductsLoaded _self;
  final $Res Function(AllProductsLoaded) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? listProduct = null,}) {
  return _then(AllProductsLoaded(
listProduct: null == listProduct ? _self._listProduct : listProduct // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,
  ));
}


}

/// @nodoc


class ProductError implements ProductState {
  const ProductError({required this.messages});
  

 final  String messages;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductErrorCopyWith<ProductError> get copyWith => _$ProductErrorCopyWithImpl<ProductError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductError&&(identical(other.messages, messages) || other.messages == messages));
}


@override
int get hashCode => Object.hash(runtimeType,messages);

@override
String toString() {
  return 'ProductState.productError(messages: $messages)';
}


}

/// @nodoc
abstract mixin class $ProductErrorCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory $ProductErrorCopyWith(ProductError value, $Res Function(ProductError) _then) = _$ProductErrorCopyWithImpl;
@useResult
$Res call({
 String messages
});




}
/// @nodoc
class _$ProductErrorCopyWithImpl<$Res>
    implements $ProductErrorCopyWith<$Res> {
  _$ProductErrorCopyWithImpl(this._self, this._then);

  final ProductError _self;
  final $Res Function(ProductError) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messages = null,}) {
  return _then(ProductError(
messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
