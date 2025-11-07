import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta_model.freezed.dart';
part 'meta_model.g.dart';

@freezed
abstract class MetaModel with _$MetaModel {
  factory MetaModel({
    required DateTime createdAt,
    required DateTime updatedAt,
    required String barcode,
    required String qrCode,
  }) = _MetaModel;

  factory MetaModel.empty() => MetaModel(
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    barcode: '',
    qrCode: '',
  );

  factory MetaModel.fromJson(Map<String, dynamic> json) =>
      _$MetaModelFromJson(json);
}
