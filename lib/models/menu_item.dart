class MenuItem {
  final String id;
  final String restaurantId;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final double rating;
  final bool isVeg;
  bool liked;

  MenuItem({
    required this.id,
    required this.restaurantId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.isVeg,
    this.liked = false,
  });
}
