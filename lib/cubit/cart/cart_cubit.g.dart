// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Initial _$InitialFromJson(Map<String, dynamic> json) => Initial(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  status:
      $enumDecodeNullable(_$CartStatusEnumMap, json['status']) ??
      CartStatus.initial,
  messages: json['messages'] as String? ?? '',
);

Map<String, dynamic> _$InitialToJson(Initial instance) => <String, dynamic>{
  'items': instance.items,
  'status': _$CartStatusEnumMap[instance.status]!,
  'messages': instance.messages,
};

const _$CartStatusEnumMap = {
  CartStatus.initial: 'initial',
  CartStatus.loading: 'loading',
  CartStatus.loaded: 'loaded',
  CartStatus.error: 'error',
};
