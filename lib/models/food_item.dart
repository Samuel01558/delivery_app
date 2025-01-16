class FoodItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final String image;
  final String categoryId;
  final List<String> ingredients;
  final int rating;
  final bool isAvailable;
  final List<String> sizes;
  final Map<String, double> sizesPrices;

  FoodItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.categoryId,
    this.ingredients = const [],
    this.rating = 0,
    this.isAvailable = true,
    this.sizes = const ['Regular'],
    required this.sizesPrices,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      image: json['image'],
      categoryId: json['categoryId'],
      ingredients: List<String>.from(json['ingredients'] ?? []),
      rating: json['rating'] ?? 0,
      isAvailable: json['isAvailable'] ?? true,
      sizes: List<String>.from(json['sizes'] ?? ['Regular']),
      sizesPrices: Map<String, double>.from(json['sizesPrices'] ?? {'Regular': json['price'].toDouble()}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'categoryId': categoryId,
      'ingredients': ingredients,
      'rating': rating,
      'isAvailable': isAvailable,
      'sizes': sizes,
      'sizesPrices': sizesPrices,
    };
  }
}
