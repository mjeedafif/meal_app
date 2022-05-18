import 'package:flutter/material.dart';
import 'package:meal_app/Models/Meal.dart';

//Screen
import '../Screens/detail_item.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    Key key,
    @required this.id,
    @required this.imageUrl,
    @required this.title,
    @required this.duration,
    @required this.affordability,
    @required this.complexity,
  }) : super(key: key);

  String get _getAfforability {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      default:
        return "Unknown";
    }
  }

  String get _getComplexity {
    switch (complexity) {
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      case Complexity.Simple:
        return "Simple";
        break;
      default:
        return "Unknown";
    }
  }

  Widget _buildRows(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 6,
        ),
        Text(title),
      ],
    );
  }

  void _detailTapped(BuildContext context) {
    Navigator.of(context).pushNamed(DetailItemScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: InkWell(
        onTap: () => _detailTapped(context),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250,
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 190,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headline2,
                      overflow: TextOverflow.clip,
                      softWrap: true,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildRows(Icons.work, _getComplexity),
                  _buildRows(
                      Icons.access_time_filled_sharp, duration.toString()),
                  _buildRows(Icons.monetization_on, _getAfforability),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
