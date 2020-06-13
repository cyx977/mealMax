import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/favourite_meal_item.dart';
import '../model/meal.dart';

class FavouriteScreen extends StatefulWidget {
  static final route = "/favourite";
  final List<Meal> favouriteMeal;

  FavouriteScreen({this.favouriteMeal});

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<Meal> favouriteMealX;

  @override
  void didChangeDependencies() {
    favouriteMealX = [...widget.favouriteMeal];
    super.didChangeDependencies();
  }

  void toggleFavouriteNOTMAIN(String mealId) {
    int _existingMeal = favouriteMealX.indexWhere((meal) => meal.id == mealId);
    if (_existingMeal >= 0) {
      print("removing from NOTmain");
      setState(() {
        favouriteMealX.removeAt(_existingMeal);
      });
    } else {
      print("addming from NOTmain");
      setState(() {
        favouriteMealX.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("main's ${widget.favouriteMeal}");
    print("not main $favouriteMealX");
    return Container(
      child: favouriteMealX.isEmpty
          ? Center(
              child: Text("Favourites is empty, Start adding some"),
            )
          : Center(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return FavouriteMealItem(
                    id: favouriteMealX[index].id,
                    title: favouriteMealX[index].title,
                    url: favouriteMealX[index].imageUrl,
                    affordability: favouriteMealX[index].affordability,
                    duration: favouriteMealX[index].duration.toString(),
                    toggleFavouriteNOTMAIN: toggleFavouriteNOTMAIN,
                    isFavourite: favouriteMealX.contains(favouriteMealX[index]),
                  );
                },
                itemCount: favouriteMealX.length,
              ),
            ),
    );
  }
}
