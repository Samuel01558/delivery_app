import 'package:delivery_app/models/food_item.dart';
import 'package:delivery_app/models/food_category.dart';
import 'package:delivery_app/models/order.dart';

class ApiService {
  Future<List<FoodCategory>> getCategories() async {
    // Simular llamada a API
    await Future.delayed(const Duration(seconds: 1));
    
    return [
      FoodCategory(
        id: '1',
        title: 'Pizza',
        image: 'assets/images/pizza.jpg',
        description: 'Delicious Italian pizzas',
        rating: 5,
      ),
      FoodCategory(
        id: '2',
        title: 'Fast Food',
        image: 'assets/images/fastfood.jpg',
        description: 'Quick and tasty fast food',
        rating: 4,
      ),
      FoodCategory(
        id: '3',
        title: 'Italian',
        image: 'assets/images/italian.jpg',
        description: 'Authentic Italian cuisine',
        rating: 5,
      ),
      FoodCategory(
        id: '4',
        title: 'Soup',
        image: 'assets/images/soup.jpg',
        description: 'Warm and comforting soups',
        rating: 4,
      ),
      FoodCategory(
        id: '5',
        title: 'German',
        image: 'assets/images/german.jpg',
        description: 'Traditional German dishes',
        rating: 5,
      ),
      FoodCategory(
        id: '6',
        title: 'Mexican',
        image: 'assets/images/mexican.jpg',
        description: 'Spicy and flavorful Mexican food',
        rating: 5,
      ),
    ];
  }

  Future<List<FoodItem>> getFoodItems(String categoryId) async {
    // Simular llamada a API
    await Future.delayed(const Duration(seconds: 1));
    
    // Filtrar los productos por categoría
    return [
      FoodItem(
        id: '1',
        name: 'Margherita Pizza',
        description: 'Classic pizza with tomato sauce and mozzarella',
        price: 10.99,
        image: 'assets/images/margherita.jpg',
        categoryId: '1',
        sizesPrices: {
          'Small': 10.99,
          'Medium': 13.99,
          'Large': 16.99,
        },
      ),
      FoodItem(
        id: '2',
        name: 'Pepperoni Pizza',
        description: 'Pizza with pepperoni and mozzarella',
        price: 12.99,
        image: 'assets/images/pepperoni.jpg',
        categoryId: '1',
        sizesPrices: {
          'Small': 12.99,
          'Medium': 15.99,
          'Large': 18.99,
        },
      ),
      FoodItem(
        id: '3',
        name: 'Cheeseburger',
        description: 'Burger with cheese, lettuce, and tomato',
        price: 8.99,
        image: 'assets/images/cheeseburger.jpg',
        categoryId: '2',
        sizesPrices: {
          'Regular': 8.99,
        },
      ),
      FoodItem(
        id: '4',
        name: 'Spaghetti Carbonara',
        description: 'Pasta with creamy sauce and pancetta',
        price: 14.99,
        image: 'assets/images/carbonara.jpg',
        categoryId: '3',
        sizesPrices: {
          'Regular': 14.99,
        },
      ),
      // Agregar más items...
    ].where((item) => item.categoryId == categoryId).toList();
  }

  Future<Order> createOrder(Order order) async {
    // Simular llamada a API
    await Future.delayed(const Duration(seconds: 2));
    
    return order;
  }
}