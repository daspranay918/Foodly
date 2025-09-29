FOODLY APP 🍔

FOODLY APP is a Flutter-based food ordering application that allows users to browse local restaurants, view menus, add items to the cart, checkout, and track their orders. The app is visually appealing, animated, and built with Bloc state management for cart functionality.

Features

Splash Screen – Eye-catching introductory screen for the app.

Restaurant List – Browse restaurants with ratings, cuisine, and delivery time.

Liked Foods – Track favorite foods marked by the user.

Menu Page – View restaurant menus with food details, veg/non-veg indicators, and ratings.

Cart Functionality – Add, remove, or update items with total calculation.

Checkout Page – Review order and proceed to payment (mock).

Order Confirmation – Displays a confirmation screen with a unique order ID.

Order Tracking – Step-by-step order progress (Preparing → On the Way → Delivered).

Animations & UI – Smooth, modern, and visually attractive design using gradients, shadows, and Lottie animations.

Screens

Splash Screen

Restaurant List Page

Menu Page

Cart Page

Checkout Page

Order Confirmation Page

Order Tracking Page

Tech Stack

Flutter & Dart

Bloc – State management for the cart

Lottie – Animations

Material 3 – UI design

Mock Data – Restaurants, menu items, and cart items

Installation

Clone the repository:

git clone https://github.com/yourusername/foodly_app.git


Navigate to the project directory:

cd foodly_app


Install dependencies:

flutter pub get


Run the app:

flutter run

Folder Structure
lib/
 ├─ blocs/                 # Bloc files for cart management
 ├─ models/                # Data models (Restaurant, MenuItem, CartItem)
 ├─ screens/               # All UI screens
 ├─ widgets/               # Reusable widgets (ItemCard, CartTile, etc.)
 ├─ main.dart              # Entry point

Notes

This app uses mock data for restaurants and menu items.

No backend integration is included; the focus is on UI and state management.

The app is fully null-safe and designed for Android, iOS, and Web.

Images:------------------------------------------->
