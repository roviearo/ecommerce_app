import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

@freezed
abstract class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required String slug,
    required String name,
    required String url,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
