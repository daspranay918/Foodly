import 'package:flutter/material.dart';
import 'menu_page.dart';
import 'cart_page.dart';
import '../models/mock_restaurant_data.dart';
import '../widgets/restaurant_card.dart';
import '../models/mock_menu_data.dart';
import 'restaurant_list_page_widgets.dart';
import 'order_track_page.dart';

class RestaurantListPage extends StatefulWidget {
  const RestaurantListPage({super.key});

  @override
  State<RestaurantListPage> createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  int _selectedIndex = 0;
  String search = '';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigation logic
    if (index == 3) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (_) => CartPage())).then((_) {
        setState(() => _selectedIndex = 0);
      });
    } else if (index == 4) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const OrderTrackPage()))
          .then((_) {
            setState(() => _selectedIndex = 0);
          });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            index == 1
                ? 'Offers coming soon!'
                : index == 2
                ? 'Favorites coming soon!'
                : '',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredRestaurants = mockRestaurants
        .where((r) => r.name.toLowerCase().contains(search.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFF181A20),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 16), // Logo padding
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/logo.png',
                    width: 36,
                    height: 36,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(width: 10),
              const Text(
                'FOODLY APP',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Profile coming soon!')),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF23252B),
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search restaurants...',
                  hintStyle: const TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.search, color: Colors.white54),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onChanged: (val) => setState(() => search = val),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // <---------------- food logo--------------------->
          Positioned.fill(
            child: Opacity(
              opacity: 0.07,
              child: Center(
                child: Icon(Icons.fastfood, size: 420, color: Colors.white),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //<-------------------- Banner-------------------->
                Container(
                  margin: const EdgeInsets.only(
                    top: 32,
                    left: 16,
                    right: 16,
                    bottom: 8,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            gradient: LinearGradient(
                              colors: [
                                Colors.orangeAccent.withOpacity(0.7),
                                Colors.deepOrange.withOpacity(0.7),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Hungry?',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Order food from top restaurants',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Icon(
                                  Icons.fastfood,
                                  color: Colors.white,
                                  size: 48,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        height: 120,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.04),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Icon(
                                Icons.account_balance_wallet,
                                color: Colors.greenAccent,
                                size: 26,
                              ),
                            ),
                            SizedBox(height: 10),
                            Icon(
                              Icons.notifications_none,
                              color: Colors.amber,
                              size: 26,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // <-------------------Foods that liked by user---------->
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  height: 90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 4, bottom: 4),
                        child: Text(
                          'Liked Foods',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ...mockMenuItems
                                .where((i) => i.liked)
                                .map(
                                  (item) => Card(
                                    color: const Color(0xFF23252B),
                                    elevation: 8,
                                    shadowColor: Colors.black.withOpacity(0.25),
                                    margin: const EdgeInsets.only(right: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: LikedFoodCard(
                                      imageUrl: item.imageUrl,
                                      name: item.name,
                                    ),
                                  ),
                                ),
                            if (mockMenuItems.where((i) => i.liked).isEmpty)
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'No liked foods yet',
                                  style: TextStyle(color: Colors.white54),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // <--------------Restaurant's List------------>
                Expanded(
                  child: filteredRestaurants.isEmpty
                      ? const Center(
                          child: Text(
                            'No restaurants found',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 16,
                            ),
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          itemCount: filteredRestaurants.length,
                          itemBuilder: (context, index) {
                            final restaurant = filteredRestaurants[index];
                            return Card(
                              color: const Color(0xFF23252B),
                              elevation: 8,
                              shadowColor: Colors.black.withOpacity(0.25),
                              margin: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: RestaurantCard(
                                imageUrl: restaurant.imageUrl,
                                name: restaurant.name,
                                cuisine: restaurant.cuisine,
                                rating: restaurant.rating,
                                deliveryTime: restaurant.deliveryTime,
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          MenuPage(restaurant: restaurant),
                                    ),
                                  );
                                  setState(
                                    () {}, //<---------- liked foods row-------------------->
                                  );
                                },
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF23252B),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: _selectedIndex == 0 ? Colors.orangeAccent : Colors.white,
              ),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Icon(
                Icons.local_offer,
                color: _selectedIndex == 1 ? Colors.orangeAccent : Colors.white,
              ),
              onPressed: () => _onItemTapped(1),
            ),
            IconButton(
              icon: Icon(
                Icons.favorite_border,
                color: _selectedIndex == 2 ? Colors.orangeAccent : Colors.white,
              ),
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: _selectedIndex == 3 ? Colors.orangeAccent : Colors.white,
              ),
              onPressed: () => _onItemTapped(3),
            ),
            IconButton(
              icon: Icon(
                Icons.delivery_dining,
                color: _selectedIndex == 4 ? Colors.orangeAccent : Colors.white,
              ),
              onPressed: () => _onItemTapped(4),
            ),
          ],
        ),
      ),
    );
  }
}
