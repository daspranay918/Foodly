import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/menu_item.dart';
import '../models/cart_item.dart';

class ClearCart extends CartEvent {}

abstract class CartEvent {}

class AddToCart extends CartEvent {
  final MenuItem item;
  AddToCart(this.item);
}

class RemoveFromCart extends CartEvent {
  final MenuItem item;
  RemoveFromCart(this.item);
}

class ChangeQty extends CartEvent {
  final MenuItem item;
  final int qty;
  ChangeQty(this.item, this.qty);
}

class CartState {
  final List<CartItem> items;
  CartState(this.items);

  double get total => items.fold(0, (sum, e) => sum + e.total);
}

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState([])) {
    on<AddToCart>((event, emit) {
      final items = List<CartItem>.from(state.items);
      final idx = items.indexWhere((e) => e.item.id == event.item.id);
      if (idx >= 0) {
        items[idx].quantity++;
      } else {
        items.add(CartItem(item: event.item));
      }
      emit(CartState(items));
    });
    on<RemoveFromCart>((event, emit) {
      final items = List<CartItem>.from(state.items);
      items.removeWhere((e) => e.item.id == event.item.id);
      emit(CartState(items));
    });
    on<ChangeQty>((event, emit) {
      final items = List<CartItem>.from(state.items);
      final idx = items.indexWhere((e) => e.item.id == event.item.id);
      if (idx >= 0) {
        if (event.qty <= 0) {
          items.removeAt(idx);
        } else {
          items[idx].quantity = event.qty;
        }
      }
      emit(CartState(items));
    });
    on<ClearCart>((event, emit) {
      emit(CartState([]));
    });
  }
}
