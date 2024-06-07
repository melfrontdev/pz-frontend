// lib/pages/payment_page.dart

import 'package:flutter/material.dart';
import 'package:pizzanove/models/cart_item.dart';
import 'order_confirmation_page.dart';

class PaymentPage extends StatefulWidget {
  final double totalPrice;

  PaymentPage({required this.totalPrice});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? _paymentMethod;
  bool _needsChange = false;
  final TextEditingController _changeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formas de Pagamento'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total: R\$${widget.totalPrice.toStringAsFixed(2)}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
            SizedBox(height: 20),
            Text(
              'Forma de pagamento na entrega:',
              style: TextStyle(fontSize: 18, color: Colors.orange),
            ),
            ListTile(
              title: Text('Débito'),
              leading: Radio<String>(
                value: 'Débito',
                groupValue: _paymentMethod,
                onChanged: (value) {
                  setState(() {
                    _paymentMethod = value;
                    _needsChange = false;
                  });
                },
                activeColor: Colors.orange,
              ),
            ),
            ListTile(
              title: Text('Crédito'),
              leading: Radio<String>(
                value: 'Crédito',
                groupValue: _paymentMethod,
                onChanged: (value) {
                  setState(() {
                    _paymentMethod = value;
                    _needsChange = false;
                  });
                },
                activeColor: Colors.orange,
              ),
            ),
            ListTile(
              title: Text('Dinheiro'),
              leading: Radio<String>(
                value: 'Dinheiro',
                groupValue: _paymentMethod,
                onChanged: (value) {
                  setState(() {
                    _paymentMethod = value;
                    _needsChange = true;
                  });
                },
                activeColor: Colors.orange,
              ),
            ),
            if (_needsChange)
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Precisa de troco?',
                        style: TextStyle(color: Colors.orange)),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _changeController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Para quantos reais?',
                              labelStyle: TextStyle(color: Colors.orange),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderConfirmationPage(),
                    ),
                  );
                },
                child: Text('Finalizar Pedido'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
