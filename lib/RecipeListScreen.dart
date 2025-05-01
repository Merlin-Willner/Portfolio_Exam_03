import 'package:flutter/material.dart';
import 'package:recipe_app/RecipeDetailScreen.dart';

class RecipeListScreen extends StatelessWidget {
  final String category;
  final List<dynamic> recipes;
  const RecipeListScreen({
    super.key,
    required this.category,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
    final filteredRecipes =
        recipes.where((r) => r['category'] == category).toList();

    return Scaffold(
      appBar: AppBar(title: Text('$category Recipes')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: filteredRecipes.length,
        itemBuilder: (context, index) {
          final recipe = filteredRecipes[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                recipe['name'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => RecipeDetailScreen(recipe: recipe),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
