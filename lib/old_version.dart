import 'package:flutter/material.dart';
import 'location_page.dart'; // Ensure LocationIntegrationPage is correctly imported
import 'media_processing_page.dart'; // Ensure MediaProcessingPage is correctly imported


void main() {
  runApp(const FoodDeliveryApp());
}

class FoodDeliveryApp extends StatelessWidget {
  const FoodDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: const SafeArea(
        child: FoodTypeSection(),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      floatingActionButton: PopupMenuButton<int>(
  onSelected: (value) {
    if (value == 1) {
      // Navegar a MediaProcessingPage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MediaProcessingPage()),
      );
    } else if (value == 2) {
      // Navegar a LocationIntegrationPage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LocationIntegrationPage()),
      );
    }
  },
  itemBuilder: (context) => [
    const PopupMenuItem(
      value: 1,
      child: Text('Image/Video Processing'),
    ),
    const PopupMenuItem(
      value: 2,
      child: Text('Location Integration'),
    ),
  ],
  icon: const Icon(Icons.more_vert),
),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: _buildSearchField(),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search food",
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class FoodTypeSection extends StatelessWidget {
  const FoodTypeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Food Categories',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FoodCategoriesGrid(),
          ),
        ),
      ],
    );
  }
}

class FoodCategoriesGrid extends StatelessWidget {
  FoodCategoriesGrid({super.key});

  final List<FoodCategory> categories = [
    FoodCategory(
      name: 'Pizza',
      image: 'assets/pizza.jpg',
      color: Colors.red[100]!,
    ),
    FoodCategory(
      name: 'Drinks',
      image: 'assets/drinks.jpg',
      color: Colors.blue[100]!,
    ),
    FoodCategory(
      name: 'Fast Food',
      image: 'assets/fastfood.jpg',
      color: Colors.green[100]!,
    ),
    FoodCategory(
      name: 'Mexican',
      image: 'assets/mexican.jpg',
      color: Colors.orange[100]!,
    ),
    FoodCategory(
      name: 'Italian',
      image: 'assets/italian.jpg',
      color: Colors.purple[100]!,
    ),
    FoodCategory(
      name: 'German',
      image: 'assets/german.jpg',
      color: Colors.brown[100]!,
    ),
    FoodCategory(
      name: 'Dessert',
      image: 'assets/dessert.jpg',
      color: Colors.pink[100]!,
    ),
    FoodCategory(
      name: 'Salad',
      image: 'assets/salad.jpg',
      color: Colors.lime[100]!,
    ),
    FoodCategory(
      name: 'Soup',
      image: 'assets/soup.jpg',
      color: Colors.teal[100]!,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) => categories[index],
    );
  }
}

class FoodCategory extends StatelessWidget {
  final String name;
  final String image;
  final Color color;

  const FoodCategory({
    super.key,
    required this.name,
    required this.image,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Browse',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
