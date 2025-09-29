import 'package:flutter/material.dart';
import 'rating_widget.dart';

class RestaurantCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String cuisine;
  final double rating;
  final int deliveryTime;
  final VoidCallback onTap;

  const RestaurantCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.cuisine,
    required this.rating,
    required this.deliveryTime,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(16),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          imageUrl,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 60,
            height: 60,
            color: Colors.grey[800],
            child: const Icon(Icons.broken_image, color: Colors.white54),
          ),
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cuisine,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Flexible(child: RatingWidget(rating: rating)),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  '$deliveryTime min',
                  style: const TextStyle(color: Colors.white54, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
