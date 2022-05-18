// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meal_app/Models/Meal.dart';
import 'package:meal_app/dummy_data.dart';

//Screens
import './Screens/Tab_screen.dart';
import './Screens/category_meals_Screen.dart';
import './Screens/detail_item.dart';
import './Screens/Filter_screen.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main(List<String> args) {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filtter = {
    "vegan": false,
    "gluten": false,
    "vegetarian": false,
    "lactose": false
  };

  List<Meal> avaliableMeal = DUMMY_MEALS;
  List<Meal> favoirateMeals = [];

  //For filtter screen
  void _setFiltter(Map<String, bool> filtter) {
    setState(() {
      _filtter = filtter;

      avaliableMeal = DUMMY_MEALS.where((meal) {
        if (!meal.isGlutenFree && _filtter["gluten"] as bool) {
          return false;
        }
        if (!meal.isVegetarian && _filtter["vegetarian"] as bool) {
          return false;
        }
        if (!meal.isLactoseFree && _filtter["lactose"] as bool) {
          return false;
        }
        if (!meal.isVegan && _filtter["vegan"] as bool) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  //Foe favoirate screen
  void _toogleFavoirate(String id) {
    var exestingIndex = favoirateMeals.indexWhere((meal) => meal.id == id);

    if (exestingIndex >= 0) {
      setState(() {
        favoirateMeals.removeAt(exestingIndex);
      });
    } else {
      setState(() {
        favoirateMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == id));
      });
    }
  }

  bool _isFavoirate(String id) {
    return favoirateMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabScreen(favItems: favoirateMeals),
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        textTheme: TextTheme().copyWith(
          headline1: const TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
          headline2: const TextStyle(
            fontFamily: 'Ralewey',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      routes: {
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(
              avaliableMeals: avaliableMeal,
            ),
        DetailItemScreen.routeName: (ctx) => DetailItemScreen(
              toogleFavoirate: _toogleFavoirate,
              isFavoirate: _isFavoirate,
            ),
        FiltterScreen.routeName: (ctx) => FiltterScreen(
              toggleFiltter: _setFiltter,
              filtterData: _filtter,
            ),
      },
    );
  }
}
