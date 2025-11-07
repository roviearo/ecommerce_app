part of 'wishlist_cubit.dart';

@freezed
abstract class WishlistState with _$WishlistState {
  const factory WishlistState.initial({
    @Default([]) List<ProductModel> listProduct,
    @Default('') String messages,
  }) = Initial;

  factory WishlistState.fromJson(Map<String, dynamic> json) =>
      _$WishlistStateFromJson(json);
}
