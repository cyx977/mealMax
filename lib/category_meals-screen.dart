import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static final String route = "/category-meals";
  // final String id;
  // final String title;
  // final Color color;

  // CategoryMealsScreen({@required this.id, @required this.title, @required this.color});

  @override
  Widget build(BuildContext context) {
  Map<String,dynamic>  routeArgs = ModalRoute.of(context).settings.arguments;

  String title = routeArgs['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          'The Recipes For The Category $title!',
        ),
      ),
    );
  }
}
