import 'package:flutter/material.dart';
import 'package:maxMeal/dummy_data.dart';
import 'package:maxMeal/model/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final Function toggleFilter;
  final Function isFavourite;
  MealDetailScreen({@required this.toggleFilter, @required this.isFavourite});
  static const route = "/meal-detail";
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> routeArgs =
        ModalRoute.of(context).settings.arguments;
    String mealId = routeArgs['id'] as String;
    bool deletable = routeArgs['deletable'] as bool;

    final Meal meal = selectedMeal(mealId);
    return Scaffold(
      floatingActionButton: deletable
          ? FloatingActionButton(
              child: CircleAvatar(
                child: Icon(Icons.delete),
              ),
              onPressed: () {
                Navigator.of(context).pop(mealId);
              },
            )
          : null,
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: isFavourite(mealId)
                  ? Icon(
                      Icons.star,
                      size: 29,
                    )
                  : Icon(Icons.star_border),
            ),
            onPressed: () {
              toggleFilter(mealId);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(
              context,
              text: "Ingredients",
            ),
            buildSectionIterableContent(
              child: ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(meal.ingredients[index]),
                  ),
                ),
                itemCount: meal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, text: "Steps"),
            buildSectionIterableContent(
              child: ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("# ${index + 1}"),
                      ),
                      title: Text("${meal.steps[index]}"),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: meal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildSectionTitle(BuildContext context, {@required String text}) {
  return Container(
    margin: EdgeInsets.symmetric(
      vertical: 10,
    ),
    child: Text(
      text,
      style: Theme.of(context).textTheme.headline6,
    ),
  );
}

Widget buildSectionIterableContent({@required Widget child}) {
  return Container(
    height: 200,
    width: 300,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.grey,
        width: 3,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    child: child,
  );
}
