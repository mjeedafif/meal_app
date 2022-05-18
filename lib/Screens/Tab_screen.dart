// ignore_for_file: file_names

import 'package:flutter/material.dart';

//Import screens
import './Categories_screen.dart';
import './Favoirate_screen.dart';
//Widget
import '../Widgets/DrawerWidget.dart';
//Models
import '../Models/Meal.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favItems;
  const TabScreen({@required this.favItems, Key key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _currentIndex = 0;
  List<Map<String, Object>> _screensRender;

  @override
  void initState() {
    _screensRender = [
      {
        'screen': const CategoriesScreen(),
        'title': "DaliMeal",
      },
      {
        'screen': FavoirateScreen(favItems: widget.favItems),
        'title': "Favoirate Meals",
      },
    ];
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screensRender[_currentIndex]['title'] as String),
      ),
      body: _screensRender[_currentIndex]['screen'] as Widget,
      drawer: const MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favoirate",
          ),
        ],
      ),
    );
  }
}
