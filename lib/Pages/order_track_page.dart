import 'package:flutter/material.dart';

class OrderTrackPage extends StatefulWidget {
  const OrderTrackPage({super.key});

  @override
  State<OrderTrackPage> createState() => _OrderTrackPageState();
}

class _OrderTrackPageState extends State<OrderTrackPage> {
  int _step = 0;
  final List<String> _steps = ['Preparing', 'On the Way', 'Delivered'];

  void _nextStep() {
    if (_step < _steps.length - 1) {
      setState(() => _step++);
    }
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
          'Order Tracking',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
        child: Column(
          children: [
            ...List.generate(_steps.length, (i) => _buildStep(i)),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 14,
                ),
              ),
              onPressed: _step < _steps.length - 1 ? _nextStep : null,
              child: Text(
                _step < _steps.length - 1 ? 'Next Step' : 'Order Complete',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(int i) {
    final isActive = i == _step;
    final isDone = i < _step;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: isDone
                    ? Colors.green
                    : (isActive ? Colors.orange : Colors.grey[700]),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isDone ? Icons.check : Icons.circle,
                color: Colors.white,
                size: 18,
              ),
            ),
            if (i < _steps.length - 1)
              Container(
                width: 4,
                height: 40,
                color: isDone ? Colors.green : Colors.grey[700],
              ),
          ],
        ),
        const SizedBox(width: 18),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            _steps[i],
            style: TextStyle(
              color: isActive
                  ? Colors.orange
                  : (isDone ? Colors.green : Colors.white54),
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
