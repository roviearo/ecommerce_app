import 'package:ecommerce_app/repositories/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_product_state.dart';
part 'detail_product_cubit.freezed.dart';

enum DetailProductStatus { initial, loading, loaded, error }

class DetailProductCubit extends Cubit<DetailProductState> {
  DetailProductCubit({required ProductRepository productRepository})
    : _productRepository = productRepository,
      super(DetailProductState.initial());

  final ProductRepository _productRepository;

  loadDetailProduct(int id) async {
    emit(state.copyWith(status: DetailProductStatus.loading));
    try {
      final product = await _productRepository.getProduct(id);
      emit(
        state.copyWith(product: product, status: DetailProductStatus.loaded),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: DetailProductStatus.error,
          messages: e.toString(),
        ),
      );
    }
  }

  removeDetailProduct() {
    emit(state.copyWith(product: null, status: DetailProductStatus.initial));
  }
}
