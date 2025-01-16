import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:delivery_app/providers/cart_provider.dart';
import 'package:delivery_app/screens/order_confirmation_screen.dart';
import 'package:delivery_app/models/cart.dart';

class ProductListScreen extends StatelessWidget {
  final String categoryId;

  const ProductListScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const SearchField(),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrderConfirmationScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ProductList(categoryId: categoryId),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        suffixIcon: const Icon(Icons.close),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  final String categoryId;

  const ProductList({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final List<Pizza> pizzas = [
      Pizza(
        name: 'Margherita',
        description: 'Classic pizza with tomato sauce, fresh mozzarella, and basil.',
        price: 30,
      ),
      Pizza(
        name: 'Pepperoni',
        description: 'Pizza with tomato sauce, mozzarella, and pepperoni slices.',
        price: 30,
      ),
      Pizza(
        name: 'Hawaiian',
        description: 'Pizza with tomato sauce, ham, and pineapple slices.',
        price: 30,
      ),
      Pizza(
        name: 'Four Cheese',
        description: 'Pizza with a mix of mozzarella, blue cheese, parmesan, and goat cheese.',
        price: 30,
      ),
      Pizza(
        name: 'Vegetarian',
        description: 'Pizza with tomato sauce and a variety of fresh vegetables.',
        price: 30,
      ),
    ];

    final List<Burger> burgers = [
      Burger(
        name: 'Classic Burger',
        description: 'Beef patty with lettuce, tomato, and cheese.',
        price: 25,
      ),
      Burger(
        name: 'Cheeseburger',
        description: 'Beef patty with cheese, lettuce, and tomato.',
        price: 27,
      ),
      Burger(
        name: 'Bacon Burger',
        description: 'Beef patty with bacon, lettuce, and tomato.',
        price: 28,
      ),
      Burger(
        name: 'Veggie Burger',
        description: 'Vegetarian patty with lettuce, tomato, and cheese.',
        price: 26,
      ),
    ];

    final List<Italian> italian = [
      Italian(
        name: 'Spaghetti Carbonara',
        description: 'Pasta with creamy sauce and pancetta.',
        price: 20,
      ),
      Italian(
        name: 'Lasagna',
        description: 'Layers of pasta, meat sauce, and cheese.',
        price: 22,
      ),
      Italian(
        name: 'Risotto',
        description: 'Creamy rice with mushrooms and parmesan.',
        price: 18,
      ),
      Italian(
        name: 'Margherita Pizza',
        description: 'Classic pizza with tomato sauce and mozzarella.',
        price: 30,
      ),
    ];

    final List<Soup> soups = [
      Soup(
        name: 'Tomato Soup',
        description: 'Creamy tomato soup with basil.',
        price: 10,
      ),
      Soup(
        name: 'Chicken Noodle Soup',
        description: 'Classic chicken noodle soup.',
        price: 12,
      ),
      Soup(
        name: 'Minestrone',
        description: 'Italian vegetable soup with pasta.',
        price: 14,
      ),
      Soup(
        name: 'Clam Chowder',
        description: 'Creamy soup with clams and potatoes.',
        price: 16,
      ),
    ];

    final List<German> german = [
      German(
        name: 'Bratwurst',
        description: 'Grilled sausage with sauerkraut.',
        price: 15,
      ),
      German(
        name: 'Schnitzel',
        description: 'Breaded and fried pork cutlet.',
        price: 18,
      ),
      German(
        name: 'Pretzel',
        description: 'Soft baked pretzel with mustard.',
        price: 8,
      ),
      German(
        name: 'Sauerkraut',
        description: 'Fermented cabbage side dish.',
        price: 10,
      ),
    ];

    final List<Mexican> mexican = [
      Mexican(
        name: 'Tacos',
        description: 'Soft tortillas with meat, cheese, and salsa.',
        price: 12,
      ),
      Mexican(
        name: 'Burrito',
        description: 'Large tortilla filled with rice, beans, and meat.',
        price: 14,
      ),
      Mexican(
        name: 'Quesadilla',
        description: 'Grilled tortilla with cheese and meat.',
        price: 10,
      ),
      Mexican(
        name: 'Enchiladas',
        description: 'Tortillas rolled with meat and covered in sauce.',
        price: 16,
      ),
    ];

    final List<FoodItem> foodItems;
    switch (categoryId) {
      case '1':
        foodItems = pizzas;
        break;
      case '2':
        foodItems = burgers;
        break;
      case '3':
        foodItems = italian;
        break;
      case '4':
        foodItems = soups;
        break;
      case '5':
        foodItems = german;
        break;
      case '6':
        foodItems = mexican;
        break;
      default:
        foodItems = [];
    }

    return ListView.builder(
      itemCount: foodItems.length + 1, // Añadir 1 para el botón "Go to Cart"
      itemBuilder: (context, index) {
        if (index == foodItems.length) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderConfirmationScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Go to Cart'),
            ),
          );
        }
        return FoodCard(foodItem: foodItems[index]);
      },
    );
  }
}

class FoodItem {
  final String name;
  final String description;
  final double price;

  FoodItem({
    required this.name,
    required this.description,
    required this.price,
  });
}

class Pizza extends FoodItem {
  Pizza({
    required super.name,
    required super.description,
    required super.price,
  });
}

class Burger extends FoodItem {
  Burger({
    required super.name,
    required super.description,
    required super.price,
  });
}

class Italian extends FoodItem {
  Italian({
    required super.name,
    required super.description,
    required super.price,
  });
}

class Soup extends FoodItem {
  Soup({
    required super.name,
    required super.description,
    required super.price,
  });
}

class German extends FoodItem {
  German({
    required super.name,
    required super.description,
    required super.price,
  });
}

class Mexican extends FoodItem {
  Mexican({
    required super.name,
    required super.description,
    required super.price,
  });
}

class FoodCard extends StatelessWidget {
  final FoodItem foodItem;

  const FoodCard({
    super.key,
    required this.foodItem,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: const Color(0xFFFFE4E4),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodItem.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    foodItem.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${foodItem.price.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    context.read<CartProvider>().addItem(
                      CartItem(
                        foodId: foodItem.name,
                        quantity: 1,
                        size: 'Regular',
                        price: foodItem.price,
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${foodItem.name} added to cart'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Add'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}