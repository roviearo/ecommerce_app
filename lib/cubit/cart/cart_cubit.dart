import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:ecommerce_app/models/cart_item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';
part 'cart_cubit.g.dart';

enum CartStatus { initial, loading, loaded, error }

class CartCubit extends HydratedCubit<CartState> {
  CartCubit() : super(CartState.initial());

  addItem(CartItemModel item) {
    final updated = List<CartItemModel>.from(state.items);
    final index = updated.indexWhere(
      (element) => element.productId == item.productId,
    );

    if (index != -1) {
      updated[index] = updated[index].copyWith(
        quantity: updated[index].quantity + item.quantity,
      );
    } else {
      updated.add(item);
    }

    emit(state.copyWith(items: updated));
  }

  removeItem(int productId) {
    emit(
      state.copyWith(
        items: state.items.where((i) => i.productId != productId).toList(),
      ),
    );
  }

  increaseQuantity(int productId) {
    final updated = state.items.map((item) {
      if (item.productId == productId) {
        return item.copyWith(quantity: item.quantity + 1);
      }
      return item;
    }).toList();

    emit(state.copyWith(items: updated));
  }

  decreaseQuantity(int productId) {
    final updated = state.items
        .map((item) {
          if (item.productId == productId) {
            final newQty = item.quantity - 1;
            if (newQty <= 0) return null;
            return item.copyWith(quantity: newQty);
          }
          return item;
        })
        .whereType<CartItemModel>()
        .toList();

    emit(state.copyWith(items: updated));
  }

  selectItem(int productId) {
    final updated = state.items
        .map((item) {
          if (item.productId == productId) {
            return item.copyWith(isSelected: !item.isSelected);
          }
          return item;
        })
        .whereType<CartItemModel>()
        .toList();

    emit(state.copyWith(items: updated));
  }

  selectAllItem(bool value) {
    final updated = state.items
        .map((item) {
          return item.copyWith(isSelected: value);
        })
        .whereType<CartItemModel>()
        .toList();
    emit(state.copyWith(items: updated));
  }

  void clearCart() {
    emit(state.copyWith(items: []));
  }

  int get totalSelectedCartItem =>
      state.items.where((element) => element.isSelected).length;

  bool get allSelected => state.items.every((element) => element.isSelected);

  double get total => state.items
      .where((item) => item.isSelected)
      .fold(0, (sum, item) => sum + item.price * item.quantity);

  @override
  CartState? fromJson(Map<String, dynamic> json) {
    try {
      return CartState.fromJson(json);
    } catch (e) {
      return CartState.initial(messages: e.toString());
    }
  }

  @override
  Map<String, dynamic>? toJson(CartState state) => state.toJson();
}
