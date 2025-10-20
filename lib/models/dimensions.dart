import 'package:equatable/equatable.dart';

class DimensionsModel extends Equatable {
  const DimensionsModel({
    required this.width,
    required this.height,
    required this.depth,
  });

  final double? width;
  final double? height;
  final double? depth;

  factory DimensionsModel.fromJson(Map<String, dynamic> json) {
    return DimensionsModel(
      width: json["width"],
      height: json["height"],
      depth: json["depth"],
    );
  }

  @override
  List<Object?> get props => [width, height, depth];
}
