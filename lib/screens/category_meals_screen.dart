import 'package:flutter/material.dart';
import 'package:maxMeal/widgets/meal_item.dart';
// import '../dummy_data.dart';
import '../model/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static final String route = "/category-meals";
  final List<Meal> availableMeals;
  CategoryMealsScreen({@required this.availableMeals});

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String id;
  String title;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    //every initState triggers didChangeDependencies so the data would be loaded again and again
    if (!_loadedInitData) {
      Map<String, dynamic> routeArgs =
          ModalRoute.of(context).settings.arguments;
      id = routeArgs['id'];
      title = routeArgs['title'];
      // displayedMeals = categoryMeals(id).toList();
       var dummy = widget.availableMeals
          .where((Meal meal) => meal.categories.contains(id)).toList();
      displayedMeals = dummy
          .map(
            (e) => Meal(
              affordability: e.affordability,
              categories: e.categories,
              complexity: e.complexity,
              duration: e.duration,
              id: e.id,
              imageUrl: e.imageUrl,
              ingredients: e.ingredients,
              isGlutenFree: e.isGlutenFree,
              isLactoseFree: e.isLactoseFree,
              isVegan: e.isVegan,
              isVegeterian: e.isVegeterian,
              steps: e.steps,
              title: e.title,
            ),
          )
          .toList();
    }
    _loadedInitData = true;
    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((Meal meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "asdasd");
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
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            url: displayedMeals[index].imageUrl,
            affordability: displayedMeals[index].affordability,
            duration: displayedMeals[index].duration.toString(),
            removeItem: removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
