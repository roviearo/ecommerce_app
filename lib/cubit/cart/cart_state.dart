part of 'cart_cubit.dart';

@freezed
abstract class CartState with _$CartState {
  const factory CartState.initial({
    @Default([]) List<CartItemModel> items,
    @Default(CartStatus.initial) CartStatus status,
    @Default('') String messages,
  }) = Initial;

  factory CartState.fromJson(Map<String, dynamic> json) =>
      _$CartStateFromJson(json);
}
