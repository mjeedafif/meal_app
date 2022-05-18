import 'package:flutter/material.dart';
//Data
import '../dummy_data.dart';
//Widget
import '../Widgets/Detail_meal.dart';

class DetailItemScreen extends StatelessWidget {
  static String routeName = "/detail-item";
  final Function(String id) toogleFavoirate;
  final Function(String id) isFavoirate;
  const DetailItemScreen({
    @required this.toogleFavoirate,
    @required this.isFavoirate,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _idRoute = ModalRoute.of(context).settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((meals) => meals.id == _idRoute);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: DetailMeal(
        imageUrl: meal.imageUrl,
        ingredients: meal.ingredients,
        steps: meal.steps,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toogleFavoirate(_idRoute),
        child: isFavoirate(_idRoute)
            ? const Icon(Icons.star)
            : const Icon(Icons.star_border),
      ),
    );
  }
}
