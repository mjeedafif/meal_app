// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../Models/Meal.dart';
import '../dummy_data.dart';

//import widget
import '../Widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  static String routeName = "/Category-meal";
  List<Meal> avaliableMeals;
  CategoryMealScreen({@required this.avaliableMeals, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dataRoute =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final List<Meal> _mealsList = avaliableMeals
        .where(
          (meals) => meals.categories.contains(
            _dataRoute['id'],
          ),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(_dataRoute['title'] as String),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => MealItem(
          id: _mealsList[index].id,
          imageUrl: _mealsList[index].imageUrl,
          title: _mealsList[index].title,
          duration: _mealsList[index].duration,
          affordability: _mealsList[index].affordability,
          complexity: _mealsList[index].complexity,
        ),
        itemCount: _mealsList.length,
      ),
    );
  }
}
