// lib/pages/finalize_purchase_page.dart

import 'package:flutter/material.dart';
import 'package:pizzanove/models/cart_item.dart';
import 'payment_page.dart'; // Importe a página de formas de pagamento

class FinalizePurchasePage extends StatelessWidget {
  final List<CartItem> cartItems = [
    CartItem(
      title: 'Pizza Calabresa',
      description: 'Calabresa com cebola',
      price: 20.0,
      quantity: 1,
      imageUrl: 'lib/images/pizza_calabresa.jpg',
    ),
    CartItem(
      title: 'Pizza Quatro Queijos',
      description: 'Quatro tipos de queijo',
      price: 25.0,
      quantity: 2,
      imageUrl: 'lib/images/pizza_quatro_queijos.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double totalPrice =
        cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

    return Scaffold(
      appBar: AppBar(
        title: Text('Finalizar Compra'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: Image.network(
                      item.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      item.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    subtitle: Text(
                      '${item.description}\nQuantidade: ${item.quantity}',
                      style: TextStyle(color: Colors.black54),
                    ),
                    trailing: Text(
                      'R\$${(item.price * item.quantity).toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    Text(
                      'R\$${totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PaymentPage(totalPrice: totalPrice),
                      ),
                    );
                  },
                  child: Text('Ir para formas de pagamento'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
