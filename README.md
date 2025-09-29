# FOODLY APP 🍔

FOODLY APP is a Flutter-based food ordering application that allows users to browse local restaurants, view menus, add items to the cart, checkout, and track their orders. The app is visually appealing, animated, and built with **Bloc** state management for cart functionality.

---

## Features

- **Splash Screen** – Eye-catching introductory screen for the app.  
- **Restaurant List** – Browse restaurants with ratings, cuisine, and delivery time.  
- **Liked Foods** – Track favorite foods marked by the user.  
- **Menu Page** – View restaurant menus with food details, veg/non-veg indicators, and ratings.  
- **Cart Functionality** – Add, remove, or update items with total calculation.  
- **Checkout Page** – Review order and proceed to payment (mock).  
- **Order Confirmation** – Displays a confirmation screen with a unique order ID.  
- **Order Tracking** – Step-by-step order progress (Preparing → On the Way → Delivered).  
- **Animations & UI** – Smooth, modern, and visually attractive design using gradients, shadows, and Lottie animations.

---

## Screens

- Splash Screen  
- Restaurant List Page  
- Menu Page  
- Cart Page  
- Checkout Page  
- Order Confirmation Page  
- Order Tracking Page  

---

## Tech Stack

- **Flutter & Dart**  
- **Bloc** – State management for the cart  
- **Lottie** – Animations  
- **Material 3** – UI design  
- **Mock Data** – Restaurants, menu items, and cart items  

---

## Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/foodly_app.git

# Navigate to the project directory
cd foodly_app

# Install dependencies
flutter pub get

# Run the app
flutter run
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

Screenshots
<p align="center"> <img src="https://github.com/user-attachments/assets/10a84b8c-d2cc-4a5f-a3a6-9deed312b79d" width="250" /> <img src="https://github.com/user-attachments/assets/326ae8e0-0b59-43c5-ae12-e49866051714" width="250" /> <img src="https://github.com/user-attachments/assets/7a9449a0-b9eb-466f-be2d-13ee40369f66" width="250" /> </p> <p align="center"> <img src="https://github.com/user-attachments/assets/ac1836d3-c0a6-4b17-98d0-3e6df9b24a81" width="250" /> <img src="https://github.com/user-attachments/assets/b754b322-1af5-471f-b6df-4479b870d1a2" width="250" /> <img src="https://github.com/user-attachments/assets/bfd3e122-f685-4bd8-8204-e615ac700aeb" width="250" /> </p> <p align="center"> <img src="https://github.com/user-attachments/assets/0c19d625-3a3d-4fe1-b1a4-c19b6dbd5e95" width="250" /> <img src="https://github.com/user-attachments/assets/26eb6bf0-bd47-49b3-a940-af4879716b10" width="250" /> <img src="https://github.com/user-attachments/assets/d08efee5-57f2-4de6-8b13-8e9fe7cf231e" width="250" /> </p> <p align="center"> <img src="https://github.com/user-attachments/assets/8684ccab-bfa7-4544-a3a0-0a3f420dac68" width="250" /> <img src="https://github.com/user-attachments/assets/ee758f7d-4833-4a98-9341-918a930a74df" width="250" /> </p> ```
