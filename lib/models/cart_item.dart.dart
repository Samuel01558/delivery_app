class CartItem {
  final String foodId;
  final int quantity;
  final String size;
  final double price;

  CartItem({
    required this.foodId,
    required this.quantity,
    required this.size,
    required this.price,
  });

  // Método para calcular el precio total del ítem basado en la cantidad
  double get totalPrice => quantity * price;

  // Convertir el objeto a un mapa (útil para persistencia o transferencia de datos)
  Map<String, dynamic> toMap() {
    return {
      'foodId': foodId,
      'quantity': quantity,
      'size': size,
      'price': price,
    };
  }

  // Crear un objeto CartItem a partir de un mapa
  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      foodId: map['foodId'],
      quantity: map['quantity'],
      size: map['size'],
      price: map['price'],
    );
  }

  @override
  String toString() {
    return 'CartItem(foodId: $foodId, quantity: $quantity, size: $size, price: $price)';
  }
}
