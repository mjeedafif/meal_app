// ignore_for_file: file_names

import 'package:flutter/foundation.dart';

enum Affordability {
  Pricey,
  Affordable,
  Luxurious,
}

enum Complexity {
  Simple,
  Hard,
  Challenging,
}

class Meal {
  final String id;
  final String title;
  final List<String> categories;
  final Affordability affordability;
  final Complexity complexity;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  bool isGlutenFree;
  bool isVegan;
  bool isVegetarian;
  bool isLactoseFree;
  bool isFavoirate;

  Meal({
    @required this.id,
    @required this.title,
    @required this.categories,
    @required this.affordability,
    @required this.complexity,
    @required this.duration,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
    this.isFavoirate = false,
  });
}
