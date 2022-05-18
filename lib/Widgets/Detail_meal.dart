// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DetailMeal extends StatelessWidget {
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  const DetailMeal({
    Key key,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Ingredients",
            style: Theme.of(context).textTheme.headline1,
          ),
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(10),
            width: 300,
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListView.builder(
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(ingredients[index]),
                ),
              ),
              itemCount: ingredients.length,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Steps",
            style: Theme.of(context).textTheme.headline1,
          ),
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            width: 300,
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("# ${index + 1}"),
                    ),
                    title: Text(steps[index]),
                  ),
                  const Divider()
                ],
              ),
              itemCount: steps.length,
            ),
          ),
        ],
      ),
    );
  }
}
