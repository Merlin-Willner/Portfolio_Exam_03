import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:recipe_app/CategoryScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final recipes = await loadRecipes();
  runApp(RecipeApp(recipes: recipes));
}

Future<List<dynamic>> loadRecipes() async {
  final String jsonString = await rootBundle.loadString(
    'assets/data/recipes.json',
  );
  final Map<String, dynamic> data = jsonDecode(jsonString);
  return data['recipes'];
}

class RecipeApp extends StatelessWidget {
  final List<dynamic> recipes;
  const RecipeApp({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: CategoryScreen(recipes: recipes),
    );
  }
}
