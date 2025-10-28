part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = Initial;
  const factory CategoryState.loading() = CategoryLoading;
  const factory CategoryState.allCategoryLoaded({
    required List<CategoryModel> listCategory,
  }) = AllCategoryLoaded;
  const factory CategoryState.productError({required String messages}) =
      CategoryError;
}
