part of 'products_by_category_cubit.dart';

@freezed
abstract class ProductsByCategoryState with _$ProductsByCategoryState {
  const factory ProductsByCategoryState.initial({
    List<ProductModel>? listProduct,
    @Default(ProductsByCategoryStatus.initial) ProductsByCategoryStatus status,
    @Default('') String messages,
  }) = Initial;
}
