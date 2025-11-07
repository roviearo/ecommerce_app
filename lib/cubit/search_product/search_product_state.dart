part of 'search_product_cubit.dart';

@freezed
abstract class SearchProductState with _$SearchProductState {
  const factory SearchProductState.initial({
    @Default([]) List<ProductModel> listProduct,
    @Default('') String messages,
    @Default(SearchProductStatus.initial) SearchProductStatus status,
  }) = Initial;
}
