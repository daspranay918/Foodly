import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import 'rating_widget.dart';

class ItemCard extends StatelessWidget {
  final MenuItem item;
  final VoidCallback onAdd;
  final VoidCallback? onLike;
  final VoidCallback? onTap;

  const ItemCard({
    super.key,
    required this.item,
    required this.onAdd,
    this.onLike,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF23252B), Color(0xFF181A20)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: ListTile(
            contentPadding: const EdgeInsets.all(14),
            leading: Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.network(
                    item.imageUrl,
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 2,
                  right: 2,
                  child: GestureDetector(
                    onTap: onLike,
                    child: Icon(
                      item.liked ? Icons.favorite : Icons.favorite_border,
                      color: item.liked ? Colors.redAccent : Colors.white54,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            title: Text(
              item.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.description,
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(
                      item.isVeg ? Icons.eco : Icons.set_meal,
                      color: item.isVeg ? Colors.green : Colors.red,
                      size: 16,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '\$${item.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    RatingWidget(rating: item.rating, size: 15),
                    Text(
                      ' ${item.rating}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),
              onPressed: onAdd,
              child: const Text('ADD', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
