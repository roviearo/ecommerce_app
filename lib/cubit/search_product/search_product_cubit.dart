import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/repositories/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_product_state.dart';
part 'search_product_cubit.freezed.dart';

enum SearchProductStatus { initial, searching, loaded, error }

class SearchProductCubit extends Cubit<SearchProductState> {
  SearchProductCubit({required ProductRepository repository})
    : _repository = repository,
      super(SearchProductState.initial());

  final ProductRepository _repository;

  clearSearch() {
    emit(Initial());
  }

  searchProduct(String query) async {
    emit(state.copyWith(status: SearchProductStatus.searching));
    try {
      final listProduct = await _repository.searchProducts(query);
      emit(
        state.copyWith(
          listProduct: listProduct,
          status: SearchProductStatus.loaded,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: SearchProductStatus.error,
          messages: e.toString(),
        ),
      );
    }
  }
}
