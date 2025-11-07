import 'package:ecommerce_app/repositories/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_by_category_state.dart';
part 'products_by_category_cubit.freezed.dart';

enum ProductsByCategoryStatus { initial, loading, loaded, error }

class ProductsByCategoryCubit extends Cubit<ProductsByCategoryState> {
  ProductsByCategoryCubit({required ProductRepository productRepository})
    : _productRepository = productRepository,
      super(ProductsByCategoryState.initial());

  final ProductRepository _productRepository;

  loadProductsbyCategory(String category) async {
    emit(state.copyWith(status: ProductsByCategoryStatus.loading));
    try {
      final listProduct = await _productRepository.getProductsbyCategory(
        category,
      );
      emit(
        state.copyWith(
          listProduct: listProduct,
          status: ProductsByCategoryStatus.loaded,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ProductsByCategoryStatus.error,
          messages: e.toString(),
        ),
      );
    }
  }
}
