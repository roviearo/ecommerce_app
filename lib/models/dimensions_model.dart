import 'package:freezed_annotation/freezed_annotation.dart';

part 'dimensions_model.freezed.dart';
part 'dimensions_model.g.dart';

@freezed
abstract class DimensionsModel with _$DimensionsModel {
  factory DimensionsModel({
    required double width,
    required double height,
    required double depth,
  }) = _DimensionsModel;

  factory DimensionsModel.empty() =>
      DimensionsModel(width: 0, height: 0, depth: 0);

  factory DimensionsModel.fromJson(Map<String, dynamic> json) =>
      _$DimensionsModelFromJson(json);
}
