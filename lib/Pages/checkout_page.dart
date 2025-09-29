import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_bloc.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _addressController = TextEditingController();
  String _paymentMethod = 'Credit Card';
  bool _isPlacingOrder = false;

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  void _placeOrder(BuildContext context) async {
    setState(() => _isPlacingOrder = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _isPlacingOrder = false);
    context.read<CartBloc>().add(ClearCart());
    Navigator.pushReplacementNamed(context, '/confirmation');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181A20),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Checkout',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const Text(
                'Delivery Address',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _addressController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your address',
                  hintStyle: const TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: const Color(0xFF23252B),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 12,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Payment Method',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Radio<String>(
                    value: 'Credit Card',
                    groupValue: _paymentMethod,
                    onChanged: (v) => setState(() => _paymentMethod = v!),
                    activeColor: Colors.orange,
                  ),
                  const Text(
                    'Credit Card',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 20),
                  Radio<String>(
                    value: 'Cash on Delivary',
                    groupValue: _paymentMethod,
                    onChanged: (v) => setState(() => _paymentMethod = v!),
                    activeColor: Colors.orange,
                  ),
                  const Text(
                    'Cash on Delivary',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Order Summary',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ...state.items.map(
                (cartItem) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    cartItem.item.name,
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: Text(
                    'x${cartItem.quantity}  \$${cartItem.total.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                ),
              ),
              const Divider(color: Colors.white24, height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '\$${state.total.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: _isPlacingOrder ? null : () => _placeOrder(context),
                child: _isPlacingOrder
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Text(
                        'Place Order',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
