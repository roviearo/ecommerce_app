// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    _CartItemModel(
      productId: (json['productId'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
      title: json['title'] as String,
      brand: json['brand'] as String?,
      price: (json['price'] as num).toDouble(),
      originalPrice: (json['originalPrice'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$CartItemModelToJson(_CartItemModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'brand': instance.brand,
      'price': instance.price,
      'originalPrice': instance.originalPrice,
      'discountPercentage': instance.discountPercentage,
      'quantity': instance.quantity,
      'isSelected': instance.isSelected,
    };
