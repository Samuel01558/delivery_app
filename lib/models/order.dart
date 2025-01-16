enum OrderStatus {
  pending,
  confirmed,
  preparing,
  onTheWay,
  delivered,
  cancelled
}

class OrderItem {
  final String foodId;
  final int quantity;
  final String size;
  final double price;
  final List<String> extras;

  OrderItem({
    required this.foodId,
    required this.quantity,
    required this.size,
    required this.price,
    this.extras = const [],
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
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

class Order {
  final String id;
  final String userId;
  final List<OrderItem> items;
  final double totalAmount;
  final String deliveryAddress;
  final DateTime createdAt;
  final OrderStatus status;
  final String? notes;

  Order({
    required this.id,
    required this.userId,
    required this.items,
    required this.totalAmount,
    required this.deliveryAddress,
    required this.createdAt,
    this.status = OrderStatus.pending,
    this.notes,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      userId: json['userId'],
      items: (json['items'] as List).map((item) => OrderItem.fromJson(item)).toList(),
      totalAmount: json['totalAmount'].toDouble(),
      deliveryAddress: json['deliveryAddress'],
      createdAt: DateTime.parse(json['createdAt']),
      status: OrderStatus.values.firstWhere(
        (e) => e.toString() == json['status'],
        orElse: () => OrderStatus.pending,
      ),
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'items': items.map((item) => item.toJson()).toList(),
      'totalAmount': totalAmount,
      'deliveryAddress': deliveryAddress,
      'createdAt': createdAt.toIso8601String(),
      'status': status.toString(),
      'notes': notes,
    };
  }
}