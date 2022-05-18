// ignore_for_file: file_names

import 'package:flutter/material.dart';

//Screen push
import '../Screens/category_meals_Screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;
  const CategoryItem({
    Key key,
    @required this.id,
    @required this.title,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.7),
            color,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(10),
      // margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            CategoryMealScreen.routeName,
            arguments: {'id': id, 'title': title},
          );
        },
        borderRadius: BorderRadius.circular(15),
        splashColor: Theme.of(context).accentColor,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
