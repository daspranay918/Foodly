import 'package:flutter/material.dart';
import '../models/restaurant.dart';
import '../models/menu_item.dart';
import '../models/mock_menu_data.dart';
import '../widgets/item_card.dart';
import 'food_detail_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_bloc.dart';
import 'cart_page.dart';

class MenuPage extends StatefulWidget {
  final Restaurant restaurant;
  const MenuPage({super.key, required this.restaurant});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String search = '';
  bool showVegOnly = false;

  void _toggleLike(MenuItem item) {
    setState(() {
      item.liked = !item.liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<MenuItem> filtered = mockMenuItems
        .where((item) => item.restaurantId == widget.restaurant.id)
        .where(
          (item) =>
              (!showVegOnly || item.isVeg) &&
              (search.isEmpty ||
                  item.name.toLowerCase().contains(search.toLowerCase())),
        )
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFF181A20),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.restaurant.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Color(0xFF23252B),
              child: const Icon(Icons.person, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // <------------------------ Restaurant Banner----------------------->
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                    gradient: LinearGradient(
                      colors: [Color(0xFFffb347), Color(0xFFffcc33)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.18),
                        blurRadius: 16,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 24,
                            top: 32,
                            bottom: 24,
                            right: 8,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.restaurant.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    widget.restaurant.rating.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Icon(
                                    Icons.timer,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${widget.restaurant.deliveryTime} min',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                widget.restaurant.cuisine,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 24,
                            top: 24,
                            bottom: 24,
                          ),
                          child: Material(
                            elevation: 16,
                            borderRadius: BorderRadius.circular(24),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.network(
                                widget.restaurant.imageUrl,
                                width: 90,
                                height: 90,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                      width: 90,
                                      height: 90,
                                      color: Colors.grey[300],
                                      child: Icon(
                                        Icons.restaurant,
                                        color: Colors.orange,
                                        size: 40,
                                      ),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -18,
                  left: 32,
                  right: 32,
                  child: Container(
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.18),
                          blurRadius: 16,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // <-----------------------------------Search/filter row--------------------------->
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search menu...',
                      hintStyle: const TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: const Color(0xFF23252B),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white54,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 12,
                      ),
                    ),
                    onChanged: (val) => setState(() => search = val),
                  ),
                ),
                const SizedBox(width: 12),
                FilterChip(
                  label: const Text(
                    'Veg Only',
                    style: TextStyle(color: Colors.white),
                  ),
                  selected: showVegOnly,
                  selectedColor: Colors.green,
                  backgroundColor: const Color(0xFF23252B),
                  onSelected: (val) => setState(() => showVegOnly = val),
                ),
              ],
            ),
          ),
          // <------------------------------Menu list--------------------------------->
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final item = filtered[index];
                return ItemCard(
                  item: item,
                  onAdd: () {
                    context.read<CartBloc>().add(AddToCart(item));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${item.name} added to cart!'),
                        backgroundColor: Colors.green,
                        duration: const Duration(milliseconds: 800),
                      ),
                    );
                  },
                  onLike: () => _toggleLike(item),
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FoodDetailPage(item: item),
                      ),
                    );
                    if (result == 'add') {
                      context.read<CartBloc>().add(AddToCart(item));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${item.name} added to cart!'),
                          backgroundColor: Colors.green,
                          duration: const Duration(milliseconds: 800),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: const BoxDecoration(
              color: Color(0xFF23252B),
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: \$${state.total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 12,
                    ),
                  ),
                  onPressed: state.items.isEmpty
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const CartPage()),
                          );
                        },
                  child: const Text(
                    'View Cart',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
