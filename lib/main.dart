
import 'package:flutter/material.dart';
import 'package:maxMeal/screen/my_homepage.dart';

import 'package:maxMeal/screen/categories_screen.dart';
import 'package:maxMeal/screen/category_meals-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        MyHomePage.route : (context) => MyHomePage(title: "Modern Meal App",),
        CategoriesScreen.route: (context) => CategoriesScreen(),
        CategoryMealsScreen.route: (context) => CategoryMealsScreen(),
      },
    );
  }
}


