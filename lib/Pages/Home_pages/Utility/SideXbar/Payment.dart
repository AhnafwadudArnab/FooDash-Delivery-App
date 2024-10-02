import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _currencyController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _processPayment() async {
    final amount = _amountController.text;
    final currency = _currencyController.text;

    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _currencyController,
              decoration: const InputDecoration(labelText: 'Currency'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _processPayment,
              child: const Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    _currencyController.dispose();
    super.dispose();
  }
}
