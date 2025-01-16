import 'package:flutter/foundation.dart';
import 'package:delivery_app/models/cart.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];
  
  List<CartItem> get items => [..._items];
  int get itemCount => _items.length;
  
  double get total => _items.fold(
    0, 
    (sum, item) => sum + (item.price * item.quantity)
  );

  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(String foodId) {
    _items.removeWhere((item) => item.foodId == foodId);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}