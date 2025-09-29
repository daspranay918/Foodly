import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final double rating;
  final int maxStars;
  final double size;
  const RatingWidget({
    super.key,
    required this.rating,
    this.maxStars = 5,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxStars, (i) {
        return Icon(
          i < rating.round() ? Icons.star : Icons.star_border,
          color: const Color(0xFFFFC107),
          size: size,
        );
      }),
    );
  }
}
