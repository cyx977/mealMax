import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:maxMeal/screen/category_meals-screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;

  CategoryItem({
    this.title,
    this.id,
    this.color,
  });

  _mealPage(BuildContext context) {
    Navigator.pushNamed(
      context,
      CategoryMealsScreen.route,
      arguments: {
        'color': color,
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _mealPage(context),
      splashColor: Colors.black,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color.withOpacity(0.6),
              color,
            ],
          ),
        ),
      ),
    );
  }
}
