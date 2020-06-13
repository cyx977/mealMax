import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../model/meal.dart';

class FavouriteScreen extends StatefulWidget {
  static final route = "/favourite";
  final List<Meal> favouriteMeal;

  FavouriteScreen({this.favouriteMeal});

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.favouriteMeal.isEmpty
          ? Center(
              child: Text("Favourites is empty, Start adding some"),
            )
          : Center(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return MealItem(
                    id: widget.favouriteMeal[index].id,
                    title: widget.favouriteMeal[index].title,
                    url: widget.favouriteMeal[index].imageUrl,
                    affordability: widget.favouriteMeal[index].affordability,
                    duration: widget.favouriteMeal[index].duration.toString(),
                  );
                },
                itemCount: widget.favouriteMeal.length,
              ),
            ),
    );
  }
}
