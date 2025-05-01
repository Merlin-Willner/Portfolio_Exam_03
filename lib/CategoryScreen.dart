import 'package:flutter/material.dart';
import 'package:recipe_app/RecipeListScreen.dart';

class CategoryScreen extends StatelessWidget {
  final List<dynamic> recipes;
  const CategoryScreen({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    final categories =
        recipes.map((r) => r['category'] as String).toSet().toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children:
              categories.map((category) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => RecipeListScreen(
                              category: category,
                              recipes: recipes,
                            ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        category.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
