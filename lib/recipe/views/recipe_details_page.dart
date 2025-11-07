import 'package:flutter/material.dart';

class RecipeDetailsPage extends StatefulWidget {
  const RecipeDetailsPage({super.key});

  @override
  State<RecipeDetailsPage> createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  late final String? recipeId;

  @override
  Widget build(BuildContext context) {
    recipeId ??= ModalRoute.of(context)?.settings.arguments as String?;
    return const Placeholder();
  }
}
