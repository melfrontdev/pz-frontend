// lib/models/cart_item.dart

class CartItem {
  final String title;
  final String description;
  final double price;
  final int quantity;
  final String imageUrl;

  CartItem({
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });
}
