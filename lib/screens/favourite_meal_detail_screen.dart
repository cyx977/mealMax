import 'package:flutter/material.dart';
import 'package:maxMeal/dummy_data.dart';
import 'package:maxMeal/model/meal.dart';

class FavouriteMealDetailScreen extends StatelessWidget {
  final Function isFavourite;
  // final Function toggleFavourite;

  FavouriteMealDetailScreen({
    // @required this.toggleFavourite,
    @required this.isFavourite,
  });
  static const route = "/favourite-meal-detail";
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> routeArgs = ModalRoute.of(context).settings.arguments;
    String mealId = routeArgs['id'] as String;
    Function toggleFavouriteNOTMAIN = routeArgs['toggleFavouriteNOTMAIN'];

    final Meal meal = selectedMeal(mealId);
    return Scaffold(
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
              toggleFavouriteNOTMAIN(mealId);
              // toggleFavourite(mealId);
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
