// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryEvent()';
}


}

/// @nodoc
class $CategoryEventCopyWith<$Res>  {
$CategoryEventCopyWith(CategoryEvent _, $Res Function(CategoryEvent) __);
}


/// Adds pattern-matching-related methods to [CategoryEvent].
extension CategoryEventPatterns on CategoryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadAllCategoryEvent value)?  loadAllCategory,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadAllCategoryEvent() when loadAllCategory != null:
return loadAllCategory(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadAllCategoryEvent value)  loadAllCategory,}){
final _that = this;
switch (_that) {
case LoadAllCategoryEvent():
return loadAllCategory(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadAllCategoryEvent value)?  loadAllCategory,}){
final _that = this;
switch (_that) {
case LoadAllCategoryEvent() when loadAllCategory != null:
return loadAllCategory(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadAllCategory,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadAllCategoryEvent() when loadAllCategory != null:
return loadAllCategory();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadAllCategory,}) {final _that = this;
switch (_that) {
case LoadAllCategoryEvent():
return loadAllCategory();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadAllCategory,}) {final _that = this;
switch (_that) {
case LoadAllCategoryEvent() when loadAllCategory != null:
return loadAllCategory();case _:
  return null;

}
}

}

/// @nodoc


class LoadAllCategoryEvent implements CategoryEvent {
  const LoadAllCategoryEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadAllCategoryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryEvent.loadAllCategory()';
}


}




/// @nodoc
mixin _$CategoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryState()';
}


}

/// @nodoc
class $CategoryStateCopyWith<$Res>  {
$CategoryStateCopyWith(CategoryState _, $Res Function(CategoryState) __);
}


/// Adds pattern-matching-related methods to [CategoryState].
extension CategoryStatePatterns on CategoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( CategoryLoading value)?  loading,TResult Function( AllCategoryLoaded value)?  allCategoryLoaded,TResult Function( CategoryError value)?  productError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case CategoryLoading() when loading != null:
return loading(_that);case AllCategoryLoaded() when allCategoryLoaded != null:
return allCategoryLoaded(_that);case CategoryError() when productError != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( CategoryLoading value)  loading,required TResult Function( AllCategoryLoaded value)  allCategoryLoaded,required TResult Function( CategoryError value)  productError,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case CategoryLoading():
return loading(_that);case AllCategoryLoaded():
return allCategoryLoaded(_that);case CategoryError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( CategoryLoading value)?  loading,TResult? Function( AllCategoryLoaded value)?  allCategoryLoaded,TResult? Function( CategoryError value)?  productError,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case CategoryLoading() when loading != null:
return loading(_that);case AllCategoryLoaded() when allCategoryLoaded != null:
return allCategoryLoaded(_that);case CategoryError() when productError != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<CategoryModel> listCategory)?  allCategoryLoaded,TResult Function( String messages)?  productError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case CategoryLoading() when loading != null:
return loading();case AllCategoryLoaded() when allCategoryLoaded != null:
return allCategoryLoaded(_that.listCategory);case CategoryError() when productError != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<CategoryModel> listCategory)  allCategoryLoaded,required TResult Function( String messages)  productError,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case CategoryLoading():
return loading();case AllCategoryLoaded():
return allCategoryLoaded(_that.listCategory);case CategoryError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<CategoryModel> listCategory)?  allCategoryLoaded,TResult? Function( String messages)?  productError,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case CategoryLoading() when loading != null:
return loading();case AllCategoryLoaded() when allCategoryLoaded != null:
return allCategoryLoaded(_that.listCategory);case CategoryError() when productError != null:
return productError(_that.messages);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements CategoryState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryState.initial()';
}


}




/// @nodoc


class CategoryLoading implements CategoryState {
  const CategoryLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryState.loading()';
}


}




/// @nodoc


class AllCategoryLoaded implements CategoryState {
  const AllCategoryLoaded({required final  List<CategoryModel> listCategory}): _listCategory = listCategory;
  

 final  List<CategoryModel> _listCategory;
 List<CategoryModel> get listCategory {
  if (_listCategory is EqualUnmodifiableListView) return _listCategory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_listCategory);
}


/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AllCategoryLoadedCopyWith<AllCategoryLoaded> get copyWith => _$AllCategoryLoadedCopyWithImpl<AllCategoryLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllCategoryLoaded&&const DeepCollectionEquality().equals(other._listCategory, _listCategory));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_listCategory));

@override
String toString() {
  return 'CategoryState.allCategoryLoaded(listCategory: $listCategory)';
}


}

/// @nodoc
abstract mixin class $AllCategoryLoadedCopyWith<$Res> implements $CategoryStateCopyWith<$Res> {
  factory $AllCategoryLoadedCopyWith(AllCategoryLoaded value, $Res Function(AllCategoryLoaded) _then) = _$AllCategoryLoadedCopyWithImpl;
@useResult
$Res call({
 List<CategoryModel> listCategory
});




}
/// @nodoc
class _$AllCategoryLoadedCopyWithImpl<$Res>
    implements $AllCategoryLoadedCopyWith<$Res> {
  _$AllCategoryLoadedCopyWithImpl(this._self, this._then);

  final AllCategoryLoaded _self;
  final $Res Function(AllCategoryLoaded) _then;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? listCategory = null,}) {
  return _then(AllCategoryLoaded(
listCategory: null == listCategory ? _self._listCategory : listCategory // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,
  ));
}


}

/// @nodoc


class CategoryError implements CategoryState {
  const CategoryError({required this.messages});
  

 final  String messages;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryErrorCopyWith<CategoryError> get copyWith => _$CategoryErrorCopyWithImpl<CategoryError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryError&&(identical(other.messages, messages) || other.messages == messages));
}


@override
int get hashCode => Object.hash(runtimeType,messages);

@override
String toString() {
  return 'CategoryState.productError(messages: $messages)';
}


}

/// @nodoc
abstract mixin class $CategoryErrorCopyWith<$Res> implements $CategoryStateCopyWith<$Res> {
  factory $CategoryErrorCopyWith(CategoryError value, $Res Function(CategoryError) _then) = _$CategoryErrorCopyWithImpl;
@useResult
$Res call({
 String messages
});




}
/// @nodoc
class _$CategoryErrorCopyWithImpl<$Res>
    implements $CategoryErrorCopyWith<$Res> {
  _$CategoryErrorCopyWithImpl(this._self, this._then);

  final CategoryError _self;
  final $Res Function(CategoryError) _then;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messages = null,}) {
  return _then(CategoryError(
messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
