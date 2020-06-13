import 'package:flutter/material.dart';
import '../screens/favourite_meal_detail_screen.dart';
import '../model/meal.dart';

class FavouriteMealItem extends StatelessWidget {
  final String id;
  final String title;
  final String url;
  final Affordability affordability;
  final String duration;
  final Function toggleFavouriteNOTMAIN;

  String get printAffordability {
    switch (affordability) {
      case Affordability.Affordable:
        {
          return "Affordable";
        }
        break;
      case Affordability.Pricey:
        {
          return "Pricey";
        }
        break;
      case Affordability.Luxurious:
        {
          return "Luxurious";
        }
        break;
      default:
        {
          return "NA";
        }
    }
  }

  FavouriteMealItem({
    @required this.url,
    @required this.affordability,
    @required this.duration,
    @required this.title,
    @required this.id,
    @required this.toggleFavouriteNOTMAIN,
  });
  void selectMeal(BuildContext context) {
    Navigator.pushNamed(context, FavouriteMealDetailScreen.route, arguments: {
      "id": id,
      "toggleFavouriteNOTMAIN": toggleFavouriteNOTMAIN
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        child: Column(
          children: [
            Stack(
              // alignment: Alignment.bottomRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image(
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                    image: NetworkImage(
                      url,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    color: Colors.black54,
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Text(
                        title,
                        // softWrap: true,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.timer,
                      ),
                      Text('$duration mins'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      Text(printAffordability),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.airport_shuttle),
                      Text('15 mins'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
