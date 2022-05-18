// ignore_for_file: file_names

import 'package:flutter/material.dart';

//Data
import '../dummy_data.dart';
//Model
import '../Models/Meal.dart';
//Widget
import '../Widgets/meal_item.dart';

class FavoirateScreen extends StatelessWidget {
  final List<Meal> favItems;
  const FavoirateScreen({@required this.favItems, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return favItems.isEmpty
        ? const Center(child: Text("No Faviorate meals !"))
        : ListView.builder(
            itemBuilder: (ctx, index) => MealItem(
              id: favItems[index].id,
              imageUrl: favItems[index].imageUrl,
              title: favItems[index].title,
              duration: favItems[index].duration,
              affordability: favItems[index].affordability,
              complexity: favItems[index].complexity,
            ),
            itemCount: favItems.length,
          );
  }
}
