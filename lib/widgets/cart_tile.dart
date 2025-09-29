import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartTile extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback onRemove;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartTile({
    super.key,
    required this.cartItem,
    required this.onRemove,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          colors: [Color(0xFF23252B), Color(0xFF181A20)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.13),
            blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(14),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            cartItem.item.imageUrl,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          cartItem.item.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        subtitle: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Text(
                '\$${cartItem.item.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: const Icon(
                  Icons.remove_circle,
                  color: Colors.white70,
                  size: 20,
                ),
                onPressed: onDecrement,
              ),
              Text(
                cartItem.quantity.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.add_circle,
                  color: Colors.orange,
                  size: 20,
                ),
                onPressed: onIncrement,
              ),
            ],
          ),
        ),
        trailing: SizedBox(
          height: 48,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '\$${cartItem.total.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                    size: 20,
                  ),
                  onPressed: onRemove,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
