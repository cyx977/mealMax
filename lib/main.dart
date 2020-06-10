import 'package:flutter/material.dart';
import 'package:maxMeal/screens/error_screen.dart';
import 'package:maxMeal/screens/meal_detail_screen.dart';
import 'package:maxMeal/screens/my_homepage.dart';

import 'package:maxMeal/screens/categories_screen.dart';
import 'package:maxMeal/screens/category_meals_screen.dart';

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
        canvasColor: Colors.yellow[50].withOpacity(0.8),
      ),
      routes: {
        MyHomePage.route: (context) => MyHomePage(title: "Modern Meal App"),
        CategoriesScreen.route: (context) => CategoriesScreen(),
        CategoryMealsScreen.route: (context) => CategoryMealsScreen(),
        MealDetailScreen.route: (context) => MealDetailScreen(),
      },
      onGenerateRoute: (settings) {
        print(settings.name);
        var generatedRouteArgs = settings.arguments;
        print(generatedRouteArgs);
        return MaterialPageRoute(
          builder: (context) => ErrorPage(),
        );
      },
    );
  }
}
