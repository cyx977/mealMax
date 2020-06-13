import 'package:flutter/material.dart';
import './screens/favourite_meal_detail_screen.dart';
import './screens/error_screen.dart';
import './screens/filter_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/my_homepage.dart';

import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';

import './model/meal.dart';
import './dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "isGlutenFree": false,
    "isVegan": false,
    "isVegeterian": false,
    "isLactoseFree": false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void toggleFavourite(String mealId) {
    int _existingMeal = _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (_existingMeal >= 0) {
      print("removing from main");
      setState(() {
        _favouriteMeals.removeAt(_existingMeal);
      });
    } else {
      print("adding from main");
      setState(() {
        _favouriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
    print("main $_favouriteMeals");
  }

  bool isFavourite(String mealId) {
    return _favouriteMeals.any((meal) => meal.id == mealId);
  }

  void _saveFilters(Map<String, bool> filterArg) {
    setState(() {
      _filters = filterArg;
      availableMeals = DUMMY_MEALS;
      availableMeals = availableMeals.where((Meal meal) {
        if (_filters['isGlutenFree'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['isVegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['isVegeterian'] && !meal.isVegeterian) {
          return false;
        }
        if (_filters['isLactoseFree'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 20,
          ),
        ),
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: Colors.yellow[50].withOpacity(0.8),
      ),
      routes: {
        MyHomePage.route: (context) => MyHomePage(
            title: "Modern Meal App", favouriteMeal: _favouriteMeals),
        CategoriesScreen.route: (context) => CategoriesScreen(),
        CategoryMealsScreen.route: (context) =>
            CategoryMealsScreen(availableMeals: availableMeals),
        MealDetailScreen.route: (context) => MealDetailScreen(
            toggleFavourite: toggleFavourite, isFavourite: isFavourite),
        FiltersScreen.route: (context) => FiltersScreen(
              saveFilterFunction: _saveFilters,
              filters: _filters,
            ),
        FavouriteMealDetailScreen.route: (context) => FavouriteMealDetailScreen(
              isFavourite: isFavourite,
              toggleFavourite: toggleFavourite,
            ),
      },
      onGenerateRoute: (RouteSettings settings) {
        print("onGenerateRoute");
        print(settings.name);
        var generatedRouteArgs = settings.arguments;
        print(generatedRouteArgs);
        // return MaterialPageRoute(
        //   builder: (context) => ErrorPage(),
        // );
      },
      onUnknownRoute: (RouteSettings settings) {
        //this is triggered when nothing works
        print("onUnknownRoute");
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
