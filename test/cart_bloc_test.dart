import 'package:flutter_test/flutter_test.dart';
import 'package:foodly/blocs/cart_bloc.dart';
import 'package:foodly/models/menu_item.dart';

void main() {
  group('CartBloc', () {
    late CartBloc bloc;
    final item = MenuItem(
      id: '1',
      restaurantId: '1',
      name: 'Test',
      description: 'desc',
      imageUrl: '',
      price: 10,
      rating: 4.5,
      isVeg: true,
    );

    setUp(() => bloc = CartBloc());

    test('AddToCart increases item count', () {
      bloc.add(AddToCart(item));
      expectLater(
        bloc.stream,
  emits(predicate((state) => state is CartState && state.items.isNotEmpty)),
      );
    });

    test('RemoveFromCart removes item', () async {
      bloc.add(AddToCart(item));
      await Future.delayed(Duration.zero);
      bloc.add(RemoveFromCart(item));
      expectLater(
        bloc.stream,
  emits(predicate((state) => state is CartState && state.items.isEmpty)),
      );
    });

    test('ChangeQty updates quantity', () async {
      bloc.add(AddToCart(item));
      await Future.delayed(Duration.zero);
      bloc.add(ChangeQty(item, 3));
      expectLater(
        bloc.stream,
  emits(predicate((state) => state is CartState && state.items.first.quantity == 3)),
      );
    });
  });
}
