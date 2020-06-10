import 'package:flutter/material.dart';
import 'package:maxMeal/widgets/meal_item.dart';
import './testscreen.dart';
import '../dummy_data.dart';
import '../model/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  static final String route = "/category-meals";
  // final String id;
  // final String title;
  // final Color color;

  // CategoryMealsScreen({@required this.id, @required this.title, @required this.color});

  @override
  Widget build(BuildContext context) {
    print("categoryMealsScreen build");

    Map<String, dynamic> routeArgs = ModalRoute.of(context).settings.arguments;

    String id = routeArgs['id'];
    String title = routeArgs['title'];

    List<Meal> catMealData = categoryMeals(id).toList();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, TestScreen.route);
        },
        child: CircleAvatar(
          child: Icon(
            Icons.phone_in_talk,
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            title: catMealData[index].title,
            url: catMealData[index].imageUrl,
            affordability: catMealData[index].affordability.toString(),
            duration: catMealData[index].duration.toString(),
          );
        },
        itemCount: catMealData.length,
      ),
    );
  }
}
