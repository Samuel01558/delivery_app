class CartItem {
  final String foodId;
  final int quantity;
  final String size;
  final double price;
  final List<String> extras;

  CartItem({
    required this.foodId,
    required this.quantity,
    required this.size,
    required this.price,
    this.extras = const [],
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      foodId: json['foodId'],
      quantity: json['quantity'],
      size: json['size'],
      price: json['price'].toDouble(),
      extras: List<String>.from(json['extras'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'foodId': foodId,
      'quantity': quantity,
      'size': size,
      'price': price,
      'extras': extras,
    };
  }
}
