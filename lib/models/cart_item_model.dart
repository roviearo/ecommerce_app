import 'package:ecommerce_app/models/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@freezed
abstract class CartItemModel with _$CartItemModel {
  const factory CartItemModel({
    required ProductModel product,
    @Default(1) int quantity,
  }) = _CartItemModel;
}
