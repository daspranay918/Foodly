import 'package:flutter/material.dart';
import 'package:foodly/Pages/checkout_page.dart';
import 'package:foodly/Pages/confirmation_page.dart';
import 'package:foodly/Pages/order_track_page.dart';
import 'Pages/restaurant_list_page.dart';
import 'Pages/splash_screen_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/cart_bloc.dart';

void main() {
  runApp(const HungerApp());
}

class HungerApp extends StatelessWidget {
  const HungerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Foodly APP',
        theme: ThemeData(
          fontFamily: 'Montserrat',
          scaffoldBackgroundColor: const Color(0xFF181A20),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.orange,
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
        home: const SplashScreenWrapper(),
        routes: {
          '/home': (_) => const RestaurantListPage(),
          '/checkout': (_) => const CheckoutPage(),
          '/confirmation': (_) => const ConfirmationPage(),
          '/track': (_) => const OrderTrackPage(),
        },
      ),
    );
  }
}

class SplashScreenWrapper extends StatefulWidget {
  const SplashScreenWrapper({super.key});

  @override
  State<SplashScreenWrapper> createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
