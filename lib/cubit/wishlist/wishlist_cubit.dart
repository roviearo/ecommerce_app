import 'dart:developer';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wishlist_state.dart';
part 'wishlist_cubit.freezed.dart';
part 'wishlist_cubit.g.dart';

class WishlistCubit extends HydratedCubit<WishlistState> {
  WishlistCubit() : super(WishlistState.initial());

  addProduct(ProductModel product) {
    final updated = List<ProductModel>.from(state.listProduct);
    final index = updated.indexWhere((element) => element.id == product.id);
    log('called $index');
    if (index != -1) {
      updated.remove(product);
    } else {
      updated.add(product);
    }

    emit(state.copyWith(listProduct: updated));
  }

  @override
  WishlistState? fromJson(Map<String, dynamic> json) {
    try {
      return WishlistState.fromJson(json);
    } catch (e) {
      return WishlistState.initial(messages: e.toString());
    }
  }

  @override
  Map<String, dynamic>? toJson(WishlistState state) => state.toJson();
}
