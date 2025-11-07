part of 'product_bloc.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = Initial;
  const factory ProductState.loading() = ProductLoading;
  const factory ProductState.allProductsLoaded({
    required List<ProductModel> listProduct,
  }) = AllProductsLoaded;
  const factory ProductState.productError({required String messages}) =
      ProductError;
}
