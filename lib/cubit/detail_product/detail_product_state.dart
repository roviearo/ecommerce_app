part of 'detail_product_cubit.dart';

@freezed
abstract class DetailProductState with _$DetailProductState {
  const factory DetailProductState.initial({
    ProductModel? product,
    @Default(DetailProductStatus.initial) DetailProductStatus status,
    @Default('') String messages,
  }) = Initial;
}
