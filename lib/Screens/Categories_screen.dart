// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../Models/Category.dart';

//Widget
import '../Widgets/Categories_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  final List<Category> _dataCategory = DUMMY_CATEGORIES;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (ctx, index) => CategoryItem(
          id: _dataCategory[index].id,
          title: _dataCategory[index].title,
          color: _dataCategory[index].color,
        ),
        itemCount: _dataCategory.length,
      ),
    );
  }
}
