import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'model/category.dart';

class CategoriesScreen extends StatelessWidget {
  static String route = "/categoriesScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView(
          children: [
            ...DUMMY_CATEGORIES.map(
              (Category category) => Container(
                decoration: BoxDecoration(
                  color: category.color,
                ),
                child: Text(
                  category.title,
                ),
              ),
            ),
          ],
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          padding: EdgeInsets.only(
            top: 100,
          ),
        ),
      ),
    );
  }
}
