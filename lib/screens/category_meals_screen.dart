import 'package:flutter/material.dart';
import 'package:maxMeal/widgets/meal_item.dart';
import '../dummy_data.dart';
import '../model/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static final String route = "/category-meals";

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String id;
  String title;
  List<Meal> displayedMeals;
  var _loadedInitData = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    //every initState triggers didChangeDependencies so the data would be loaded again and again
    if (_loadedInitData == false) {
      Map<String, dynamic> routeArgs =
          ModalRoute.of(context).settings.arguments;
      id = routeArgs['id'];
      title = routeArgs['title'];
      displayedMeals = categoryMeals(id).toList();
    }
    _loadedInitData = true;
    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
    displayedMeals.removeWhere((Meal meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            url: displayedMeals[index].imageUrl,
            affordability: displayedMeals[index].affordability,
            duration: displayedMeals[index].duration.toString(),
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
