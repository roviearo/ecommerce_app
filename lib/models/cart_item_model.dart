import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_model.freezed.dart';
part 'cart_item_model.g.dart';

@freezed
abstract class CartItemModel with _$CartItemModel {
  const factory CartItemModel({
    required int productId,
    required String imageUrl,
    required String title,
    String? brand,
    required double price,
    required double originalPrice,
    required double discountPercentage,
    @Default(1) int quantity,
    @Default(false) bool isSelected,
  }) = _CartItemModel;

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);
}
