import 'menu_item.dart';

class CartItem {
  final MenuItem item;
  int quantity;

  CartItem({required this.item, this.quantity = 1});

  double get total => item.price * quantity;
}
