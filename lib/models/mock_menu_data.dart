import '../models/menu_item.dart';

final List<MenuItem> mockMenuItems = [
  MenuItem(
    id: 'm1',
    restaurantId: '1',
    name: 'Whopper Burger',
    description: 'Juicy flame-grilled beef patty with fresh veggies.',
    imageUrl:
        'https://i.pinimg.com/736x/ab/fb/cb/abfbcb3d499612dabecca4f230daf530.jpg',
    price: 5.99,
    rating: 4.7,
    isVeg: false,
  ),
  MenuItem(
    id: 'm2',
    restaurantId: '1',
    name: 'Veggie Burger',
    description: 'Crispy veggie patty with lettuce and tomato.',
    imageUrl:
        'https://i.pinimg.com/1200x/75/45/51/7545519248abb0d48e10936131f50bd1.jpg',
    price: 4.49,
    rating: 4.3,
    isVeg: true,
  ),
  MenuItem(
    id: 'm3',
    restaurantId: '2',
    name: 'Big Mac',
    description: 'Classic double beef burger with special sauce.',
    imageUrl:
        'https://i.pinimg.com/736x/cd/fc/fe/cdfcfe87aaaab077440e31e0ad3a4e74.jpg',
    price: 6.29,
    rating: 4.6,
    isVeg: false,
  ),
  MenuItem(
    id: 'm4',
    restaurantId: '2',
    name: 'McVeggie',
    description: 'Delicious veggie patty with cheese and mayo.',
    imageUrl:
        'https://i.pinimg.com/1200x/60/d9/e8/60d9e88ba17080ead111f9d0577a6d8f.jpg',
    price: 4.99,
    rating: 4.2,
    isVeg: true,
  ),
  MenuItem(
    id: 'm5',
    restaurantId: '3',
    name: 'Chicken Sub',
    description: 'Grilled chicken with fresh veggies in a sub.',
    imageUrl:
        'https://i.pinimg.com/736x/b0/30/f2/b030f25fbcbbd27d95fcc8a97900cc41.jpg',
    price: 5.49,
    rating: 4.4,
    isVeg: false,
  ),
  MenuItem(
    id: 'm6',
    restaurantId: '3',
    name: 'Veggie Delight',
    description: 'Loaded with fresh veggies and cheese.',
    imageUrl:
        'https://i.pinimg.com/1200x/c5/a0/ad/c5a0ade30a86f72d5ea7b18c61dfb118.jpg',
    price: 4.29,
    rating: 4.1,
    isVeg: true,
  ),
];
