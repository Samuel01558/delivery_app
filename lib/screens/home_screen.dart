import 'package:flutter/material.dart';
import 'package:delivery_app/screens/product_list_screen.dart';
import 'package:delivery_app/widgets/custom_bottom_nav.dart';
import 'package:delivery_app/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const CustomSearchBar(),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            padding: const EdgeInsets.symmetric(vertical: 12),
            color: const Color(0xFFFFE4E4),
            width: double.infinity,
            child: const Center(
              child: Text(
                'Food Offers',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _buildCategoryItem(context, 'Pizza', 'assets/images/pizza.jpg', '1'),
                _buildCategoryItem(context, 'Fast Food', 'assets/images/fastfood.jpg', '2'),
                _buildCategoryItem(context, 'Italian', 'assets/images/italian.jpg', '3'),
                _buildCategoryItem(context, 'Soup', 'assets/images/soup.jpg', '4'),
                _buildCategoryItem(context, 'German', 'assets/images/german.jpg', '5'),
                _buildCategoryItem(context, 'Mexican', 'assets/images/mexican.jpg', '6'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNav(),
    );
  }

  Widget _buildCategoryItem(BuildContext context, String title, String imagePath, String categoryId) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductListScreen(categoryId: categoryId),
          ),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}