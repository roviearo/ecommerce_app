import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/repositories/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;

  ProductBloc({required ProductRepository productRepository})
    : _productRepository = productRepository,
      super(Initial()) {
    on<LoadAllProductsEvent>(_onLoadAllProductsEvent);
  }

  _onLoadAllProductsEvent(
    LoadAllProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    try {
      emit(const ProductLoading());
      final listProducts = await _productRepository.getAllProducts();
      emit(ProductState.allProductsLoaded(listProduct: listProducts));
    } catch (e) {
      emit(ProductError(messages: e.toString()));
    }
  }
}
