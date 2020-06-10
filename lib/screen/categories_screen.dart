import 'package:flutter/material.dart';
import 'package:maxMeal/category_item.dart';
import '../dummy_data.dart';
import '../model/category.dart';

class CategoriesScreen extends StatelessWidget {
  static String route = "/categoriesScreen";
  @override
  Widget build(BuildContext context) {
    print("CategoriesScreen build");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: CircleAvatar(
          child: Icon(Icons.add),
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          ),
        ],
        title: Text("Modern Meal App"),
      ),
      body: SafeArea(
        child: GridView(
          padding: EdgeInsets.all(25.0),
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
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
      ),
    );
  }
}
