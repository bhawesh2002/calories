import 'package:calories/ui/home/views/home.dart';
import 'package:calories/ui/recipe/views/recipe_details_page.dart';
import 'package:calories/ui/recipe/views/recipes_page.dart';
import 'package:calories/ui/splash/views/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const splash = "/";
  static const home = '/home';
  static const recipes = '/recipes';
  static const recipeDetails = '$recipes/details';

  static final Map<String, WidgetBuilder> routesMap = <String, WidgetBuilder>{
    splash: (context) => SplashScreen(),
    home: (context) => Home(),
    recipes: (context) => RecipesPage(),
    recipeDetails: (context) => RecipeDetailsPage(),
  };
}
