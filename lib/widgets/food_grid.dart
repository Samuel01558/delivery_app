import 'package:flutter/material.dart';
import 'package:delivery_app/widgets/food_card.dart';

class FoodGrid extends StatelessWidget {
  const FoodGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: const [
        FoodCard(
          title: 'PIZZA',
          image: 'assets/images/pizza.jpg',
          rating: 5,
        ),
        FoodCard(
          title: 'FAST FOOD',
          image: 'assets/images/fastfood.jpg',
          rating: 5,
        ),
        FoodCard(
          title: 'ITALIAN',
          image: 'assets/images/italian.jpg',
          rating: 5,
        ),
        FoodCard(
          title: 'SOUP',
          image: 'assets/images/soup.jpg',
          rating: 5,
        ),
        FoodCard(
          title: 'GERMAN',
          image: 'assets/images/german.jpg',
          rating: 5,
        ),
        FoodCard(
          title: 'MEXICAN',
          image: 'assets/images/mexican.jpg',
          rating: 5,
        ),
      ],
    );
  }
}