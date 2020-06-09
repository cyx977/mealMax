import 'package:flutter/material.dart';
import 'package:maxMeal/category_item.dart';
import 'dummy_data.dart';
import 'model/category.dart';

class CategoriesScreen extends StatelessWidget {
  static String route = "/categoriesScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: CircleAvatar(
          child: Icon(Icons.add),
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
          ),
        ],
        title: Text("Modern Meal App"),
      ),
      body: SafeArea(
        child: GridView(
          children: [
            ...DUMMY_CATEGORIES.map(
              (Category category) => CategoryItem(
                color: category.color,
                id: category.id,
                title: category.title,
              ),
            ),
          ],
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 3.5,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
        ),
      ),
    );
  }
}
