class FoodCategory {
  final String id;
  final String title;
  final String image;
  final String description;
  final int rating;
  final bool isAvailable;

  const FoodCategory({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    this.rating = 0,
    this.isAvailable = true,
  });

  factory FoodCategory.fromJson(Map<String, dynamic> json) {
    return FoodCategory(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      description: json['description'],
      rating: json['rating'] ?? 0,
      isAvailable: json['isAvailable'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'description': description,
      'rating': rating,
      'isAvailable': isAvailable,
    };
  }
}